with stdio_h;
with asn_codecs_h;
with der_encoder_h;
with Certificate_h;
with TBSCertificate_h;

with X509.Utils;
with X509.Decoder;
with X509.Constraints;
with X509.Names;
with X509.Extensions;

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

   function Get_Signature (Cert : Certificate_Type) return Byte_Array
   is
   begin
      if Cert.Signature = Null_Sequence then
         return Null_Byte_Array;
      end if;

      return Cert.Signature.Data
        (Cert.Signature.Data'First .. Cert.Signature.Size);
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

   function Get_Tbs_Data (Cert : Certificate_Type) return Byte_Array
   is
      use Certificate_h;
      use type stdio_h.ssize_t;

      Rval   : asn_codecs_h.asn_enc_rval_t;
      C      : Cert_Access;
      Buffer : Byte_Array (1 .. Cert.Der_Encoding.Data'Length)
        := (others => 0);
   begin
      if Cert.Der_Encoding = Null_Sequence then
         return Null_Byte_Array;
      end if;

      --  To get the DER encoded data of just the TBSCertificate PDU we need
      --  to decode the complete certificate again and then encode just the TBS
      --  part. Constraints check omitted because we already know that the
      --  certificate is valid.

      Decoder.Decode
        (Type_Descriptor  => Certificate_h.asn_DEF_Certificate'Access,
         Type_Handle_Addr => C'Address,
         Buffer           => Cert.Der_Encoding.Data'Address,
         Buffer_Size      => Cert.Der_Encoding.Size,
         Error_Prefix     => "Tbs: Unable to decode certificate");
      Rval := der_encoder_h.der_encode_to_buffer
        (type_descriptor => TBSCertificate_h.asn_DEF_TBSCertificate'Access,
         struct_ptr      => C.tbsCertificate'Address,
         buffer          => Buffer'Address,
         buffer_size     => Buffer'Length);
      asn_DEF_Certificate.free_struct
        (asn_DEF_Certificate'Address, C.all'Address, 0);

      if Rval.encoded = -1 then
         raise Encoding_Error with "Unable to DER encode TBSCertificate";
      end if;

      return Buffer (Buffer'First .. Positive (Rval.encoded));
   end Get_Tbs_Data;

   -------------------------------------------------------------------------

   function Get_Validity
     (Cert : Certificate_Type)
      return Validity.Validity_Type
   is
   begin
      return Cert.Validity_Period;
   end Get_Validity;

   -------------------------------------------------------------------------

   function Is_Ca (Cert : Certificate_Type) return Boolean
   is
   begin
      return Cert.Is_Ca;
   end Is_Ca;

   -------------------------------------------------------------------------

   procedure Load
     (Buffer :     Byte_Array;
      Cert   : out Certificate_Type)
   is
      Data : Cert_Access;
   begin
      if Buffer'Length = 0 then
         raise Load_Error with "Unable to decode certificate from empty"
           & " buffer";
      end if;

      Decoder.Decode
        (Type_Descriptor  => Certificate_h.asn_DEF_Certificate'Access,
         Type_Handle_Addr => Data'Address,
         Buffer           => Buffer'Address,
         Buffer_Size      => Buffer'Length,
         Error_Prefix     => "Unable to load certificate");
      Constraints.Check
        (Type_Descriptor => Certificate_h.asn_DEF_Certificate'Access,
         Address         => Data.all'Address,
         Error_Prefix    => "Certificate constraints check failed");

      Extract_Data :
      begin

         --  Signature

         Cert.Signature.Size := Positive (Data.signature.size);
         Cert.Signature.Data (Cert.Signature.Data'First .. Cert.Signature.Size)
           := Utils.To_Bytes
             (Address => Data.signature.buf.all'Address,
              Size    => Data.signature.size);
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

         --  Extensions

         Cert.Is_Ca := Extensions.Is_Ca
           (Asn_Ext => Data.tbsCertificate.the_extensions);

         --  Public key

         Cert.Pubkey_Alg := Oids.To_Ada
           (Asn_Oid => Data.tbsCertificate.subjectPublicKeyInfo.
              algorithm.algorithm'Access);
         Cert.Pubkey.Load
           (Address => Data.tbsCertificate.subjectPublicKeyInfo.
              subjectPublicKey.buf.all'Address,
            Size    => Integer (Data.tbsCertificate.subjectPublicKeyInfo.
                subjectPublicKey.size));

         --  Store 'raw' DER encoded data.

         Cert.Der_Encoding.Data
           (Cert.Der_Encoding.Data'First .. Buffer'Length) := Buffer;
         Cert.Der_Encoding.Size := Buffer'Length;

      exception
         when others =>
            Certificate_h.asn_DEF_Certificate.free_struct
              (Certificate_h.asn_DEF_Certificate'Address, Data.all'Address, 0);
            raise;
      end Extract_Data;

      Certificate_h.asn_DEF_Certificate.free_struct
        (Certificate_h.asn_DEF_Certificate'Address, Data.all'Address, 0);
   end Load;

   -------------------------------------------------------------------------

   procedure Load
     (Filename :     String;
      Cert     : out Certificate_Type)
   is
   begin
      Load (Buffer => Utils.Read_File (Filename),
            Cert   => Cert);
   end Load;

end X509.Certs;
