with Interfaces.C; use Interfaces.C;
with INTEGER_h;
with constr_TYPE_h;

package OtherPrimeInfo_h is

   type OtherPrimeInfo is record
      prime : aliased INTEGER_h.INTEGER_t;  -- ../../c/pkcs1/OtherPrimeInfo.h:23
      exponent : aliased INTEGER_h.INTEGER_t;  -- ../../c/pkcs1/OtherPrimeInfo.h:24
      coefficient : aliased INTEGER_h.INTEGER_t;  -- ../../c/pkcs1/OtherPrimeInfo.h:25
      u_asn_ctx : aliased constr_TYPE_h.asn_struct_ctx_t;  -- ../../c/pkcs1/OtherPrimeInfo.h:28
   end record;
   pragma Convention (C_Pass_By_Copy, OtherPrimeInfo);  -- ../../c/pkcs1/OtherPrimeInfo.h:22

   subtype OtherPrimeInfo_t is OtherPrimeInfo;

   asn_DEF_OtherPrimeInfo : aliased constr_TYPE_h.asn_TYPE_descriptor_t;  -- ../../c/pkcs1/OtherPrimeInfo.h:32
   pragma Import (C, asn_DEF_OtherPrimeInfo, "asn_DEF_OtherPrimeInfo");

end OtherPrimeInfo_h;
