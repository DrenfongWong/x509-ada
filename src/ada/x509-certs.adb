with Certificate_h;

with X509.Utils;
with X509.Decoder;
with X509.Constraints;
with X509.Names;

package body X509.Certs
is

   use Ada.Strings.Unbounded;

   type Cert_Access is access all Certificate_h.Certificate_t;

   -------------------------------------------------------------------------

   function Get_Issuer (Cert : Certificate_Type) return String
   is
   begin
      return To_String (Cert.Issuer);
   end Get_Issuer;

   -------------------------------------------------------------------------

   function Get_Pubkey_Alg (Cert : Certificate_Type) return Oids.Oid_Type
   is
   begin
      return Cert.Pubkey_Alg;
   end Get_Pubkey_Alg;

   -------------------------------------------------------------------------

   function Get_Public_Key
     (Cert : Certificate_Type)
      return Keys.RSA_Public_Key_Type
   is
   begin
      return Cert.Pubkey;
   end Get_Public_Key;

   -------------------------------------------------------------------------

   function Get_Signature (Cert : Certificate_Type) return String
   is
   begin
      return To_String (Cert.Signature);
   end Get_Signature;

   -------------------------------------------------------------------------

   function Get_Signature_Alg (Cert : Certificate_Type) return Oids.Oid_Type
   is
   begin
      return Cert.Signature_Alg;
   end Get_Signature_Alg;

   -------------------------------------------------------------------------

   function Get_Subject (Cert : Certificate_Type) return String
   is
   begin
      return To_String (Cert.Subject);
   end Get_Subject;

   -------------------------------------------------------------------------

   function Get_Validity
     (Cert : Certificate_Type)
      return Validity.Validity_Type
   is
   begin
      return Cert.Validity_Period;
   end Get_Validity;

   -------------------------------------------------------------------------

   procedure Load
     (Filename :     String;
      Cert     : out Certificate_Type)
   is
      Data   : Cert_Access;
      Buffer : Byte_Array := Utils.Read_File (Filename);
   begin
      if Buffer'Length = 0 then
         raise Load_Error with "Unable to decode empty file '"
           & Filename & "'";
      end if;

      Decoder.Decode
        (Type_Descriptor  => Certificate_h.asn_DEF_Certificate'Access,
         Type_Handle_Addr => Data'Address,
         Buffer           => Buffer'Address,
         Buffer_Size      => Buffer'Length,
         Error_Prefix     => "Unable to load certificate '" & Filename & "'");
      Constraints.Check
        (Type_Descriptor => Certificate_h.asn_DEF_Certificate'Access,
         Address         => Data.all'Address,
         Error_Prefix    => "Validation failed for '" & Filename & "'");

      Extract_Data :
      begin

         --  Signature

         Cert.Signature := To_Unbounded_String
           (Utils.To_Hex_String (Address => Data.signature.buf.all'Address,
                                 Size    => Data.signature.size));
         Cert.Signature_Alg := Oids.To_Ada
           (Asn_Oid => Data.tbsCertificate.signature.algorithm'Access);

         --  Issuer & Subject

         Cert.Issuer  := To_Unbounded_String
           (Names.To_Ada (Asn_Name => Data.tbsCertificate.issuer'Access));
         Cert.Subject := To_Unbounded_String
           (Names.To_Ada (Asn_Name => Data.tbsCertificate.subject'Access));

         --  Validity

         Cert.Validity_Period := Validity.To_Ada
           (Asn_Validity => Data.tbsCertificate.validity'Access);

         --  Public key

         Cert.Pubkey_Alg := Oids.To_Ada
           (Asn_Oid => Data.tbsCertificate.subjectPublicKeyInfo.
              algorithm.algorithm'Access);
         Cert.Pubkey.Load
           (Address => Data.tbsCertificate.subjectPublicKeyInfo.
              subjectPublicKey.buf.all'Address,
            Size    => Integer (Data.tbsCertificate.subjectPublicKeyInfo.
                subjectPublicKey.size));

      exception
         when others =>
            Certificate_h.asn_DEF_Certificate.free_struct
              (Certificate_h.asn_DEF_Certificate'Address, Data.all'Address, 0);
            raise;
      end Extract_Data;

      Certificate_h.asn_DEF_Certificate.free_struct
        (Certificate_h.asn_DEF_Certificate'Address, Data.all'Address, 0);
   end Load;

end X509.Certs;
