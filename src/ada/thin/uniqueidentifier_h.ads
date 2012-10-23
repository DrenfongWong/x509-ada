with Interfaces.C; use Interfaces.C;
with BIT_STRING_h;
with constr_TYPE_h;
with System;
with stddef_h;
with Interfaces.C.Strings;
with asn_codecs_h;
with ber_tlv_tag_h;
with xer_encoder_h;

package UniqueIdentifier_h is

   subtype UniqueIdentifier_t is BIT_STRING_h.BIT_STRING_s;

   asn_DEF_UniqueIdentifier : aliased constr_TYPE_h.asn_TYPE_descriptor_t;  -- ../../c/x509/UniqueIdentifier.h:24
   pragma Import (C, asn_DEF_UniqueIdentifier, "asn_DEF_UniqueIdentifier");

   procedure UniqueIdentifier_free
     (arg1 : System.Address;
      arg2 : System.Address;
      arg3 : int);  -- ../../c/x509/UniqueIdentifier.h:25
   pragma Import (C, UniqueIdentifier_free, "UniqueIdentifier_free");

   function UniqueIdentifier_print
     (arg1 : System.Address;
      arg2 : System.Address;
      arg3 : int;
      arg4 : access function
        (arg1 : System.Address;
         arg2 : stddef_h.size_t;
         arg3 : System.Address) return int;
      arg5 : System.Address) return int;  -- ../../c/x509/UniqueIdentifier.h:26
   pragma Import (C, UniqueIdentifier_print, "UniqueIdentifier_print");

   function UniqueIdentifier_constraint
     (arg1 : access constr_TYPE_h.asn_TYPE_descriptor_s;
      arg2 : System.Address;
      arg3 : access procedure
        (arg1 : System.Address;
         arg2 : access constr_TYPE_h.asn_TYPE_descriptor_s;
         arg3 : System.Address;
         arg4 : Interfaces.C.Strings.chars_ptr  -- , ...
         );
      arg4 : System.Address) return int;  -- ../../c/x509/UniqueIdentifier.h:27
   pragma Import (C, UniqueIdentifier_constraint, "UniqueIdentifier_constraint");

   function UniqueIdentifier_decode_ber
     (arg1 : access asn_codecs_h.asn_codec_ctx_s;
      arg2 : access constr_TYPE_h.asn_TYPE_descriptor_s;
      arg3 : System.Address;
      arg4 : System.Address;
      arg5 : stddef_h.size_t;
      arg6 : int) return asn_codecs_h.asn_dec_rval_t;  -- ../../c/x509/UniqueIdentifier.h:28
   pragma Import (C, UniqueIdentifier_decode_ber, "UniqueIdentifier_decode_ber");

   function UniqueIdentifier_encode_der
     (arg1 : access constr_TYPE_h.asn_TYPE_descriptor_s;
      arg2 : System.Address;
      arg3 : int;
      arg4 : ber_tlv_tag_h.ber_tlv_tag_t;
      arg5 : access function
        (arg1 : System.Address;
         arg2 : stddef_h.size_t;
         arg3 : System.Address) return int;
      arg6 : System.Address) return asn_codecs_h.asn_enc_rval_t;  -- ../../c/x509/UniqueIdentifier.h:29
   pragma Import (C, UniqueIdentifier_encode_der, "UniqueIdentifier_encode_der");

   function UniqueIdentifier_decode_xer
     (arg1 : access asn_codecs_h.asn_codec_ctx_t;
      arg2 : access constr_TYPE_h.asn_TYPE_descriptor_s;
      arg3 : System.Address;
      arg4 : Interfaces.C.Strings.chars_ptr;
      arg5 : System.Address;
      arg6 : stddef_h.size_t) return asn_codecs_h.asn_dec_rval_t;  -- ../../c/x509/UniqueIdentifier.h:30
   pragma Import (C, UniqueIdentifier_decode_xer, "UniqueIdentifier_decode_xer");

   function UniqueIdentifier_encode_xer
     (arg1 : access constr_TYPE_h.asn_TYPE_descriptor_s;
      arg2 : System.Address;
      arg3 : int;
      arg4 : xer_encoder_h.xer_encoder_flags_e;
      arg5 : access function
        (arg1 : System.Address;
         arg2 : stddef_h.size_t;
         arg3 : System.Address) return int;
      arg6 : System.Address) return asn_codecs_h.asn_enc_rval_t;  -- ../../c/x509/UniqueIdentifier.h:31
   pragma Import (C, UniqueIdentifier_encode_xer, "UniqueIdentifier_encode_xer");

end UniqueIdentifier_h;
