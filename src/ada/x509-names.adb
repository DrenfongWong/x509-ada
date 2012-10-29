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
         when others =>
            asn_DEF_X520OrganizationalUnitName.free_struct
              (asn_DEF_X520OrganizationalUnitName'Address,
               Data.all'Address, 0);
            raise Conversion_Error with "X520OrganizationalUnitName contains "
              & "unsupported string type";
      end case;
   end Decode_Organizational_Unit_Name;

   -------------------------------------------------------------------------

   function To_Ada (Asn_Name : Asn_Name_Handle) return String
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
                 := Oids.To_Ada (Asn_Oid => A.c_type'Unchecked_Access);
            begin
               if I /= 0 then
                  Result := Result & ", ";
               end if;

               case Oid is
                  when Oids.commonName =>
                     Result := Result & Decode_Common_Name
                       (Buffer => A.value.buf.all'Address,
                        Size   => Positive (A.value.size));
                  when Oids.countryName =>
                     Result := Result & Decode_Country_Name
                       (Buffer => A.value.buf.all'Address,
                        Size   => Positive (A.value.size));
                  when Oids.organizationName =>
                     Result := Result & Decode_Organization_Name
                       (Buffer => A.value.buf.all'Address,
                        Size   => Positive (A.value.size));
                  when Oids.organizationalUnitName =>
                     Result := Result & Decode_Organizational_Unit_Name
                       (Buffer => A.value.buf.all'Address,
                        Size   => Positive (A.value.size));
                  when others =>
                     raise Conversion_Error with Oid'Img & " unsupported";
               end case;
            end;
         end;
      end loop;

      return To_String (Result);
   end To_Ada;

end X509.Names;
