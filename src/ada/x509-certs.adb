with Interfaces.C;

with ber_decoder_h;
with Certificate_h;

with X509.Utils;
with X509.Constraints;

package body X509.Certs
is

   use Ada.Strings.Unbounded;

   package C renames Interfaces.C;

   type Cert_Access is access all Certificate_h.Certificate_t;

   -------------------------------------------------------------------------

   function Get_Public_Key
     (Cert : Certificate_Type)
      return Keys.RSA_Public_Key_Type
   is
   begin
      return Cert.Pubkey;
   end Get_Public_Key;

   -------------------------------------------------------------------------

   function Get_Sigalg (Cert : Certificate_Type) return Oids.Oid_Type
   is
   begin
      return Cert.Signature_Alg;
   end Get_Sigalg;

   -------------------------------------------------------------------------

   function Get_Signature (Cert : Certificate_Type) return String
   is
   begin
      return To_String (Cert.Signature);
   end Get_Signature;

   -------------------------------------------------------------------------

   procedure Load
     (Filename :     String;
      Cert     : out Certificate_Type)
   is
      use type C.int;
      use type asn_codecs_h.asn_dec_rval_code_e;

      Data   : Cert_Access;
      Rval   : asn_codecs_h.asn_dec_rval_t;
      Buffer : Byte_Array := Utils.Read_File (Filename);
   begin
      Rval := ber_decoder_h.ber_decode
        (opt_codec_ctx   => null,
         type_descriptor => Certificate_h.asn_DEF_Certificate'Access,
         struct_ptr      => Data'Address,
         buffer          => Buffer'Address,
         size            => C.unsigned_long (Buffer'Length));

      if Rval.code /= asn_codecs_h.RC_OK then
         Certificate_h.asn_DEF_Certificate.free_struct
           (Certificate_h.asn_DEF_Certificate'Address,
            Data.all'Address, 0);
         raise Load_Error with "Unable to load certificate '" & Filename
           & "' : Broken encoding at byte" & Rval.consumed'Img;
      end if;

      Constraints.Check
        (Type_Descriptor => Certificate_h.asn_DEF_Certificate'Access,
         Address         => Data.all'Address,
         Error_Prefix    => "Validation failed for '" & Filename & "'");

      Cert.Signature := To_Unbounded_String
        (Utils.To_Hex_String (Address => Data.signature.buf.all'Address,
                              Size    => Data.signature.size));
      Cert.Signature_Alg := Oids.To_Ada
        (Asn_Oid => Data.tbsCertificate.signature.algorithm'Access);

      Cert.Pubkey.Load
        (Address => Data.tbsCertificate.subjectPublicKeyInfo.
           subjectPublicKey.buf.all'Address,
         Size    => Integer (Data.tbsCertificate.subjectPublicKeyInfo.
             subjectPublicKey.size));

      Certificate_h.asn_DEF_Certificate.free_struct
        (Certificate_h.asn_DEF_Certificate'Address, Data.all'Address, 0);
   end Load;

end X509.Certs;
