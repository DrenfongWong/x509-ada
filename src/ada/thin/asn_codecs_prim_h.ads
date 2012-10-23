with Interfaces.C; use Interfaces.C;
with stdint_h;
with System;
with asn_codecs_h;
with constr_TYPE_h;
with stddef_h;
with ber_tlv_tag_h;
with Interfaces.C.Strings;

package asn_codecs_prim_h is

   type ASN_u_PRIMITIVE_TYPE_s is record
      buf : access stdint_h.uint8_t;  -- ../../c/common/asn_codecs_prim.h:15
      size : aliased int;  -- ../../c/common/asn_codecs_prim.h:16
   end record;
   pragma Convention (C_Pass_By_Copy, ASN_u_PRIMITIVE_TYPE_s);  -- ../../c/common/asn_codecs_prim.h:14

   subtype ASN_u_PRIMITIVE_TYPE_t is ASN_u_PRIMITIVE_TYPE_s;

   procedure ASN_u_PRIMITIVE_TYPE_free
     (arg1 : System.Address;
      arg2 : System.Address;
      arg3 : int);  -- ../../c/common/asn_codecs_prim.h:19
   pragma Import (C, ASN_u_PRIMITIVE_TYPE_free, "ASN__PRIMITIVE_TYPE_free");

   function ber_decode_primitive
     (arg1 : access asn_codecs_h.asn_codec_ctx_s;
      arg2 : access constr_TYPE_h.asn_TYPE_descriptor_s;
      arg3 : System.Address;
      arg4 : System.Address;
      arg5 : stddef_h.size_t;
      arg6 : int) return asn_codecs_h.asn_dec_rval_t;  -- ../../c/common/asn_codecs_prim.h:20
   pragma Import (C, ber_decode_primitive, "ber_decode_primitive");

   function der_encode_primitive
     (arg1 : access constr_TYPE_h.asn_TYPE_descriptor_s;
      arg2 : System.Address;
      arg3 : int;
      arg4 : ber_tlv_tag_h.ber_tlv_tag_t;
      arg5 : access function
        (arg1 : System.Address;
         arg2 : stddef_h.size_t;
         arg3 : System.Address) return int;
      arg6 : System.Address) return asn_codecs_h.asn_enc_rval_t;  -- ../../c/common/asn_codecs_prim.h:21
   pragma Import (C, der_encode_primitive, "der_encode_primitive");

   type xer_pbd_rval is
     (XPBD_SYSTEM_FAILURE,
      XPBD_DECODER_LIMIT,
      XPBD_BROKEN_ENCODING,
      XPBD_NOT_BODY_IGNORE,
      XPBD_BODY_CONSUMED);
   pragma Convention (C, xer_pbd_rval);  -- ../../c/common/asn_codecs_prim.h:26

   --  skipped function type xer_primitive_body_decoder_f

   function xer_decode_primitive
     (opt_codec_ctx : access asn_codecs_h.asn_codec_ctx_t;
      type_descriptor : access constr_TYPE_h.asn_TYPE_descriptor_t;
      struct_ptr : System.Address;
      struct_size : stddef_h.size_t;
      opt_mname : Interfaces.C.Strings.chars_ptr;
      buf_ptr : System.Address;
      size : stddef_h.size_t;
      prim_body_decoder : access function
        (arg1 : access constr_TYPE_h.asn_TYPE_descriptor_t;
         arg2 : System.Address;
         arg3 : System.Address;
         arg4 : stddef_h.size_t) return xer_pbd_rval) return asn_codecs_h.asn_dec_rval_t;  -- ../../c/common/asn_codecs_prim.h:41
   pragma Import (C, xer_decode_primitive, "xer_decode_primitive");

end asn_codecs_prim_h;
