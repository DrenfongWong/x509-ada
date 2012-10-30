with Interfaces.C; use Interfaces.C;
with asn_codecs_prim_h;
with constr_TYPE_h;
with System;
with stddef_h;
with Interfaces.C.Strings;
with asn_codecs_h;
with ber_tlv_tag_h;
with xer_encoder_h;

package CertificateSerialNumber_h is

   subtype CertificateSerialNumber_t is asn_codecs_prim_h.ASN_u_PRIMITIVE_TYPE_s;

   asn_DEF_CertificateSerialNumber : aliased constr_TYPE_h.asn_TYPE_descriptor_t;  -- ../../c/x509/CertificateSerialNumber.h:24
   pragma Import (C, asn_DEF_CertificateSerialNumber, "asn_DEF_CertificateSerialNumber");

   procedure CertificateSerialNumber_free
     (arg1 : System.Address;
      arg2 : System.Address;
      arg3 : int);  -- ../../c/x509/CertificateSerialNumber.h:25
   pragma Import (C, CertificateSerialNumber_free, "CertificateSerialNumber_free");

   function CertificateSerialNumber_print
     (arg1 : System.Address;
      arg2 : System.Address;
      arg3 : int;
      arg4 : access function
        (arg1 : System.Address;
         arg2 : stddef_h.size_t;
         arg3 : System.Address) return int;
      arg5 : System.Address) return int;  -- ../../c/x509/CertificateSerialNumber.h:26
   pragma Import (C, CertificateSerialNumber_print, "CertificateSerialNumber_print");

   function CertificateSerialNumber_constraint
     (arg1 : access constr_TYPE_h.asn_TYPE_descriptor_s;
      arg2 : System.Address;
      arg3 : access procedure
        (arg1 : System.Address;
         arg2 : access constr_TYPE_h.asn_TYPE_descriptor_s;
         arg3 : System.Address;
         arg4 : Interfaces.C.Strings.chars_ptr  -- , ...
         );
      arg4 : System.Address) return int;  -- ../../c/x509/CertificateSerialNumber.h:27
   pragma Import (C, CertificateSerialNumber_constraint, "CertificateSerialNumber_constraint");

   function CertificateSerialNumber_decode_ber
     (arg1 : access asn_codecs_h.asn_codec_ctx_s;
      arg2 : access constr_TYPE_h.asn_TYPE_descriptor_s;
      arg3 : System.Address;
      arg4 : System.Address;
      arg5 : stddef_h.size_t;
      arg6 : int) return asn_codecs_h.asn_dec_rval_t;  -- ../../c/x509/CertificateSerialNumber.h:28
   pragma Import (C, CertificateSerialNumber_decode_ber, "CertificateSerialNumber_decode_ber");

   function CertificateSerialNumber_encode_der
     (arg1 : access constr_TYPE_h.asn_TYPE_descriptor_s;
      arg2 : System.Address;
      arg3 : int;
      arg4 : ber_tlv_tag_h.ber_tlv_tag_t;
      arg5 : access function
        (arg1 : System.Address;
         arg2 : stddef_h.size_t;
         arg3 : System.Address) return int;
      arg6 : System.Address) return asn_codecs_h.asn_enc_rval_t;  -- ../../c/x509/CertificateSerialNumber.h:29
   pragma Import (C, CertificateSerialNumber_encode_der, "CertificateSerialNumber_encode_der");

   function CertificateSerialNumber_decode_xer
     (arg1 : access asn_codecs_h.asn_codec_ctx_t;
      arg2 : access constr_TYPE_h.asn_TYPE_descriptor_s;
      arg3 : System.Address;
      arg4 : Interfaces.C.Strings.chars_ptr;
      arg5 : System.Address;
      arg6 : stddef_h.size_t) return asn_codecs_h.asn_dec_rval_t;  -- ../../c/x509/CertificateSerialNumber.h:30
   pragma Import (C, CertificateSerialNumber_decode_xer, "CertificateSerialNumber_decode_xer");

   function CertificateSerialNumber_encode_xer
     (arg1 : access constr_TYPE_h.asn_TYPE_descriptor_s;
      arg2 : System.Address;
      arg3 : int;
      arg4 : xer_encoder_h.xer_encoder_flags_e;
      arg5 : access function
        (arg1 : System.Address;
         arg2 : stddef_h.size_t;
         arg3 : System.Address) return int;
      arg6 : System.Address) return asn_codecs_h.asn_enc_rval_t;  -- ../../c/x509/CertificateSerialNumber.h:31
   pragma Import (C, CertificateSerialNumber_encode_xer, "CertificateSerialNumber_encode_xer");

end CertificateSerialNumber_h;
