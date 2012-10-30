with Interfaces.C; use Interfaces.C;
with stdint_h;
with constr_TYPE_h;
with System;
with stddef_h;
with asn_codecs_h;
with ber_tlv_tag_h;
with Interfaces.C.Strings;
with xer_encoder_h;
with per_support_h;

package OCTET_STRING_h is

   --  arg-macro: procedure OCTET_STRING_fromString (s, str)
   --    OCTET_STRING_fromBuf(s, str, -1)
   type OCTET_STRING is record
      buf : access stdint_h.uint8_t;  -- ../../c/common/OCTET_STRING.h:15
      size : aliased int;  -- ../../c/common/OCTET_STRING.h:16
      u_asn_ctx : aliased constr_TYPE_h.asn_struct_ctx_t;  -- ../../c/common/OCTET_STRING.h:18
   end record;
   pragma Convention (C_Pass_By_Copy, OCTET_STRING);  -- ../../c/common/OCTET_STRING.h:14

   subtype OCTET_STRING_t is OCTET_STRING;

   asn_DEF_OCTET_STRING : aliased constr_TYPE_h.asn_TYPE_descriptor_t;  -- ../../c/common/OCTET_STRING.h:21
   pragma Import (C, asn_DEF_OCTET_STRING, "asn_DEF_OCTET_STRING");

   procedure OCTET_STRING_free
     (arg1 : System.Address;
      arg2 : System.Address;
      arg3 : int);  -- ../../c/common/OCTET_STRING.h:23
   pragma Import (C, OCTET_STRING_free, "OCTET_STRING_free");

   function OCTET_STRING_print
     (arg1 : System.Address;
      arg2 : System.Address;
      arg3 : int;
      arg4 : access function
        (arg1 : System.Address;
         arg2 : stddef_h.size_t;
         arg3 : System.Address) return int;
      arg5 : System.Address) return int;  -- ../../c/common/OCTET_STRING.h:24
   pragma Import (C, OCTET_STRING_print, "OCTET_STRING_print");

   function OCTET_STRING_print_utf8
     (arg1 : System.Address;
      arg2 : System.Address;
      arg3 : int;
      arg4 : access function
        (arg1 : System.Address;
         arg2 : stddef_h.size_t;
         arg3 : System.Address) return int;
      arg5 : System.Address) return int;  -- ../../c/common/OCTET_STRING.h:25
   pragma Import (C, OCTET_STRING_print_utf8, "OCTET_STRING_print_utf8");

   function OCTET_STRING_decode_ber
     (arg1 : access asn_codecs_h.asn_codec_ctx_s;
      arg2 : access constr_TYPE_h.asn_TYPE_descriptor_s;
      arg3 : System.Address;
      arg4 : System.Address;
      arg5 : stddef_h.size_t;
      arg6 : int) return asn_codecs_h.asn_dec_rval_t;  -- ../../c/common/OCTET_STRING.h:26
   pragma Import (C, OCTET_STRING_decode_ber, "OCTET_STRING_decode_ber");

   function OCTET_STRING_encode_der
     (arg1 : access constr_TYPE_h.asn_TYPE_descriptor_s;
      arg2 : System.Address;
      arg3 : int;
      arg4 : ber_tlv_tag_h.ber_tlv_tag_t;
      arg5 : access function
        (arg1 : System.Address;
         arg2 : stddef_h.size_t;
         arg3 : System.Address) return int;
      arg6 : System.Address) return asn_codecs_h.asn_enc_rval_t;  -- ../../c/common/OCTET_STRING.h:27
   pragma Import (C, OCTET_STRING_encode_der, "OCTET_STRING_encode_der");

   function OCTET_STRING_decode_xer_hex
     (arg1 : access asn_codecs_h.asn_codec_ctx_t;
      arg2 : access constr_TYPE_h.asn_TYPE_descriptor_s;
      arg3 : System.Address;
      arg4 : Interfaces.C.Strings.chars_ptr;
      arg5 : System.Address;
      arg6 : stddef_h.size_t) return asn_codecs_h.asn_dec_rval_t;  -- ../../c/common/OCTET_STRING.h:28
   pragma Import (C, OCTET_STRING_decode_xer_hex, "OCTET_STRING_decode_xer_hex");

   function OCTET_STRING_decode_xer_binary
     (arg1 : access asn_codecs_h.asn_codec_ctx_t;
      arg2 : access constr_TYPE_h.asn_TYPE_descriptor_s;
      arg3 : System.Address;
      arg4 : Interfaces.C.Strings.chars_ptr;
      arg5 : System.Address;
      arg6 : stddef_h.size_t) return asn_codecs_h.asn_dec_rval_t;  -- ../../c/common/OCTET_STRING.h:29
   pragma Import (C, OCTET_STRING_decode_xer_binary, "OCTET_STRING_decode_xer_binary");

   function OCTET_STRING_decode_xer_utf8
     (arg1 : access asn_codecs_h.asn_codec_ctx_t;
      arg2 : access constr_TYPE_h.asn_TYPE_descriptor_s;
      arg3 : System.Address;
      arg4 : Interfaces.C.Strings.chars_ptr;
      arg5 : System.Address;
      arg6 : stddef_h.size_t) return asn_codecs_h.asn_dec_rval_t;  -- ../../c/common/OCTET_STRING.h:30
   pragma Import (C, OCTET_STRING_decode_xer_utf8, "OCTET_STRING_decode_xer_utf8");

   function OCTET_STRING_encode_xer
     (arg1 : access constr_TYPE_h.asn_TYPE_descriptor_s;
      arg2 : System.Address;
      arg3 : int;
      arg4 : xer_encoder_h.xer_encoder_flags_e;
      arg5 : access function
        (arg1 : System.Address;
         arg2 : stddef_h.size_t;
         arg3 : System.Address) return int;
      arg6 : System.Address) return asn_codecs_h.asn_enc_rval_t;  -- ../../c/common/OCTET_STRING.h:31
   pragma Import (C, OCTET_STRING_encode_xer, "OCTET_STRING_encode_xer");

   function OCTET_STRING_encode_xer_utf8
     (arg1 : access constr_TYPE_h.asn_TYPE_descriptor_s;
      arg2 : System.Address;
      arg3 : int;
      arg4 : xer_encoder_h.xer_encoder_flags_e;
      arg5 : access function
        (arg1 : System.Address;
         arg2 : stddef_h.size_t;
         arg3 : System.Address) return int;
      arg6 : System.Address) return asn_codecs_h.asn_enc_rval_t;  -- ../../c/common/OCTET_STRING.h:32
   pragma Import (C, OCTET_STRING_encode_xer_utf8, "OCTET_STRING_encode_xer_utf8");

   function OCTET_STRING_decode_uper
     (arg1 : access asn_codecs_h.asn_codec_ctx_t;
      arg2 : access constr_TYPE_h.asn_TYPE_descriptor_s;
      arg3 : access per_support_h.asn_per_constraints_t;
      arg4 : System.Address;
      arg5 : access per_support_h.asn_per_data_t) return asn_codecs_h.asn_dec_rval_t;  -- ../../c/common/OCTET_STRING.h:33
   pragma Import (C, OCTET_STRING_decode_uper, "OCTET_STRING_decode_uper");

   function OCTET_STRING_encode_uper
     (arg1 : access constr_TYPE_h.asn_TYPE_descriptor_s;
      arg2 : access per_support_h.asn_per_constraints_t;
      arg3 : System.Address;
      arg4 : access per_support_h.asn_per_outp_t) return asn_codecs_h.asn_enc_rval_t;  -- ../../c/common/OCTET_STRING.h:34
   pragma Import (C, OCTET_STRING_encode_uper, "OCTET_STRING_encode_uper");

   function OCTET_STRING_fromBuf
     (s : access OCTET_STRING_t;
      str : Interfaces.C.Strings.chars_ptr;
      size : int) return int;  -- ../../c/common/OCTET_STRING.h:49
   pragma Import (C, OCTET_STRING_fromBuf, "OCTET_STRING_fromBuf");

   function OCTET_STRING_new_fromBuf
     (td : access constr_TYPE_h.asn_TYPE_descriptor_t;
      str : Interfaces.C.Strings.chars_ptr;
      size : int) return access OCTET_STRING_t;  -- ../../c/common/OCTET_STRING.h:59
   pragma Import (C, OCTET_STRING_new_fromBuf, "OCTET_STRING_new_fromBuf");

   type asn_OS_Subvariant is
     (ASN_OSUBV_ANY,
      ASN_OSUBV_BIT,
      ASN_OSUBV_STR,
      ASN_OSUBV_U16,
      ASN_OSUBV_U32);
   pragma Convention (C, asn_OS_Subvariant);  -- ../../c/common/OCTET_STRING.h:66

   type asn_OCTET_STRING_specifics_s is record
      struct_size : aliased int;  -- ../../c/common/OCTET_STRING.h:79
      ctx_offset : aliased int;  -- ../../c/common/OCTET_STRING.h:80
      subvariant : aliased asn_OS_Subvariant;  -- ../../c/common/OCTET_STRING.h:82
   end record;
   pragma Convention (C_Pass_By_Copy, asn_OCTET_STRING_specifics_s);  -- ../../c/common/OCTET_STRING.h:75

   subtype asn_OCTET_STRING_specifics_t is asn_OCTET_STRING_specifics_s;

end OCTET_STRING_h;
