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

   function To_Ada (Asn_Oid : Asn_Oid_Handle) return Oid_Type
   is
      use type C.int;
      use type C.unsigned;

      Slots : C.int
        := OBJECT_IDENTIFIER_h.OBJECT_IDENTIFIER_get_arcs
          (u_oid           => Asn_Oid,
           u_arcs          => System.Null_Address,
           u_arc_type_size => C.int'Size / 8,
           u_arc_slots     => 0);
      Ints  : Int_Array (1 .. Slots);
   begin
      if Slots = -1 then
         raise Conversion_Error with "ASN.1 OID invalid";
      end if;

      Slots := OBJECT_IDENTIFIER_h.OBJECT_IDENTIFIER_get_arcs
        (u_oid           => Asn_Oid,
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
end X509.Oids;
