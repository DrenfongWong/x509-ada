with Interfaces.C; use Interfaces.C;
with OCTET_STRING_h;
with constr_TYPE_h;
with System;
with stddef_h;
with Interfaces.C.Strings;
with xer_encoder_h;
with asn_codecs_h;
with time_h;

package UTCTime_h is

   subtype UTCTime_t is OCTET_STRING_h.OCTET_STRING;

   asn_DEF_UTCTime : aliased constr_TYPE_h.asn_TYPE_descriptor_t;  -- ../../c/x509/UTCTime.h:16
   pragma Import (C, asn_DEF_UTCTime, "asn_DEF_UTCTime");

   function UTCTime_print
     (arg1 : System.Address;
      arg2 : System.Address;
      arg3 : int;
      arg4 : access function
        (arg1 : System.Address;
         arg2 : stddef_h.size_t;
         arg3 : System.Address) return int;
      arg5 : System.Address) return int;  -- ../../c/x509/UTCTime.h:18
   pragma Import (C, UTCTime_print, "UTCTime_print");

   function UTCTime_constraint
     (arg1 : access constr_TYPE_h.asn_TYPE_descriptor_s;
      arg2 : System.Address;
      arg3 : access procedure
        (arg1 : System.Address;
         arg2 : access constr_TYPE_h.asn_TYPE_descriptor_s;
         arg3 : System.Address;
         arg4 : Interfaces.C.Strings.chars_ptr  -- , ...
         );
      arg4 : System.Address) return int;  -- ../../c/x509/UTCTime.h:19
   pragma Import (C, UTCTime_constraint, "UTCTime_constraint");

   function UTCTime_encode_xer
     (arg1 : access constr_TYPE_h.asn_TYPE_descriptor_s;
      arg2 : System.Address;
      arg3 : int;
      arg4 : xer_encoder_h.xer_encoder_flags_e;
      arg5 : access function
        (arg1 : System.Address;
         arg2 : stddef_h.size_t;
         arg3 : System.Address) return int;
      arg6 : System.Address) return asn_codecs_h.asn_enc_rval_t;  -- ../../c/x509/UTCTime.h:20
   pragma Import (C, UTCTime_encode_xer, "UTCTime_encode_xer");

   --  skipped empty struct tm

   function asn_UT2time
     (arg1 : System.Address;
      u_optional_tm4fill : System.Address;
      as_gmt : int) return time_h.time_t;  -- ../../c/x509/UTCTime.h:29
   pragma Import (C, asn_UT2time, "asn_UT2time");

   function asn_time2UT
     (uu_opt_ut : access UTCTime_t;
      arg2 : System.Address;
      force_gmt : int) return access UTCTime_t;  -- ../../c/x509/UTCTime.h:32
   pragma Import (C, asn_time2UT, "asn_time2UT");

end UTCTime_h;
