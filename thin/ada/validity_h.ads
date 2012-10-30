with Interfaces.C; use Interfaces.C;
with XTime_h;
with constr_TYPE_h;

package Validity_h is

   type Validity is record
      notBefore : aliased XTime_h.XTime_t;  -- ../../c/x509/Validity.h:23
      notAfter : aliased XTime_h.XTime_t;  -- ../../c/x509/Validity.h:24
      u_asn_ctx : aliased constr_TYPE_h.asn_struct_ctx_t;  -- ../../c/x509/Validity.h:27
   end record;
   pragma Convention (C_Pass_By_Copy, Validity);  -- ../../c/x509/Validity.h:22

   subtype Validity_t is Validity;

   asn_DEF_Validity : aliased constr_TYPE_h.asn_TYPE_descriptor_t;  -- ../../c/x509/Validity.h:31
   pragma Import (C, asn_DEF_Validity, "asn_DEF_Validity");

end Validity_h;
