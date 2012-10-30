with Interfaces.C; use Interfaces.C;
with TBSCertificate_h;
with XAlgorithmIdentifier_h;
with BIT_STRING_h;
with constr_TYPE_h;

package Certificate_h is

   type Certificate is record
      tbsCertificate : aliased TBSCertificate_h.TBSCertificate_t;  -- ../../c/x509/Certificate.h:25
      signatureAlgorithm : aliased XAlgorithmIdentifier_h.XAlgorithmIdentifier_t;  -- ../../c/x509/Certificate.h:26
      signature : aliased BIT_STRING_h.BIT_STRING_t;  -- ../../c/x509/Certificate.h:27
      u_asn_ctx : aliased constr_TYPE_h.asn_struct_ctx_t;  -- ../../c/x509/Certificate.h:30
   end record;
   pragma Convention (C_Pass_By_Copy, Certificate);  -- ../../c/x509/Certificate.h:24

   subtype Certificate_t is Certificate;

   asn_DEF_Certificate : aliased constr_TYPE_h.asn_TYPE_descriptor_t;  -- ../../c/x509/Certificate.h:34
   pragma Import (C, asn_DEF_Certificate, "asn_DEF_Certificate");

end Certificate_h;
