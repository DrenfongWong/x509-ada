with Interfaces.C; use Interfaces.C;
with XVersion_h;
with CertificateSerialNumber_h;
with XAlgorithmIdentifier_h;
with Name_h;
with Validity_h;
with SubjectPublicKeyInfo_h;
with UniqueIdentifier_h;
limited with Extensions_h;
with constr_TYPE_h;

package TBSCertificate_h is

   type TBSCertificate is record
      version : access XVersion_h.XVersion_t;  -- ../../c/x509/TBSCertificate.h:32
      serialNumber : aliased CertificateSerialNumber_h.CertificateSerialNumber_t;  -- ../../c/x509/TBSCertificate.h:33
      signature : aliased XAlgorithmIdentifier_h.XAlgorithmIdentifier_t;  -- ../../c/x509/TBSCertificate.h:34
      issuer : aliased Name_h.Name_t;  -- ../../c/x509/TBSCertificate.h:35
      validity : aliased Validity_h.Validity_t;  -- ../../c/x509/TBSCertificate.h:36
      subject : aliased Name_h.Name_t;  -- ../../c/x509/TBSCertificate.h:37
      subjectPublicKeyInfo : aliased SubjectPublicKeyInfo_h.SubjectPublicKeyInfo_t;  -- ../../c/x509/TBSCertificate.h:38
      issuerUniqueID : access UniqueIdentifier_h.UniqueIdentifier_t;  -- ../../c/x509/TBSCertificate.h:39
      subjectUniqueID : access UniqueIdentifier_h.UniqueIdentifier_t;  -- ../../c/x509/TBSCertificate.h:40
      the_extensions : access Extensions_h.Extensions;  -- ../../c/x509/TBSCertificate.h:41
      u_asn_ctx : aliased constr_TYPE_h.asn_struct_ctx_t;  -- ../../c/x509/TBSCertificate.h:44
   end record;
   pragma Convention (C_Pass_By_Copy, TBSCertificate);  -- ../../c/x509/TBSCertificate.h:31

   subtype TBSCertificate_t is TBSCertificate;

   asn_DEF_TBSCertificate : aliased constr_TYPE_h.asn_TYPE_descriptor_t;  -- ../../c/x509/TBSCertificate.h:48
   pragma Import (C, asn_DEF_TBSCertificate, "asn_DEF_TBSCertificate");

end TBSCertificate_h;
