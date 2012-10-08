with Interfaces.C; use Interfaces.C;
limited with constr_TYPE_h;
with System;
with stddef_h;
with asn_codecs_h;
with stdio_h;

package xer_encoder_h is

   subtype xer_encoder_flags_e is unsigned;
   XER_F_BASIC : constant xer_encoder_flags_e := 1;
   XER_F_CANONICAL : constant xer_encoder_flags_e := 2;  -- ../../c/pkcs1/xer_encoder.h:17

   function xer_encode
     (type_descriptor : access constr_TYPE_h.asn_TYPE_descriptor_s;
      struct_ptr : System.Address;
      xer_flags : xer_encoder_flags_e;
      consume_bytes_cb : access function
        (arg1 : System.Address;
         arg2 : stddef_h.size_t;
         arg3 : System.Address) return int;
      app_key : System.Address) return asn_codecs_h.asn_enc_rval_t;  -- ../../c/pkcs1/xer_encoder.h:26
   pragma Import (C, xer_encode, "xer_encode");

   function xer_fprint
     (stream : access stdio_h.FILE;
      td : access constr_TYPE_h.asn_TYPE_descriptor_s;
      sptr : System.Address) return int;  -- ../../c/pkcs1/xer_encoder.h:41
   pragma Import (C, xer_fprint, "xer_fprint");

   --  skipped function type xer_type_encoder_f

end xer_encoder_h;
