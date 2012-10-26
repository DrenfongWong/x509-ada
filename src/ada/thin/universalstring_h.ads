with Interfaces.C; use Interfaces.C;
with OCTET_STRING_h;
with constr_TYPE_h;
with System;
with stddef_h;
with asn_codecs_h;
with Interfaces.C.Strings;
with xer_encoder_h;

package UniversalString_h is

   subtype UniversalString_t is OCTET_STRING_h.OCTET_STRING;

   asn_DEF_UniversalString : aliased constr_TYPE_h.asn_TYPE_descriptor_t;  -- ../../c/x509/UniversalString.h:16
   pragma Import (C, asn_DEF_UniversalString, "asn_DEF_UniversalString");

   function UniversalString_print
     (arg1 : System.Address;
      arg2 : System.Address;
      arg3 : int;
      arg4 : access function
        (arg1 : System.Address;
         arg2 : stddef_h.size_t;
         arg3 : System.Address) return int;
      arg5 : System.Address) return int;  -- ../../c/x509/UniversalString.h:18
   pragma Import (C, UniversalString_print, "UniversalString_print");

   function UniversalString_decode_xer
     (arg1 : access asn_codecs_h.asn_codec_ctx_t;
      arg2 : access constr_TYPE_h.asn_TYPE_descriptor_s;
      arg3 : System.Address;
      arg4 : Interfaces.C.Strings.chars_ptr;
      arg5 : System.Address;
      arg6 : stddef_h.size_t) return asn_codecs_h.asn_dec_rval_t;  -- ../../c/x509/UniversalString.h:19
   pragma Import (C, UniversalString_decode_xer, "UniversalString_decode_xer");

   function UniversalString_encode_xer
     (arg1 : access constr_TYPE_h.asn_TYPE_descriptor_s;
      arg2 : System.Address;
      arg3 : int;
      arg4 : xer_encoder_h.xer_encoder_flags_e;
      arg5 : access function
        (arg1 : System.Address;
         arg2 : stddef_h.size_t;
         arg3 : System.Address) return int;
      arg6 : System.Address) return asn_codecs_h.asn_enc_rval_t;  -- ../../c/x509/UniversalString.h:20
   pragma Import (C, UniversalString_encode_xer, "UniversalString_encode_xer");

end UniversalString_h;
