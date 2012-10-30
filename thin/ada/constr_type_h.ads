with Interfaces.C; use Interfaces.C;
with System;
with ber_tlv_length_h;
with ber_tlv_tag_h;
with Interfaces.C.Strings;
with stddef_h;
with asn_codecs_h;
with xer_encoder_h;
with per_support_h;
with stdio_h;

package constr_TYPE_h is

   --  arg-macro: function ASN_STRUCT_FREE (asn_DEF, ptr)
   --    return asn_DEF).free_struct(and(asn_DEF),ptr,0;
   --  arg-macro: function ASN_STRUCT_FREE_CONTENTS_ONLY (asn_DEF, ptr)
   --    return asn_DEF).free_struct(and(asn_DEF),ptr,1;
   type asn_struct_ctx_s is record
      phase : aliased short;  -- ../../c/common/constr_TYPE.h:31
      step : aliased short;  -- ../../c/common/constr_TYPE.h:32
      context : aliased int;  -- ../../c/common/constr_TYPE.h:33
      ptr : System.Address;  -- ../../c/common/constr_TYPE.h:34
      left : aliased ber_tlv_length_h.ber_tlv_len_t;  -- ../../c/common/constr_TYPE.h:35
   end record;
   pragma Convention (C_Pass_By_Copy, asn_struct_ctx_s);  -- ../../c/common/constr_TYPE.h:30

   subtype asn_struct_ctx_t is asn_struct_ctx_s;

   --  skipped function type asn_struct_free_f

   --  skipped function type asn_struct_print_f

   --  skipped function type asn_outmost_tag_f

   function asn_TYPE_outmost_tag
     (arg1 : System.Address;
      arg2 : System.Address;
      arg3 : int;
      arg4 : ber_tlv_tag_h.ber_tlv_tag_t) return ber_tlv_tag_h.ber_tlv_tag_t;  -- ../../c/common/constr_TYPE.h:79
   pragma Import (C, asn_TYPE_outmost_tag, "asn_TYPE_outmost_tag");

   type asn_TYPE_member_s;
   type asn_TYPE_descriptor_s is record
      name : Interfaces.C.Strings.chars_ptr;  -- ../../c/common/constr_TYPE.h:86
      xml_tag : Interfaces.C.Strings.chars_ptr;  -- ../../c/common/constr_TYPE.h:87
      free_struct : access procedure
           (arg1 : System.Address;
            arg2 : System.Address;
            arg3 : int);  -- ../../c/common/constr_TYPE.h:93
      print_struct : access function
           (arg1 : System.Address;
            arg2 : System.Address;
            arg3 : int;
            arg4 : access function
              (arg1 : System.Address;
               arg2 : stddef_h.size_t;
               arg3 : System.Address) return int;
            arg5 : System.Address) return int;  -- ../../c/common/constr_TYPE.h:94
      check_constraints : access function
           (arg1 : access asn_TYPE_descriptor_s;
            arg2 : System.Address;
            arg3 : access procedure
              (arg1 : System.Address;
               arg2 : access asn_TYPE_descriptor_s;
               arg3 : System.Address;
               arg4 : Interfaces.C.Strings.chars_ptr  -- , ...
               );
            arg4 : System.Address) return int;  -- ../../c/common/constr_TYPE.h:95
      ber_decoder : access function
           (arg1 : access asn_codecs_h.asn_codec_ctx_s;
            arg2 : access asn_TYPE_descriptor_s;
            arg3 : System.Address;
            arg4 : System.Address;
            arg5 : stddef_h.size_t;
            arg6 : int) return asn_codecs_h.asn_dec_rval_t;  -- ../../c/common/constr_TYPE.h:96
      der_encoder : access function
           (arg1 : access asn_TYPE_descriptor_s;
            arg2 : System.Address;
            arg3 : int;
            arg4 : ber_tlv_tag_h.ber_tlv_tag_t;
            arg5 : access function
              (arg1 : System.Address;
               arg2 : stddef_h.size_t;
               arg3 : System.Address) return int;
            arg6 : System.Address) return asn_codecs_h.asn_enc_rval_t;  -- ../../c/common/constr_TYPE.h:97
      xer_decoder : access function
           (arg1 : access asn_codecs_h.asn_codec_ctx_t;
            arg2 : access asn_TYPE_descriptor_s;
            arg3 : System.Address;
            arg4 : Interfaces.C.Strings.chars_ptr;
            arg5 : System.Address;
            arg6 : stddef_h.size_t) return asn_codecs_h.asn_dec_rval_t;  -- ../../c/common/constr_TYPE.h:98
      xer_encoder : access function
           (arg1 : access asn_TYPE_descriptor_s;
            arg2 : System.Address;
            arg3 : int;
            arg4 : xer_encoder_h.xer_encoder_flags_e;
            arg5 : access function
              (arg1 : System.Address;
               arg2 : stddef_h.size_t;
               arg3 : System.Address) return int;
            arg6 : System.Address) return asn_codecs_h.asn_enc_rval_t;  -- ../../c/common/constr_TYPE.h:99
      uper_decoder : access function
           (arg1 : access asn_codecs_h.asn_codec_ctx_t;
            arg2 : access asn_TYPE_descriptor_s;
            arg3 : access per_support_h.asn_per_constraints_t;
            arg4 : System.Address;
            arg5 : access per_support_h.asn_per_data_t) return asn_codecs_h.asn_dec_rval_t;  -- ../../c/common/constr_TYPE.h:100
      uper_encoder : access function
           (arg1 : access asn_TYPE_descriptor_s;
            arg2 : access per_support_h.asn_per_constraints_t;
            arg3 : System.Address;
            arg4 : access per_support_h.asn_per_outp_t) return asn_codecs_h.asn_enc_rval_t;  -- ../../c/common/constr_TYPE.h:101
      outmost_tag : access function
           (arg1 : System.Address;
            arg2 : System.Address;
            arg3 : int;
            arg4 : ber_tlv_tag_h.ber_tlv_tag_t) return ber_tlv_tag_h.ber_tlv_tag_t;  -- ../../c/common/constr_TYPE.h:110
      tags : access ber_tlv_tag_h.ber_tlv_tag_t;  -- ../../c/common/constr_TYPE.h:111
      tags_count : aliased int;  -- ../../c/common/constr_TYPE.h:112
      all_tags : access ber_tlv_tag_h.ber_tlv_tag_t;  -- ../../c/common/constr_TYPE.h:113
      all_tags_count : aliased int;  -- ../../c/common/constr_TYPE.h:114
      per_constraints : access per_support_h.asn_per_constraints_t;  -- ../../c/common/constr_TYPE.h:116
      elements : access asn_TYPE_member_s;  -- ../../c/common/constr_TYPE.h:121
      elements_count : aliased int;  -- ../../c/common/constr_TYPE.h:122
      specifics : System.Address;  -- ../../c/common/constr_TYPE.h:128
   end record;
   pragma Convention (C_Pass_By_Copy, asn_TYPE_descriptor_s);  -- ../../c/common/constr_TYPE.h:85

   subtype asn_TYPE_descriptor_t is asn_TYPE_descriptor_s;

   type asn_TYPE_flags_e is
     (ATF_NOFLAGS,
      ATF_POINTER,
      ATF_OPEN_TYPE);
   pragma Convention (C, asn_TYPE_flags_e);  -- ../../c/common/constr_TYPE.h:135

   type asn_TYPE_member_s is record
      flags : aliased asn_TYPE_flags_e;  -- ../../c/common/constr_TYPE.h:141
      optional : aliased int;  -- ../../c/common/constr_TYPE.h:142
      memb_offset : aliased int;  -- ../../c/common/constr_TYPE.h:143
      tag : aliased ber_tlv_tag_h.ber_tlv_tag_t;  -- ../../c/common/constr_TYPE.h:144
      tag_mode : aliased int;  -- ../../c/common/constr_TYPE.h:145
      c_type : access asn_TYPE_descriptor_t;  -- ../../c/common/constr_TYPE.h:146
      memb_constraints : access function
           (arg1 : access asn_TYPE_descriptor_s;
            arg2 : System.Address;
            arg3 : access procedure
              (arg1 : System.Address;
               arg2 : access asn_TYPE_descriptor_s;
               arg3 : System.Address;
               arg4 : Interfaces.C.Strings.chars_ptr  -- , ...
               );
            arg4 : System.Address) return int;  -- ../../c/common/constr_TYPE.h:147
      per_constraints : access per_support_h.asn_per_constraints_t;  -- ../../c/common/constr_TYPE.h:148
      default_value : access function (arg1 : int; arg2 : System.Address) return int;  -- ../../c/common/constr_TYPE.h:149
      name : Interfaces.C.Strings.chars_ptr;  -- ../../c/common/constr_TYPE.h:150
   end record;
   pragma Convention (C_Pass_By_Copy, asn_TYPE_member_s);  -- ../../c/common/constr_TYPE.h:140

   subtype asn_TYPE_member_t is asn_TYPE_member_s;

   type asn_TYPE_tag2member_s is record
      el_tag : aliased ber_tlv_tag_h.ber_tlv_tag_t;  -- ../../c/common/constr_TYPE.h:157
      el_no : aliased int;  -- ../../c/common/constr_TYPE.h:158
      toff_first : aliased int;  -- ../../c/common/constr_TYPE.h:159
      toff_last : aliased int;  -- ../../c/common/constr_TYPE.h:160
   end record;
   pragma Convention (C_Pass_By_Copy, asn_TYPE_tag2member_s);  -- ../../c/common/constr_TYPE.h:156

   subtype asn_TYPE_tag2member_t is asn_TYPE_tag2member_s;

   function asn_fprint
     (stream : access stdio_h.FILE;
      td : access asn_TYPE_descriptor_t;
      struct_ptr : System.Address) return int;  -- ../../c/common/constr_TYPE.h:172
   pragma Import (C, asn_fprint, "asn_fprint");

end constr_TYPE_h;
