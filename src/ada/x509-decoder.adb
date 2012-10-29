with Interfaces.C;

with asn_codecs_h;
with ber_decoder_h;

package body X509.Decoder
is

   -------------------------------------------------------------------------

   procedure Decode
     (Type_Descriptor  : TD_Handle;
      Type_Handle_Addr : System.Address;
      Buffer           : System.Address;
      Buffer_Size      : Integer;
      Error_Prefix     : String)
   is
      use type Interfaces.C.int;
      use type asn_codecs_h.asn_dec_rval_code_e;

      Rval : asn_codecs_h.asn_dec_rval_t;
   begin
      Rval := ber_decoder_h.ber_decode
        (opt_codec_ctx   => null,
         type_descriptor => Type_Descriptor,
         struct_ptr      => Type_Handle_Addr,
         buffer          => Buffer,
         size            => Interfaces.C.unsigned_long (Buffer_Size));

      declare
         Type_Ptr : System.Address;
         for Type_Ptr'Address use Type_Handle_Addr;
      begin
         if Rval.code /= asn_codecs_h.RC_OK then
            Type_Descriptor.free_struct
              (Type_Descriptor.all'Address, Type_Ptr, 0);
            raise Load_Error with Error_Prefix & ": Broken encoding at byte"
              & Rval.consumed'Img;
         end if;
      end;
   end Decode;

end X509.Decoder;
