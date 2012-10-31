with Interfaces.C; use Interfaces.C;
with constr_TYPE_h;
with System;
with stddef_h;
with asn_codecs_h;
with ber_tlv_tag_h;
with stdio_h;

package der_encoder_h is

   function der_encode
     (type_descriptor : access constr_TYPE_h.asn_TYPE_descriptor_s;
      struct_ptr : System.Address;
      consume_bytes_cb : access function
        (arg1 : System.Address;
         arg2 : stddef_h.size_t;
         arg3 : System.Address) return int;
      app_key : System.Address) return asn_codecs_h.asn_enc_rval_t;  -- ../c/common/der_encoder.h:20
   pragma Import (C, der_encode, "der_encode");

   function der_encode_to_buffer
     (type_descriptor : access constr_TYPE_h.asn_TYPE_descriptor_s;
      struct_ptr : System.Address;
      buffer : System.Address;
      buffer_size : stddef_h.size_t) return asn_codecs_h.asn_enc_rval_t;  -- ../c/common/der_encoder.h:27
   pragma Import (C, der_encode_to_buffer, "der_encode_to_buffer");

   --  skipped function type der_type_encoder_f

   function der_write_tags
     (type_descriptor : access constr_TYPE_h.asn_TYPE_descriptor_s;
      struct_length : stddef_h.size_t;
      tag_mode : int;
      last_tag_form : int;
      tag : ber_tlv_tag_h.ber_tlv_tag_t;
      consume_bytes_cb : access function
        (arg1 : System.Address;
         arg2 : stddef_h.size_t;
         arg3 : System.Address) return int;
      app_key : System.Address) return stdio_h.ssize_t;  -- ../c/common/der_encoder.h:54
   pragma Import (C, der_write_tags, "der_write_tags");

end der_encoder_h;
