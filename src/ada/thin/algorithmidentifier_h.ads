with Interfaces.C; use Interfaces.C;
with OBJECT_IDENTIFIER_h;
with ANY_h;
with constr_TYPE_h;

package AlgorithmIdentifier_h is

   type AlgorithmIdentifier is record
      algorithm : aliased OBJECT_IDENTIFIER_h.OBJECT_IDENTIFIER_t;  -- ../../c/x509/AlgorithmIdentifier.h:24
      parameters : access ANY_h.ANY_t;  -- ../../c/x509/AlgorithmIdentifier.h:25
      u_asn_ctx : aliased constr_TYPE_h.asn_struct_ctx_t;  -- ../../c/x509/AlgorithmIdentifier.h:28
   end record;
   pragma Convention (C_Pass_By_Copy, AlgorithmIdentifier);  -- ../../c/x509/AlgorithmIdentifier.h:23

   subtype AlgorithmIdentifier_t is AlgorithmIdentifier;

   asn_DEF_XAlgorithmIdentifier : aliased constr_TYPE_h.asn_TYPE_descriptor_t;  -- ../../c/x509/AlgorithmIdentifier.h:32
   pragma Import (C, asn_DEF_XAlgorithmIdentifier, "asn_DEF_AlgorithmIdentifier");

end AlgorithmIdentifier_h;
