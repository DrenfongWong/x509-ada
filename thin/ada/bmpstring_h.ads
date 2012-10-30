with Interfaces.C; use Interfaces.C;
with OCTET_STRING_h;
with constr_TYPE_h;
with System;
with stddef_h;
with asn_codecs_h;
with Interfaces.C.Strings;
with xer_encoder_h;

package BMPString_h is

   subtype BMPString_t is OCTET_STRING_h.OCTET_STRING;

   asn_DEF_BMPString : aliased constr_TYPE_h.asn_TYPE_descriptor_t;  -- ../../c/x509/BMPString.h:16
   pragma Import (C, asn_DEF_BMPString, "asn_DEF_BMPString");

   function BMPString_print
     (arg1 : System.Address;
      arg2 : System.Address;
      arg3 : int;
      arg4 : access function
        (arg1 : System.Address;
         arg2 : stddef_h.size_t;
         arg3 : System.Address) return int;
      arg5 : System.Address) return int;  -- ../../c/x509/BMPString.h:18
   pragma Import (C, BMPString_print, "BMPString_print");

   function BMPString_decode_xer
     (arg1 : access asn_codecs_h.asn_codec_ctx_t;
      arg2 : access constr_TYPE_h.asn_TYPE_descriptor_s;
      arg3 : System.Address;
      arg4 : Interfaces.C.Strings.chars_ptr;
      arg5 : System.Address;
      arg6 : stddef_h.size_t) return asn_codecs_h.asn_dec_rval_t;  -- ../../c/x509/BMPString.h:19
   pragma Import (C, BMPString_decode_xer, "BMPString_decode_xer");

   function BMPString_encode_xer
     (arg1 : access constr_TYPE_h.asn_TYPE_descriptor_s;
      arg2 : System.Address;
      arg3 : int;
      arg4 : xer_encoder_h.xer_encoder_flags_e;
      arg5 : access function
        (arg1 : System.Address;
         arg2 : stddef_h.size_t;
         arg3 : System.Address) return int;
      arg6 : System.Address) return asn_codecs_h.asn_enc_rval_t;  -- ../../c/x509/BMPString.h:20
   pragma Import (C, BMPString_encode_xer, "BMPString_encode_xer");

end BMPString_h;
