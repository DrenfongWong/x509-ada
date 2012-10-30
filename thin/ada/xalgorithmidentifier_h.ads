with Interfaces.C; use Interfaces.C;
with OBJECT_IDENTIFIER_h;
with ANY_h;
with constr_TYPE_h;

package XAlgorithmIdentifier_h is

   type XAlgorithmIdentifier is record
      algorithm : aliased OBJECT_IDENTIFIER_h.OBJECT_IDENTIFIER_t;  -- ../../c/x509/XAlgorithmIdentifier.h:24
      parameters : access ANY_h.ANY_t;  -- ../../c/x509/XAlgorithmIdentifier.h:25
      u_asn_ctx : aliased constr_TYPE_h.asn_struct_ctx_t;  -- ../../c/x509/XAlgorithmIdentifier.h:28
   end record;
   pragma Convention (C_Pass_By_Copy, XAlgorithmIdentifier);  -- ../../c/x509/XAlgorithmIdentifier.h:23

   subtype XAlgorithmIdentifier_t is XAlgorithmIdentifier;

   asn_DEF_XAlgorithmIdentifier : aliased constr_TYPE_h.asn_TYPE_descriptor_t;  -- ../../c/x509/XAlgorithmIdentifier.h:32
   pragma Import (C, asn_DEF_XAlgorithmIdentifier, "asn_DEF_XAlgorithmIdentifier");

end XAlgorithmIdentifier_h;
