with Interfaces.C; use Interfaces.C;
with Version_h;
with INTEGER_h;
limited with OtherPrimeInfos_h;
with constr_TYPE_h;

package RSAPrivateKey_h is

   type RSAPrivateKey is record
      version : aliased Version_h.Version_t;  -- ../../c/pkcs1/RSAPrivateKey.h:27
      modulus : aliased INTEGER_h.INTEGER_t;  -- ../../c/pkcs1/RSAPrivateKey.h:28
      publicExponent : aliased INTEGER_h.INTEGER_t;  -- ../../c/pkcs1/RSAPrivateKey.h:29
      privateExponent : aliased INTEGER_h.INTEGER_t;  -- ../../c/pkcs1/RSAPrivateKey.h:30
      prime1 : aliased INTEGER_h.INTEGER_t;  -- ../../c/pkcs1/RSAPrivateKey.h:31
      prime2 : aliased INTEGER_h.INTEGER_t;  -- ../../c/pkcs1/RSAPrivateKey.h:32
      exponent1 : aliased INTEGER_h.INTEGER_t;  -- ../../c/pkcs1/RSAPrivateKey.h:33
      exponent2 : aliased INTEGER_h.INTEGER_t;  -- ../../c/pkcs1/RSAPrivateKey.h:34
      coefficient : aliased INTEGER_h.INTEGER_t;  -- ../../c/pkcs1/RSAPrivateKey.h:35
      the_otherPrimeInfos : access OtherPrimeInfos_h.OtherPrimeInfos;  -- ../../c/pkcs1/RSAPrivateKey.h:36
      u_asn_ctx : aliased constr_TYPE_h.asn_struct_ctx_t;  -- ../../c/pkcs1/RSAPrivateKey.h:39
   end record;
   pragma Convention (C_Pass_By_Copy, RSAPrivateKey);  -- ../../c/pkcs1/RSAPrivateKey.h:26

   subtype RSAPrivateKey_t is RSAPrivateKey;

   asn_DEF_RSAPrivateKey : aliased constr_TYPE_h.asn_TYPE_descriptor_t;  -- ../../c/pkcs1/RSAPrivateKey.h:43
   pragma Import (C, asn_DEF_RSAPrivateKey, "asn_DEF_RSAPrivateKey");

end RSAPrivateKey_h;
