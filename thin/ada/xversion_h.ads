with Interfaces.C; use Interfaces.C;
with asn_codecs_prim_h;
with constr_TYPE_h;
with System;
with stddef_h;
with Interfaces.C.Strings;
with asn_codecs_h;
with ber_tlv_tag_h;
with xer_encoder_h;

package XVersion_h is

   type XVersion is 
     (XVersion_v1,
      XVersion_v2,
      XVersion_v3);
   pragma Convention (C, XVersion);  -- ../../c/x509/XVersion.h:21

   subtype e_XVersion is XVersion;

   subtype XVersion_t is asn_codecs_prim_h.ASN_u_PRIMITIVE_TYPE_s;

   asn_DEF_XVersion : aliased constr_TYPE_h.asn_TYPE_descriptor_t;  -- ../../c/x509/XVersion.h:31
   pragma Import (C, asn_DEF_XVersion, "asn_DEF_XVersion");

   procedure XVersion_free
     (arg1 : System.Address;
      arg2 : System.Address;
      arg3 : int);  -- ../../c/x509/XVersion.h:32
   pragma Import (C, XVersion_free, "XVersion_free");

   function XVersion_print
     (arg1 : System.Address;
      arg2 : System.Address;
      arg3 : int;
      arg4 : access function
        (arg1 : System.Address;
         arg2 : stddef_h.size_t;
         arg3 : System.Address) return int;
      arg5 : System.Address) return int;  -- ../../c/x509/XVersion.h:33
   pragma Import (C, XVersion_print, "XVersion_print");

   function XVersion_constraint
     (arg1 : access constr_TYPE_h.asn_TYPE_descriptor_s;
      arg2 : System.Address;
      arg3 : access procedure
        (arg1 : System.Address;
         arg2 : access constr_TYPE_h.asn_TYPE_descriptor_s;
         arg3 : System.Address;
         arg4 : Interfaces.C.Strings.chars_ptr  -- , ...
         );
      arg4 : System.Address) return int;  -- ../../c/x509/XVersion.h:34
   pragma Import (C, XVersion_constraint, "XVersion_constraint");

   function XVersion_decode_ber
     (arg1 : access asn_codecs_h.asn_codec_ctx_s;
      arg2 : access constr_TYPE_h.asn_TYPE_descriptor_s;
      arg3 : System.Address;
      arg4 : System.Address;
      arg5 : stddef_h.size_t;
      arg6 : int) return asn_codecs_h.asn_dec_rval_t;  -- ../../c/x509/XVersion.h:35
   pragma Import (C, XVersion_decode_ber, "XVersion_decode_ber");

   function XVersion_encode_der
     (arg1 : access constr_TYPE_h.asn_TYPE_descriptor_s;
      arg2 : System.Address;
      arg3 : int;
      arg4 : ber_tlv_tag_h.ber_tlv_tag_t;
      arg5 : access function
        (arg1 : System.Address;
         arg2 : stddef_h.size_t;
         arg3 : System.Address) return int;
      arg6 : System.Address) return asn_codecs_h.asn_enc_rval_t;  -- ../../c/x509/XVersion.h:36
   pragma Import (C, XVersion_encode_der, "XVersion_encode_der");

   function XVersion_decode_xer
     (arg1 : access asn_codecs_h.asn_codec_ctx_t;
      arg2 : access constr_TYPE_h.asn_TYPE_descriptor_s;
      arg3 : System.Address;
      arg4 : Interfaces.C.Strings.chars_ptr;
      arg5 : System.Address;
      arg6 : stddef_h.size_t) return asn_codecs_h.asn_dec_rval_t;  -- ../../c/x509/XVersion.h:37
   pragma Import (C, XVersion_decode_xer, "XVersion_decode_xer");

   function XVersion_encode_xer
     (arg1 : access constr_TYPE_h.asn_TYPE_descriptor_s;
      arg2 : System.Address;
      arg3 : int;
      arg4 : xer_encoder_h.xer_encoder_flags_e;
      arg5 : access function
        (arg1 : System.Address;
         arg2 : stddef_h.size_t;
         arg3 : System.Address) return int;
      arg6 : System.Address) return asn_codecs_h.asn_enc_rval_t;  -- ../../c/x509/XVersion.h:38
   pragma Import (C, XVersion_encode_xer, "XVersion_encode_xer");

end XVersion_h;
