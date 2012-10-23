with Interfaces.C; use Interfaces.C;
with asn_codecs_prim_h;
with constr_TYPE_h;
with System;
with stddef_h;
with Interfaces.C.Strings;
with asn_codecs_h;
with ber_tlv_tag_h;
with xer_encoder_h;

package AttributeType_h is

   subtype AttributeType_t is asn_codecs_prim_h.ASN_u_PRIMITIVE_TYPE_s;

   asn_DEF_AttributeType : aliased constr_TYPE_h.asn_TYPE_descriptor_t;  -- ../../c/x509/AttributeType.h:24
   pragma Import (C, asn_DEF_AttributeType, "asn_DEF_AttributeType");

   procedure AttributeType_free
     (arg1 : System.Address;
      arg2 : System.Address;
      arg3 : int);  -- ../../c/x509/AttributeType.h:25
   pragma Import (C, AttributeType_free, "AttributeType_free");

   function AttributeType_print
     (arg1 : System.Address;
      arg2 : System.Address;
      arg3 : int;
      arg4 : access function
        (arg1 : System.Address;
         arg2 : stddef_h.size_t;
         arg3 : System.Address) return int;
      arg5 : System.Address) return int;  -- ../../c/x509/AttributeType.h:26
   pragma Import (C, AttributeType_print, "AttributeType_print");

   function AttributeType_constraint
     (arg1 : access constr_TYPE_h.asn_TYPE_descriptor_s;
      arg2 : System.Address;
      arg3 : access procedure
        (arg1 : System.Address;
         arg2 : access constr_TYPE_h.asn_TYPE_descriptor_s;
         arg3 : System.Address;
         arg4 : Interfaces.C.Strings.chars_ptr  -- , ...
         );
      arg4 : System.Address) return int;  -- ../../c/x509/AttributeType.h:27
   pragma Import (C, AttributeType_constraint, "AttributeType_constraint");

   function AttributeType_decode_ber
     (arg1 : access asn_codecs_h.asn_codec_ctx_s;
      arg2 : access constr_TYPE_h.asn_TYPE_descriptor_s;
      arg3 : System.Address;
      arg4 : System.Address;
      arg5 : stddef_h.size_t;
      arg6 : int) return asn_codecs_h.asn_dec_rval_t;  -- ../../c/x509/AttributeType.h:28
   pragma Import (C, AttributeType_decode_ber, "AttributeType_decode_ber");

   function AttributeType_encode_der
     (arg1 : access constr_TYPE_h.asn_TYPE_descriptor_s;
      arg2 : System.Address;
      arg3 : int;
      arg4 : ber_tlv_tag_h.ber_tlv_tag_t;
      arg5 : access function
        (arg1 : System.Address;
         arg2 : stddef_h.size_t;
         arg3 : System.Address) return int;
      arg6 : System.Address) return asn_codecs_h.asn_enc_rval_t;  -- ../../c/x509/AttributeType.h:29
   pragma Import (C, AttributeType_encode_der, "AttributeType_encode_der");

   function AttributeType_decode_xer
     (arg1 : access asn_codecs_h.asn_codec_ctx_t;
      arg2 : access constr_TYPE_h.asn_TYPE_descriptor_s;
      arg3 : System.Address;
      arg4 : Interfaces.C.Strings.chars_ptr;
      arg5 : System.Address;
      arg6 : stddef_h.size_t) return asn_codecs_h.asn_dec_rval_t;  -- ../../c/x509/AttributeType.h:30
   pragma Import (C, AttributeType_decode_xer, "AttributeType_decode_xer");

   function AttributeType_encode_xer
     (arg1 : access constr_TYPE_h.asn_TYPE_descriptor_s;
      arg2 : System.Address;
      arg3 : int;
      arg4 : xer_encoder_h.xer_encoder_flags_e;
      arg5 : access function
        (arg1 : System.Address;
         arg2 : stddef_h.size_t;
         arg3 : System.Address) return int;
      arg6 : System.Address) return asn_codecs_h.asn_enc_rval_t;  -- ../../c/x509/AttributeType.h:31
   pragma Import (C, AttributeType_encode_xer, "AttributeType_encode_xer");

end AttributeType_h;
