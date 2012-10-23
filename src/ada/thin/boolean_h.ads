with Interfaces.C; use Interfaces.C;
with constr_TYPE_h;
with System;
with stddef_h;
with asn_codecs_h;
with ber_tlv_tag_h;
with Interfaces.C.Strings;
with xer_encoder_h;
with per_support_h;

package BOOLEAN_h is

   subtype BOOLEAN_t is int;  -- ../../c/common/BOOLEAN.h:19

   asn_DEF_BOOLEAN : aliased constr_TYPE_h.asn_TYPE_descriptor_t;  -- ../../c/common/BOOLEAN.h:21
   pragma Import (C, asn_DEF_BOOLEAN, "asn_DEF_BOOLEAN");

   procedure BOOLEAN_free
     (arg1 : System.Address;
      arg2 : System.Address;
      arg3 : int);  -- ../../c/common/BOOLEAN.h:23
   pragma Import (C, BOOLEAN_free, "BOOLEAN_free");

   function BOOLEAN_print
     (arg1 : System.Address;
      arg2 : System.Address;
      arg3 : int;
      arg4 : access function
        (arg1 : System.Address;
         arg2 : stddef_h.size_t;
         arg3 : System.Address) return int;
      arg5 : System.Address) return int;  -- ../../c/common/BOOLEAN.h:24
   pragma Import (C, BOOLEAN_print, "BOOLEAN_print");

   function BOOLEAN_decode_ber
     (arg1 : access asn_codecs_h.asn_codec_ctx_s;
      arg2 : access constr_TYPE_h.asn_TYPE_descriptor_s;
      arg3 : System.Address;
      arg4 : System.Address;
      arg5 : stddef_h.size_t;
      arg6 : int) return asn_codecs_h.asn_dec_rval_t;  -- ../../c/common/BOOLEAN.h:25
   pragma Import (C, BOOLEAN_decode_ber, "BOOLEAN_decode_ber");

   function BOOLEAN_encode_der
     (arg1 : access constr_TYPE_h.asn_TYPE_descriptor_s;
      arg2 : System.Address;
      arg3 : int;
      arg4 : ber_tlv_tag_h.ber_tlv_tag_t;
      arg5 : access function
        (arg1 : System.Address;
         arg2 : stddef_h.size_t;
         arg3 : System.Address) return int;
      arg6 : System.Address) return asn_codecs_h.asn_enc_rval_t;  -- ../../c/common/BOOLEAN.h:26
   pragma Import (C, BOOLEAN_encode_der, "BOOLEAN_encode_der");

   function BOOLEAN_decode_xer
     (arg1 : access asn_codecs_h.asn_codec_ctx_t;
      arg2 : access constr_TYPE_h.asn_TYPE_descriptor_s;
      arg3 : System.Address;
      arg4 : Interfaces.C.Strings.chars_ptr;
      arg5 : System.Address;
      arg6 : stddef_h.size_t) return asn_codecs_h.asn_dec_rval_t;  -- ../../c/common/BOOLEAN.h:27
   pragma Import (C, BOOLEAN_decode_xer, "BOOLEAN_decode_xer");

   function BOOLEAN_encode_xer
     (arg1 : access constr_TYPE_h.asn_TYPE_descriptor_s;
      arg2 : System.Address;
      arg3 : int;
      arg4 : xer_encoder_h.xer_encoder_flags_e;
      arg5 : access function
        (arg1 : System.Address;
         arg2 : stddef_h.size_t;
         arg3 : System.Address) return int;
      arg6 : System.Address) return asn_codecs_h.asn_enc_rval_t;  -- ../../c/common/BOOLEAN.h:28
   pragma Import (C, BOOLEAN_encode_xer, "BOOLEAN_encode_xer");

   function BOOLEAN_decode_uper
     (arg1 : access asn_codecs_h.asn_codec_ctx_t;
      arg2 : access constr_TYPE_h.asn_TYPE_descriptor_s;
      arg3 : access per_support_h.asn_per_constraints_t;
      arg4 : System.Address;
      arg5 : access per_support_h.asn_per_data_t) return asn_codecs_h.asn_dec_rval_t;  -- ../../c/common/BOOLEAN.h:29
   pragma Import (C, BOOLEAN_decode_uper, "BOOLEAN_decode_uper");

   function BOOLEAN_encode_uper
     (arg1 : access constr_TYPE_h.asn_TYPE_descriptor_s;
      arg2 : access per_support_h.asn_per_constraints_t;
      arg3 : System.Address;
      arg4 : access per_support_h.asn_per_outp_t) return asn_codecs_h.asn_enc_rval_t;  -- ../../c/common/BOOLEAN.h:30
   pragma Import (C, BOOLEAN_encode_uper, "BOOLEAN_encode_uper");

end BOOLEAN_h;
