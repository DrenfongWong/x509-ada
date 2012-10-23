with Interfaces.C; use Interfaces.C;
with XAlgorithmIdentifier_h;
with BIT_STRING_h;
with constr_TYPE_h;

package SubjectPublicKeyInfo_h is

   type SubjectPublicKeyInfo is record
      algorithm : aliased XAlgorithmIdentifier_h.XAlgorithmIdentifier_t;  -- ../../c/x509/SubjectPublicKeyInfo.h:24
      subjectPublicKey : aliased BIT_STRING_h.BIT_STRING_t;  -- ../../c/x509/SubjectPublicKeyInfo.h:25
      u_asn_ctx : aliased constr_TYPE_h.asn_struct_ctx_t;  -- ../../c/x509/SubjectPublicKeyInfo.h:28
   end record;
   pragma Convention (C_Pass_By_Copy, SubjectPublicKeyInfo);  -- ../../c/x509/SubjectPublicKeyInfo.h:23

   subtype SubjectPublicKeyInfo_t is SubjectPublicKeyInfo;

   asn_DEF_SubjectPublicKeyInfo : aliased constr_TYPE_h.asn_TYPE_descriptor_t;  -- ../../c/x509/SubjectPublicKeyInfo.h:32
   pragma Import (C, asn_DEF_SubjectPublicKeyInfo, "asn_DEF_SubjectPublicKeyInfo");

end SubjectPublicKeyInfo_h;
