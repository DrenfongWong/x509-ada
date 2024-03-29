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

with Ada.Strings.Unbounded;

with System.Storage_Elements;

with Interfaces.C;

with AttributeTypeAndValue_h;
with RelativeDistinguishedName_h;
with X520CommonName_h;
with X520OrganizationName_h;
with X520countryName_h;
with X520OrganizationalUnitName_h;

with X509.Utils;
with X509.Oids;
with X509.Decoder;
with X509.Constraints;

package body X509.Names
is

   use Ada.Strings.Unbounded;

   package C renames Interfaces.C;

   function Decode_X520
     (Oid    : Oids.Oid_Type;
      Buffer : System.Address;
      Size   : Positive)
      return String;
   --  Decode X520 name.

   function Decode_Common_Name
     (Buffer : System.Address;
      Size   : Positive)
      return String;
   --  Decode and check X520CommonName.

   function Decode_Country_Name
     (Buffer : System.Address;
      Size   : Positive)
      return String;
   --  Decode and check X520countryName.

   function Decode_Organizational_Unit_Name
     (Buffer : System.Address;
      Size   : Positive)
      return String;
   --  Decode and check X520OrganizationalUnitName.

   function Decode_Organization_Name
     (Buffer : System.Address;
      Size   : Positive)
      return String;
   --  Decode and check X520OrganizationName.

   -------------------------------------------------------------------------

   function Decode_Common_Name
     (Buffer : System.Address;
      Size   : Positive)
      return String
   is
      use X520CommonName_h;

      type Common_Name_Access is access all X520CommonName_t;

      Data : Common_Name_Access;
   begin
      Decoder.Decode
        (Type_Descriptor  => asn_DEF_X520CommonName'Access,
         Type_Handle_Addr => Data'Address,
         Buffer           => Buffer,
         Buffer_Size      => Size,
         Error_Prefix     => "X520CommonName decoding failed");
      Constraints.Check
        (Type_Descriptor => asn_DEF_X520CommonName'Access,
         Address         => Data.all'Address,
         Error_Prefix    => "X520CommonName validation failed");

      case Data.present is
         when X520CommonName_PR_printableString =>
            return S : constant String := "CN=" & Utils.To_String
              (Address => Data.choice.printableString.buf.all'Address,
               Size    => Data.choice.printableString.size)
            do
               asn_DEF_X520CommonName.free_struct
                 (asn_DEF_X520CommonName'Address, Data.all'Address, 0);
            end return;
         when X520CommonName_PR_teletexString =>
            return S : constant String := "CN=" & Utils.To_String
              (Address => Data.choice.teletexString.buf.all'Address,
               Size    => Data.choice.teletexString.size)
            do
               asn_DEF_X520CommonName.free_struct
                 (asn_DEF_X520CommonName'Address, Data.all'Address, 0);
            end return;
         when X520CommonName_PR_utf8String =>
            return S : constant String := "CN=" & Utils.To_String
              (Address => Data.choice.utf8String.buf.all'Address,
               Size    => Data.choice.utf8String.size)
            do
               asn_DEF_X520CommonName.free_struct
                 (asn_DEF_X520CommonName'Address, Data.all'Address, 0);
            end return;
         when others =>
            asn_DEF_X520CommonName.free_struct
              (asn_DEF_X520CommonName'Address, Data.all'Address, 0);
            raise Conversion_Error with "X520CommonName contains unsupported "
              & "string type";
      end case;
   end Decode_Common_Name;

   -------------------------------------------------------------------------

   function Decode_Country_Name
     (Buffer : System.Address;
      Size   : Positive)
      return String
   is
      use X520countryName_h;

      type Country_Name_Access is access all X520countryName_t;

      Data : Country_Name_Access;
   begin
      Decoder.Decode
        (Type_Descriptor  => asn_DEF_X520countryName'Access,
         Type_Handle_Addr => Data'Address,
         Buffer           => Buffer,
         Buffer_Size      => Size,
         Error_Prefix     => "X520countryName decoding failed");
      Constraints.Check
        (Type_Descriptor => asn_DEF_X520countryName'Access,
         Address         => Data.all'Address,
         Error_Prefix    => "X520countryName validation failed");

      return S : constant String := "C=" & Utils.To_String
        (Address => Data.buf.all'Address,
         Size    => Data.size)
      do
         asn_DEF_X520countryName.free_struct
           (asn_DEF_X520countryName'Address, Data.all'Address, 0);
      end return;
   end Decode_Country_Name;

   -------------------------------------------------------------------------

   function Decode_Organization_Name
     (Buffer : System.Address;
      Size   : Positive)
      return String
   is
      use X520OrganizationName_h;

      type Org_Name_Access is access all X520OrganizationName_t;

      Data : Org_Name_Access;
   begin
      Decoder.Decode
        (Type_Descriptor  => asn_DEF_X520OrganizationName'Access,
         Type_Handle_Addr => Data'Address,
         Buffer           => Buffer,
         Buffer_Size      => Size,
         Error_Prefix     => "X520OrganizationName decoding failed");
      Constraints.Check
        (Type_Descriptor => asn_DEF_X520OrganizationName'Access,
         Address         => Data.all'Address,
         Error_Prefix    => "X520OrganizationName validation failed");

      case Data.present is
         when X520OrganizationName_PR_printableString =>
            return S : constant String := "O=" & Utils.To_String
              (Address => Data.choice.printableString.buf.all'Address,
               Size    => Data.choice.printableString.size)
            do
               asn_DEF_X520OrganizationName.free_struct
                 (asn_DEF_X520OrganizationName'Address, Data.all'Address, 0);
            end return;
         when X520OrganizationName_PR_utf8String =>
            return S : constant String := "O=" & Utils.To_String
              (Address => Data.choice.utf8String.buf.all'Address,
               Size    => Data.choice.utf8String.size)
            do
               asn_DEF_X520OrganizationName.free_struct
                 (asn_DEF_X520OrganizationName'Address, Data.all'Address, 0);
            end return;
         when others =>
            asn_DEF_X520OrganizationName.free_struct
              (asn_DEF_X520OrganizationName'Address, Data.all'Address, 0);
            raise Conversion_Error with "X520OrganizationName contains "
              & "unsupported string type";
      end case;
   end Decode_Organization_Name;

   -------------------------------------------------------------------------

   function Decode_Organizational_Unit_Name
     (Buffer : System.Address;
      Size   : Positive)
      return String
   is
      use X520OrganizationalUnitName_h;

      type OU_Name_Access is access all X520OrganizationalUnitName_t;

      Data : OU_Name_Access;
   begin
      Decoder.Decode
        (Type_Descriptor  => asn_DEF_X520OrganizationalUnitName'Access,
         Type_Handle_Addr => Data'Address,
         Buffer           => Buffer,
         Buffer_Size      => Size,
         Error_Prefix     => "X520OrganizationalUnitName decoding failed");
      Constraints.Check
        (Type_Descriptor => asn_DEF_X520OrganizationalUnitName'Access,
         Address         => Data.all'Address,
         Error_Prefix    => "X520OrganizationalUnitName validation failed");

      case Data.present is
         when X520OrganizationalUnitName_PR_printableString =>
            return S : constant String := "OU=" & Utils.To_String
              (Address => Data.choice.printableString.buf.all'Address,
               Size    => Data.choice.printableString.size)
            do
               asn_DEF_X520OrganizationalUnitName.free_struct
                 (asn_DEF_X520OrganizationalUnitName'Address,
                  Data.all'Address, 0);
            end return;
         when X520OrganizationalUnitName_PR_utf8String =>
            return S : constant String := "OU=" & Utils.To_String
              (Address => Data.choice.utf8String.buf.all'Address,
               Size    => Data.choice.utf8String.size)
            do
               asn_DEF_X520OrganizationalUnitName.free_struct
                 (asn_DEF_X520OrganizationalUnitName'Address,
                  Data.all'Address, 0);
            end return;
         when others =>
            asn_DEF_X520OrganizationalUnitName.free_struct
              (asn_DEF_X520OrganizationalUnitName'Address,
               Data.all'Address, 0);
            raise Conversion_Error with "X520OrganizationalUnitName contains "
              & "unsupported string type";
      end case;
   end Decode_Organizational_Unit_Name;

   -------------------------------------------------------------------------

   function Decode_X520
     (Oid    : Oids.Oid_Type;
      Buffer : System.Address;
      Size   : Positive)
      return String
   is
   begin
      case Oid is
         when Oids.commonName =>
            return Decode_Common_Name
              (Buffer => Buffer,
               Size   => Size);
         when Oids.countryName =>
            return Decode_Country_Name
              (Buffer => Buffer,
               Size   => Size);
         when Oids.organizationName =>
            return Decode_Organization_Name
              (Buffer => Buffer,
               Size   => Size);
         when Oids.organizationalUnitName =>
            return Decode_Organizational_Unit_Name
              (Buffer => Buffer,
               Size   => Size);
         when others =>
            raise Conversion_Error with Oid'Img & " unsupported";
      end case;
   end Decode_X520;

   -------------------------------------------------------------------------

   function To_Ada (Asn_Name : Name_h.Name_t) return String
   is
      use type C.int;

      Count  : constant C.int := Asn_Name.choice.rdnSequence.list.count;
      Result : Unbounded_String;
   begin
      if Count = 0 then
         raise Conversion_Error with "Unable to convert empty RDN";
      end if;

      for I in 0 .. Count - 1 loop
         declare
            use System.Storage_Elements;

            R_Addr : System.Address;
            for R_Addr'Address use Asn_Name.choice.rdnSequence.list.c_array
              + Storage_Offset (I * (System.Word_Size / 8));
            R      : RelativeDistinguishedName_h.RelativeDistinguishedName_t;
            for R'Address use R_Addr;
            pragma Import (Ada, R);

            A_Addr : System.Address;
            for A_Addr'Address use R.list.c_array;
            A      : AttributeTypeAndValue_h.AttributeTypeAndValue_t;
            for A'Address use A_Addr;
            pragma Import (Ada, A);
         begin
            if R.list.count /= 1 then
               raise Conversion_Error with "Distinguished name contains more"
                 & " than one attribute";
            end if;

            declare
               Oid : constant Oids.Oid_Type
                 := Oids.To_Ada (Asn_Oid => A.c_type);
            begin
               if I /= 0 then
                  Result := Result & ", ";
               end if;

               Result := Result & Decode_X520
                 (Oid    => Oid,
                  Buffer => A.value.buf.all'Address,
                  Size   => Positive (A.value.size));
            end;
         end;
      end loop;

      return To_String (Result);
   end To_Ada;

end X509.Names;
