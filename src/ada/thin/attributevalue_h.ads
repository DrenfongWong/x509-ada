with Interfaces.C; use Interfaces.C;
with ANY_h;
with constr_TYPE_h;
with System;
with stddef_h;
with Interfaces.C.Strings;
with asn_codecs_h;
with ber_tlv_tag_h;
with xer_encoder_h;

package AttributeValue_h is

   subtype AttributeValue_t is ANY_h.ANY;

   asn_DEF_AttributeValue : aliased constr_TYPE_h.asn_TYPE_descriptor_t;  -- ../../c/x509/AttributeValue.h:24
   pragma Import (C, asn_DEF_AttributeValue, "asn_DEF_AttributeValue");

   procedure AttributeValue_free
     (arg1 : System.Address;
      arg2 : System.Address;
      arg3 : int);  -- ../../c/x509/AttributeValue.h:25
   pragma Import (C, AttributeValue_free, "AttributeValue_free");

   function AttributeValue_print
     (arg1 : System.Address;
      arg2 : System.Address;
      arg3 : int;
      arg4 : access function
        (arg1 : System.Address;
         arg2 : stddef_h.size_t;
         arg3 : System.Address) return int;
      arg5 : System.Address) return int;  -- ../../c/x509/AttributeValue.h:26
   pragma Import (C, AttributeValue_print, "AttributeValue_print");

   function AttributeValue_constraint
     (arg1 : access constr_TYPE_h.asn_TYPE_descriptor_s;
      arg2 : System.Address;
      arg3 : access procedure
        (arg1 : System.Address;
         arg2 : access constr_TYPE_h.asn_TYPE_descriptor_s;
         arg3 : System.Address;
         arg4 : Interfaces.C.Strings.chars_ptr  -- , ...
         );
      arg4 : System.Address) return int;  -- ../../c/x509/AttributeValue.h:27
   pragma Import (C, AttributeValue_constraint, "AttributeValue_constraint");

   function AttributeValue_decode_ber
     (arg1 : access asn_codecs_h.asn_codec_ctx_s;
      arg2 : access constr_TYPE_h.asn_TYPE_descriptor_s;
      arg3 : System.Address;
      arg4 : System.Address;
      arg5 : stddef_h.size_t;
      arg6 : int) return asn_codecs_h.asn_dec_rval_t;  -- ../../c/x509/AttributeValue.h:28
   pragma Import (C, AttributeValue_decode_ber, "AttributeValue_decode_ber");

   function AttributeValue_encode_der
     (arg1 : access constr_TYPE_h.asn_TYPE_descriptor_s;
      arg2 : System.Address;
      arg3 : int;
      arg4 : ber_tlv_tag_h.ber_tlv_tag_t;
      arg5 : access function
        (arg1 : System.Address;
         arg2 : stddef_h.size_t;
         arg3 : System.Address) return int;
      arg6 : System.Address) return asn_codecs_h.asn_enc_rval_t;  -- ../../c/x509/AttributeValue.h:29
   pragma Import (C, AttributeValue_encode_der, "AttributeValue_encode_der");

   function AttributeValue_decode_xer
     (arg1 : access asn_codecs_h.asn_codec_ctx_t;
      arg2 : access constr_TYPE_h.asn_TYPE_descriptor_s;
      arg3 : System.Address;
      arg4 : Interfaces.C.Strings.chars_ptr;
      arg5 : System.Address;
      arg6 : stddef_h.size_t) return asn_codecs_h.asn_dec_rval_t;  -- ../../c/x509/AttributeValue.h:30
   pragma Import (C, AttributeValue_decode_xer, "AttributeValue_decode_xer");

   function AttributeValue_encode_xer
     (arg1 : access constr_TYPE_h.asn_TYPE_descriptor_s;
      arg2 : System.Address;
      arg3 : int;
      arg4 : xer_encoder_h.xer_encoder_flags_e;
      arg5 : access function
        (arg1 : System.Address;
         arg2 : stddef_h.size_t;
         arg3 : System.Address) return int;
      arg6 : System.Address) return asn_codecs_h.asn_enc_rval_t;  -- ../../c/x509/AttributeValue.h:31
   pragma Import (C, AttributeValue_encode_xer, "AttributeValue_encode_xer");

end AttributeValue_h;
