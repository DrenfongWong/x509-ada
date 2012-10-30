with Interfaces.C; use Interfaces.C;
with UTCTime_h;
with GeneralizedTime_h;
with constr_TYPE_h;

package XTime_h is

   type XTime_PR is 
     (XTime_PR_NOTHING,
      XTime_PR_utcTime,
      XTime_PR_generalTime);
   pragma Convention (C, XTime_PR);  -- ../../c/x509/XTime.h:23

   type XTime_u (discr : unsigned := 0) is record
      case discr is
         when 0 =>
            utcTime : aliased UTCTime_h.UTCTime_t;  -- ../../c/x509/XTime.h:33
         when others =>
            generalTime : aliased GeneralizedTime_h.GeneralizedTime_t;  -- ../../c/x509/XTime.h:34
      end case;
   end record;
   pragma Convention (C_Pass_By_Copy, XTime_u);
   pragma Unchecked_Union (XTime_u);
   type XTime is record
      present : aliased XTime_PR;  -- ../../c/x509/XTime.h:31
      choice : XTime_u;  -- ../../c/x509/XTime.h:35
      u_asn_ctx : aliased constr_TYPE_h.asn_struct_ctx_t;  -- ../../c/x509/XTime.h:38
   end record;
   pragma Convention (C_Pass_By_Copy, XTime);  -- ../../c/x509/XTime.h:30

   subtype XTime_t is XTime;

   asn_DEF_XTime : aliased constr_TYPE_h.asn_TYPE_descriptor_t;  -- ../../c/x509/XTime.h:42
   pragma Import (C, asn_DEF_XTime, "asn_DEF_XTime");

end XTime_h;
