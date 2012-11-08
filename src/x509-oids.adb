--
--  Copyright (C) 2012 secunet Security Networks AG
--  Copyright (C) 2012 Reto Buerki <reet@codelabs.ch>
--
--  This program is free software; you can redistribute it and/or modify it
--  under the terms of the GNU General Public License as published by the
--  Free Software Foundation; either version 2 of the License, or (at your
--  option) any later version.  See <http://www.fsf.org/copyleft/gpl.txt>.
--
--  This program is distributed in the hope that it will be useful, but
--  WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
--  or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
--  for more details.
--
--  As a special exception, if other files instantiate generics from this
--  unit,  or  you  link  this  unit  with  other  files  to  produce  an
--  executable   this  unit  does  not  by  itself  cause  the  resulting
--  executable to  be  covered by the  GNU General  Public License.  This
--  exception does  not  however  invalidate  any  other reasons why  the
--  executable file might be covered by the GNU Public License.
--

with Ada.Strings.Fixed;
with Ada.Strings.Unbounded;
with Ada.Containers.Indefinite_Ordered_Maps;

with System;

with Interfaces.C;

package body X509.Oids
is

   package C renames Interfaces.C;

   type Int_Array is array (C.int range <>) of C.int;

   package Map_Package is new Ada.Containers.Indefinite_Ordered_Maps
     (Key_Type     => Int_Array,
      Element_Type => Oid_Type);

   Oid_Map : Map_Package.Map;
   --  Integer array to OID mapping.

   function To_String (Item : Int_Array) return String;
   --  Convert given integer array to OID string.

   -------------------------------------------------------------------------

   function To_Ada
     (Asn_Oid : OBJECT_IDENTIFIER_h.OBJECT_IDENTIFIER_t)
      return Oid_Type
   is
      use type C.int;
      use type C.unsigned;

      Local_Oid : aliased OBJECT_IDENTIFIER_h.OBJECT_IDENTIFIER_t := Asn_Oid;
      Slots     : C.int
        := OBJECT_IDENTIFIER_h.OBJECT_IDENTIFIER_get_arcs
          (u_oid           => Local_Oid'Access,
           u_arcs          => System.Null_Address,
           u_arc_type_size => C.int'Size / 8,
           u_arc_slots     => 0);
      Ints  : Int_Array (1 .. Slots);
   begin
      if Slots = -1 then
         raise Conversion_Error with "ASN.1 OID invalid";
      end if;

      Slots := OBJECT_IDENTIFIER_h.OBJECT_IDENTIFIER_get_arcs
        (u_oid           => Local_Oid'Access,
         u_arcs          => Ints'Address,
         u_arc_type_size => C.int'Size / 8,
         u_arc_slots     => C.unsigned (Slots));

      begin
         return Oid_Map.Element (Key => Ints);
      exception
         when Constraint_Error =>
            raise Conversion_Error with "Unsupported OID: "
              & To_String (Item => Ints);
      end;
   end To_Ada;

   -------------------------------------------------------------------------

   function To_String (Item : Int_Array) return String
   is
      use Ada.Strings.Unbounded;
      use type C.int;

      Result : Unbounded_String;
   begin
      for I in Item'Range loop
         Result := Result & Ada.Strings.Fixed.Trim
           (Source => Item (I)'Img,
            Side   => Ada.Strings.Left);
         if I /= Item'Last then
            Result := Result & ".";
         end if;
      end loop;

      return To_String (Result);
   end To_String;

begin
   Oid_Map.Insert (Key      => (1, 2, 840, 113549, 1, 1, 1),
                   New_Item => rsaEncryption);

   Oid_Map.Insert (Key      => (1, 2, 840, 113549, 1, 1, 5),
                   New_Item => sha1WithRSAEncryption);
   Oid_Map.Insert (Key      => (1, 2, 840, 113549, 1, 1, 11),
                   New_Item => sha256WithRSAEncryption);

   Oid_Map.Insert (Key      => (2, 5, 4, 3),
                   New_Item => commonName);
   Oid_Map.Insert (Key      => (2, 5, 4, 6),
                   New_Item => countryName);
   Oid_Map.Insert (Key      => (2, 5, 4, 11),
                   New_Item => organizationalUnitName);
   Oid_Map.Insert (Key      => (2, 5, 4, 10),
                   New_Item => organizationName);
   Oid_Map.Insert (Key      => (2, 5, 29, 14),
                   New_Item => subjectKeyIdentifier);
   Oid_Map.Insert (Key      => (2, 5, 29, 15),
                   New_Item => keyUsage);
   Oid_Map.Insert (Key      => (2, 5, 29, 17),
                   New_Item => subjectAltName);
   Oid_Map.Insert (Key      => (2, 5, 29, 19),
                   New_Item => basicConstraints);
   Oid_Map.Insert (Key      => (2, 5, 29, 31),
                   New_Item => cRLDistributionPoints);
   Oid_Map.Insert (Key      => (2, 5, 29, 35),
                   New_Item => authorityKeyIdentifier);
end X509.Oids;
