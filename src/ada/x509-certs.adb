with Interfaces.C.Strings;

with stddef_h;
with ber_decoder_h;
with constraints_h;
with Certificate_h;

with X509.Utils;

package body X509.Certs
is

   use Ada.Strings.Unbounded;

   package C renames Interfaces.C;

   type Cert_Access is access all Certificate_h.Certificate_t;

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

      Check_Constraints :
      declare
         Null_Buffer : constant C.char_array (1 .. 128)
           := (others => C.nul);
         Err_Buffer  : aliased C.char_array := Null_Buffer;
         Err_Len     : aliased stddef_h.size_t
           := stddef_h.size_t (Err_Buffer'Length);
      begin
         if constraints_h.asn_check_constraints
           (type_descriptor => Certificate_h.asn_DEF_Certificate'Access,
            struct_ptr      => Data.all'Address,
            errbuf          => C.Strings.To_Chars_Ptr
              (Item => Err_Buffer'Unchecked_Access),
            errlen          => Err_Len'Access) = -1
         then
            raise Load_Error with "Constraint validation failed for '"
              & Filename & "' : " & C.To_Ada (Err_Buffer);
         end if;
      end Check_Constraints;

      Cert.Signature := To_Unbounded_String
        (Utils.To_Hex_String (Address => Data.signature.buf.all'Address,
                              Size    => Data.signature.size));

      Certificate_h.asn_DEF_Certificate.free_struct
        (Certificate_h.asn_DEF_Certificate'Address, Data.all'Address, 0);
   end Load;

end X509.Certs;
