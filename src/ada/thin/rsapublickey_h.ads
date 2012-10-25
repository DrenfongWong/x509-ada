with Interfaces.C; use Interfaces.C;
with INTEGER_h;
with constr_TYPE_h;

package RSAPublicKey_h is

   type RSAPublicKey is record
      modulus : aliased INTEGER_h.INTEGER_t;  -- ../../c/pkcs1/RSAPublicKey.h:23
      publicExponent : aliased INTEGER_h.INTEGER_t;  -- ../../c/pkcs1/RSAPublicKey.h:24
      u_asn_ctx : aliased constr_TYPE_h.asn_struct_ctx_t;  -- ../../c/pkcs1/RSAPublicKey.h:27
   end record;
   pragma Convention (C_Pass_By_Copy, RSAPublicKey);  -- ../../c/pkcs1/RSAPublicKey.h:22

   subtype RSAPublicKey_t is RSAPublicKey;

   asn_DEF_RSAPublicKey : aliased constr_TYPE_h.asn_TYPE_descriptor_t;  -- ../../c/pkcs1/RSAPublicKey.h:31
   pragma Import (C, asn_DEF_RSAPublicKey, "asn_DEF_RSAPublicKey");

end RSAPublicKey_h;
