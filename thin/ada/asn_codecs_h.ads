with Interfaces.C; use Interfaces.C;
with stddef_h;
with stdio_h;
limited with constr_TYPE_h;
with System;

package asn_codecs_h is

   type asn_codec_ctx_s is record
      max_stack_size : aliased stddef_h.size_t;  -- ../../c/common/asn_codecs.h:36
   end record;
   pragma Convention (C_Pass_By_Copy, asn_codec_ctx_s);  -- ../../c/common/asn_codecs.h:24

   subtype asn_codec_ctx_t is asn_codec_ctx_s;

   type asn_enc_rval_s is record
      encoded : aliased stdio_h.ssize_t;  -- ../../c/common/asn_codecs.h:48
      failed_type : access constr_TYPE_h.asn_TYPE_descriptor_s;  -- ../../c/common/asn_codecs.h:55
      structure_ptr : System.Address;  -- ../../c/common/asn_codecs.h:58
   end record;
   pragma Convention (C_Pass_By_Copy, asn_enc_rval_s);  -- ../../c/common/asn_codecs.h:42

   subtype asn_enc_rval_t is asn_enc_rval_s;

   type asn_dec_rval_code_e is 
     (RC_OK,
      RC_WMORE,
      RC_FAIL);
   pragma Convention (C, asn_dec_rval_code_e);  -- ../../c/common/asn_codecs.h:82

   type asn_dec_rval_s is record
      code : aliased asn_dec_rval_code_e;  -- ../../c/common/asn_codecs.h:88
      consumed : aliased stddef_h.size_t;  -- ../../c/common/asn_codecs.h:89
   end record;
   pragma Convention (C_Pass_By_Copy, asn_dec_rval_s);  -- ../../c/common/asn_codecs.h:87

   subtype asn_dec_rval_t is asn_dec_rval_s;

end asn_codecs_h;
