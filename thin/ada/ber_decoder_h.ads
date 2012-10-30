with Interfaces.C; use Interfaces.C;
with asn_codecs_h;
with constr_TYPE_h;
with System;
with stddef_h;
with ber_tlv_length_h;

package ber_decoder_h is

   function ber_decode
     (opt_codec_ctx : access asn_codecs_h.asn_codec_ctx_s;
      type_descriptor : access constr_TYPE_h.asn_TYPE_descriptor_s;
      struct_ptr : System.Address;
      buffer : System.Address;
      size : stddef_h.size_t) return asn_codecs_h.asn_dec_rval_t;  -- ../../c/common/ber_decoder.h:22
   pragma Import (C, ber_decode, "ber_decode");

   --  skipped function type ber_type_decoder_f

   function ber_check_tags
     (opt_codec_ctx : access asn_codecs_h.asn_codec_ctx_s;
      type_descriptor : access constr_TYPE_h.asn_TYPE_descriptor_s;
      opt_ctx : access constr_TYPE_h.asn_struct_ctx_t;
      ptr : System.Address;
      size : stddef_h.size_t;
      tag_mode : int;
      last_tag_form : int;
      last_length : access ber_tlv_length_h.ber_tlv_len_t;
      opt_tlv_form : access int) return asn_codecs_h.asn_dec_rval_t;  -- ../../c/common/ber_decoder.h:49
   pragma Import (C, ber_check_tags, "ber_check_tags");

end ber_decoder_h;
