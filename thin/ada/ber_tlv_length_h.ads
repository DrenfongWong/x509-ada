with Interfaces.C; use Interfaces.C;
with stdio_h;
with System;
with stddef_h;
limited with asn_codecs_h;

package ber_tlv_length_h is

   subtype ber_tlv_len_t is stdio_h.ssize_t;  -- ../../c/common/ber_tlv_length.h:12

   function ber_fetch_length
     (u_is_constructed : int;
      bufptr : System.Address;
      size : stddef_h.size_t;
      len_r : access ber_tlv_len_t) return stdio_h.ssize_t;  -- ../../c/common/ber_tlv_length.h:24
   pragma Import (C, ber_fetch_length, "ber_fetch_length");

   function ber_skip_length
     (opt_codec_ctx : access asn_codecs_h.asn_codec_ctx_s;
      u_is_constructed : int;
      bufptr : System.Address;
      size : stddef_h.size_t) return stdio_h.ssize_t;  -- ../../c/common/ber_tlv_length.h:34
   pragma Import (C, ber_skip_length, "ber_skip_length");

   function der_tlv_length_serialize
     (len : ber_tlv_len_t;
      bufptr : System.Address;
      size : stddef_h.size_t) return stddef_h.size_t;  -- ../../c/common/ber_tlv_length.h:44
   pragma Import (C, der_tlv_length_serialize, "der_tlv_length_serialize");

end ber_tlv_length_h;
