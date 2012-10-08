with Interfaces.C; use Interfaces.C;
with asn_codecs_prim_h;
with constr_TYPE_h;
with stddef_h;
with Interfaces.C.Strings;
with System;
with asn_codecs_h;
with ber_tlv_tag_h;
with xer_encoder_h;
with per_support_h;

package INTEGER_h is

   subtype INTEGER_t is asn_codecs_prim_h.ASN_u_PRIMITIVE_TYPE_s;

   asn_DEF_INTEGER : aliased constr_TYPE_h.asn_TYPE_descriptor_t;  -- ../../c/pkcs1/INTEGER.h:17
   pragma Import (C, asn_DEF_INTEGER, "asn_DEF_INTEGER");

   type asn_INTEGER_enum_map_s is record
      nat_value : aliased long;  -- ../../c/pkcs1/INTEGER.h:21
      enum_len : aliased stddef_h.size_t;  -- ../../c/pkcs1/INTEGER.h:22
      enum_name : Interfaces.C.Strings.chars_ptr;  -- ../../c/pkcs1/INTEGER.h:23
   end record;
   pragma Convention (C_Pass_By_Copy, asn_INTEGER_enum_map_s);  -- ../../c/pkcs1/INTEGER.h:20

   subtype asn_INTEGER_enum_map_t is asn_INTEGER_enum_map_s;

   type asn_INTEGER_specifics_s is record
      value2enum : access asn_INTEGER_enum_map_t;  -- ../../c/pkcs1/INTEGER.h:28
      enum2value : access unsigned;  -- ../../c/pkcs1/INTEGER.h:29
      map_count : aliased int;  -- ../../c/pkcs1/INTEGER.h:30
      extension : aliased int;  -- ../../c/pkcs1/INTEGER.h:31
      strict_enumeration : aliased int;  -- ../../c/pkcs1/INTEGER.h:32
      field_width : aliased int;  -- ../../c/pkcs1/INTEGER.h:33
      field_unsigned : aliased int;  -- ../../c/pkcs1/INTEGER.h:34
   end record;
   pragma Convention (C_Pass_By_Copy, asn_INTEGER_specifics_s);  -- ../../c/pkcs1/INTEGER.h:27

   subtype asn_INTEGER_specifics_t is asn_INTEGER_specifics_s;

   function INTEGER_print
     (arg1 : System.Address;
      arg2 : System.Address;
      arg3 : int;
      arg4 : access function
        (arg1 : System.Address;
         arg2 : stddef_h.size_t;
         arg3 : System.Address) return int;
      arg5 : System.Address) return int;  -- ../../c/pkcs1/INTEGER.h:37
   pragma Import (C, INTEGER_print, "INTEGER_print");

   function INTEGER_decode_ber
     (arg1 : access asn_codecs_h.asn_codec_ctx_s;
      arg2 : access constr_TYPE_h.asn_TYPE_descriptor_s;
      arg3 : System.Address;
      arg4 : System.Address;
      arg5 : stddef_h.size_t;
      arg6 : int) return asn_codecs_h.asn_dec_rval_t;  -- ../../c/pkcs1/INTEGER.h:38
   pragma Import (C, INTEGER_decode_ber, "INTEGER_decode_ber");

   function INTEGER_encode_der
     (arg1 : access constr_TYPE_h.asn_TYPE_descriptor_s;
      arg2 : System.Address;
      arg3 : int;
      arg4 : ber_tlv_tag_h.ber_tlv_tag_t;
      arg5 : access function
        (arg1 : System.Address;
         arg2 : stddef_h.size_t;
         arg3 : System.Address) return int;
      arg6 : System.Address) return asn_codecs_h.asn_enc_rval_t;  -- ../../c/pkcs1/INTEGER.h:39
   pragma Import (C, INTEGER_encode_der, "INTEGER_encode_der");

   function INTEGER_decode_xer
     (arg1 : access asn_codecs_h.asn_codec_ctx_t;
      arg2 : access constr_TYPE_h.asn_TYPE_descriptor_s;
      arg3 : System.Address;
      arg4 : Interfaces.C.Strings.chars_ptr;
      arg5 : System.Address;
      arg6 : stddef_h.size_t) return asn_codecs_h.asn_dec_rval_t;  -- ../../c/pkcs1/INTEGER.h:40
   pragma Import (C, INTEGER_decode_xer, "INTEGER_decode_xer");

   function INTEGER_encode_xer
     (arg1 : access constr_TYPE_h.asn_TYPE_descriptor_s;
      arg2 : System.Address;
      arg3 : int;
      arg4 : xer_encoder_h.xer_encoder_flags_e;
      arg5 : access function
        (arg1 : System.Address;
         arg2 : stddef_h.size_t;
         arg3 : System.Address) return int;
      arg6 : System.Address) return asn_codecs_h.asn_enc_rval_t;  -- ../../c/pkcs1/INTEGER.h:41
   pragma Import (C, INTEGER_encode_xer, "INTEGER_encode_xer");

   function INTEGER_decode_uper
     (arg1 : access asn_codecs_h.asn_codec_ctx_t;
      arg2 : access constr_TYPE_h.asn_TYPE_descriptor_s;
      arg3 : access per_support_h.asn_per_constraints_t;
      arg4 : System.Address;
      arg5 : access per_support_h.asn_per_data_t) return asn_codecs_h.asn_dec_rval_t;  -- ../../c/pkcs1/INTEGER.h:42
   pragma Import (C, INTEGER_decode_uper, "INTEGER_decode_uper");

   function INTEGER_encode_uper
     (arg1 : access constr_TYPE_h.asn_TYPE_descriptor_s;
      arg2 : access per_support_h.asn_per_constraints_t;
      arg3 : System.Address;
      arg4 : access per_support_h.asn_per_outp_t) return asn_codecs_h.asn_enc_rval_t;  -- ../../c/pkcs1/INTEGER.h:43
   pragma Import (C, INTEGER_encode_uper, "INTEGER_encode_uper");

   function asn_INTEGER2long (i : System.Address; l : access long) return int;  -- ../../c/pkcs1/INTEGER.h:55
   pragma Import (C, asn_INTEGER2long, "asn_INTEGER2long");

   function asn_INTEGER2ulong (i : System.Address; l : access unsigned_long) return int;  -- ../../c/pkcs1/INTEGER.h:56
   pragma Import (C, asn_INTEGER2ulong, "asn_INTEGER2ulong");

   function asn_long2INTEGER (i : access INTEGER_t; l : long) return int;  -- ../../c/pkcs1/INTEGER.h:57
   pragma Import (C, asn_long2INTEGER, "asn_long2INTEGER");

   function asn_ulong2INTEGER (i : access INTEGER_t; l : unsigned_long) return int;  -- ../../c/pkcs1/INTEGER.h:58
   pragma Import (C, asn_ulong2INTEGER, "asn_ulong2INTEGER");

   function INTEGER_map_value2enum (specs : access asn_INTEGER_specifics_t; value : long) return System.Address;  -- ../../c/pkcs1/INTEGER.h:63
   pragma Import (C, INTEGER_map_value2enum, "INTEGER_map_value2enum");

end INTEGER_h;
