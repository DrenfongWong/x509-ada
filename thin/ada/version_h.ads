with Interfaces.C; use Interfaces.C;
with asn_codecs_prim_h;
with constr_TYPE_h;
with System;
with stddef_h;
with Interfaces.C.Strings;
with asn_codecs_h;
with ber_tlv_tag_h;
with xer_encoder_h;

package Version_h is

   type Version is
     (Version_two_prime,
      Version_multi);
   pragma Convention (C, Version);  -- ../../c/pkcs1/Version.h:21

   subtype e_Version is Version;

   subtype Version_t is asn_codecs_prim_h.ASN_u_PRIMITIVE_TYPE_s;

   asn_DEF_Version : aliased constr_TYPE_h.asn_TYPE_descriptor_t;  -- ../../c/pkcs1/Version.h:30
   pragma Import (C, asn_DEF_Version, "asn_DEF_Version");

   procedure Version_free
     (arg1 : System.Address;
      arg2 : System.Address;
      arg3 : int);  -- ../../c/pkcs1/Version.h:31
   pragma Import (C, Version_free, "Version_free");

   function Version_print
     (arg1 : System.Address;
      arg2 : System.Address;
      arg3 : int;
      arg4 : access function
        (arg1 : System.Address;
         arg2 : stddef_h.size_t;
         arg3 : System.Address) return int;
      arg5 : System.Address) return int;  -- ../../c/pkcs1/Version.h:32
   pragma Import (C, Version_print, "Version_print");

   function Version_constraint
     (arg1 : access constr_TYPE_h.asn_TYPE_descriptor_s;
      arg2 : System.Address;
      arg3 : access procedure
        (arg1 : System.Address;
         arg2 : access constr_TYPE_h.asn_TYPE_descriptor_s;
         arg3 : System.Address;
         arg4 : Interfaces.C.Strings.chars_ptr  -- , ...
         );
      arg4 : System.Address) return int;  -- ../../c/pkcs1/Version.h:33
   pragma Import (C, Version_constraint, "Version_constraint");

   function Version_decode_ber
     (arg1 : access asn_codecs_h.asn_codec_ctx_s;
      arg2 : access constr_TYPE_h.asn_TYPE_descriptor_s;
      arg3 : System.Address;
      arg4 : System.Address;
      arg5 : stddef_h.size_t;
      arg6 : int) return asn_codecs_h.asn_dec_rval_t;  -- ../../c/pkcs1/Version.h:34
   pragma Import (C, Version_decode_ber, "Version_decode_ber");

   function Version_encode_der
     (arg1 : access constr_TYPE_h.asn_TYPE_descriptor_s;
      arg2 : System.Address;
      arg3 : int;
      arg4 : ber_tlv_tag_h.ber_tlv_tag_t;
      arg5 : access function
        (arg1 : System.Address;
         arg2 : stddef_h.size_t;
         arg3 : System.Address) return int;
      arg6 : System.Address) return asn_codecs_h.asn_enc_rval_t;  -- ../../c/pkcs1/Version.h:35
   pragma Import (C, Version_encode_der, "Version_encode_der");

   function Version_decode_xer
     (arg1 : access asn_codecs_h.asn_codec_ctx_t;
      arg2 : access constr_TYPE_h.asn_TYPE_descriptor_s;
      arg3 : System.Address;
      arg4 : Interfaces.C.Strings.chars_ptr;
      arg5 : System.Address;
      arg6 : stddef_h.size_t) return asn_codecs_h.asn_dec_rval_t;  -- ../../c/pkcs1/Version.h:36
   pragma Import (C, Version_decode_xer, "Version_decode_xer");

   function Version_encode_xer
     (arg1 : access constr_TYPE_h.asn_TYPE_descriptor_s;
      arg2 : System.Address;
      arg3 : int;
      arg4 : xer_encoder_h.xer_encoder_flags_e;
      arg5 : access function
        (arg1 : System.Address;
         arg2 : stddef_h.size_t;
         arg3 : System.Address) return int;
      arg6 : System.Address) return asn_codecs_h.asn_enc_rval_t;  -- ../../c/pkcs1/Version.h:37
   pragma Import (C, Version_encode_xer, "Version_encode_xer");

end Version_h;
