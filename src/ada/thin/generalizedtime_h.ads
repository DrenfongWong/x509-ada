with Interfaces.C; use Interfaces.C;
with OCTET_STRING_h;
with constr_TYPE_h;
with System;
with stddef_h;
with Interfaces.C.Strings;
with ber_tlv_tag_h;
with asn_codecs_h;
with xer_encoder_h;
with time_h;

package GeneralizedTime_h is

   subtype GeneralizedTime_t is OCTET_STRING_h.OCTET_STRING;

   asn_DEF_GeneralizedTime : aliased constr_TYPE_h.asn_TYPE_descriptor_t;  -- ../../c/x509/GeneralizedTime.h:16
   pragma Import (C, asn_DEF_GeneralizedTime, "asn_DEF_GeneralizedTime");

   function GeneralizedTime_print
     (arg1 : System.Address;
      arg2 : System.Address;
      arg3 : int;
      arg4 : access function
        (arg1 : System.Address;
         arg2 : stddef_h.size_t;
         arg3 : System.Address) return int;
      arg5 : System.Address) return int;  -- ../../c/x509/GeneralizedTime.h:18
   pragma Import (C, GeneralizedTime_print, "GeneralizedTime_print");

   function GeneralizedTime_constraint
     (arg1 : access constr_TYPE_h.asn_TYPE_descriptor_s;
      arg2 : System.Address;
      arg3 : access procedure
        (arg1 : System.Address;
         arg2 : access constr_TYPE_h.asn_TYPE_descriptor_s;
         arg3 : System.Address;
         arg4 : Interfaces.C.Strings.chars_ptr  -- , ...
         );
      arg4 : System.Address) return int;  -- ../../c/x509/GeneralizedTime.h:19
   pragma Import (C, GeneralizedTime_constraint, "GeneralizedTime_constraint");

   function GeneralizedTime_encode_der
     (arg1 : access constr_TYPE_h.asn_TYPE_descriptor_s;
      arg2 : System.Address;
      arg3 : int;
      arg4 : ber_tlv_tag_h.ber_tlv_tag_t;
      arg5 : access function
        (arg1 : System.Address;
         arg2 : stddef_h.size_t;
         arg3 : System.Address) return int;
      arg6 : System.Address) return asn_codecs_h.asn_enc_rval_t;  -- ../../c/x509/GeneralizedTime.h:20
   pragma Import (C, GeneralizedTime_encode_der, "GeneralizedTime_encode_der");

   function GeneralizedTime_encode_xer
     (arg1 : access constr_TYPE_h.asn_TYPE_descriptor_s;
      arg2 : System.Address;
      arg3 : int;
      arg4 : xer_encoder_h.xer_encoder_flags_e;
      arg5 : access function
        (arg1 : System.Address;
         arg2 : stddef_h.size_t;
         arg3 : System.Address) return int;
      arg6 : System.Address) return asn_codecs_h.asn_enc_rval_t;  -- ../../c/x509/GeneralizedTime.h:21
   pragma Import (C, GeneralizedTime_encode_xer, "GeneralizedTime_encode_xer");

   function asn_GT2time
     (arg1 : System.Address;
      u_optional_tm4fill : System.Address;
      as_gmt : int) return time_h.time_t;  -- ../../c/x509/GeneralizedTime.h:36
   pragma Import (C, asn_GT2time, "asn_GT2time");

   function asn_GT2time_frac
     (arg1 : System.Address;
      frac_value : access int;
      frac_digits : access int;
      u_optional_tm4fill : System.Address;
      as_gmt : int) return time_h.time_t;  -- ../../c/x509/GeneralizedTime.h:40
   pragma Import (C, asn_GT2time_frac, "asn_GT2time_frac");

   function asn_GT2time_prec
     (arg1 : System.Address;
      frac_value : access int;
      frac_digits : int;
      u_optional_tm4fill : System.Address;
      as_gmt : int) return time_h.time_t;  -- ../../c/x509/GeneralizedTime.h:49
   pragma Import (C, asn_GT2time_prec, "asn_GT2time_prec");

   function asn_time2GT
     (u_optional_gt : access GeneralizedTime_t;
      arg2 : System.Address;
      force_gmt : int) return access GeneralizedTime_t;  -- ../../c/x509/GeneralizedTime.h:60
   pragma Import (C, asn_time2GT, "asn_time2GT");

   function asn_time2GT_frac
     (u_optional_gt : access GeneralizedTime_t;
      arg2 : System.Address;
      frac_value : int;
      frac_digits : int;
      force_gmt : int) return access GeneralizedTime_t;  -- ../../c/x509/GeneralizedTime.h:62
   pragma Import (C, asn_time2GT_frac, "asn_time2GT_frac");

end GeneralizedTime_h;
