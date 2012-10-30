with Interfaces.C; use Interfaces.C;
with System;
limited with OtherPrimeInfo_h;
with constr_TYPE_h;

package OtherPrimeInfos_h is

   type OtherPrimeInfos;
   type anon_33 is record
      c_array : System.Address;  -- ../../c/pkcs1/OtherPrimeInfos.h:26
      count : aliased int;  -- ../../c/pkcs1/OtherPrimeInfos.h:26
      size : aliased int;  -- ../../c/pkcs1/OtherPrimeInfos.h:26
      free : access procedure (arg1 : access OtherPrimeInfo_h.OtherPrimeInfo);  -- ../../c/pkcs1/OtherPrimeInfos.h:26
   end record;
   pragma Convention (C_Pass_By_Copy, anon_33);
   type OtherPrimeInfos is record
      list : aliased anon_33;  -- ../../c/pkcs1/OtherPrimeInfos.h:26
      u_asn_ctx : aliased constr_TYPE_h.asn_struct_ctx_t;  -- ../../c/pkcs1/OtherPrimeInfos.h:29
   end record;
   pragma Convention (C_Pass_By_Copy, OtherPrimeInfos);  -- ../../c/pkcs1/OtherPrimeInfos.h:25

   subtype OtherPrimeInfos_t is OtherPrimeInfos;

   asn_DEF_OtherPrimeInfos : aliased constr_TYPE_h.asn_TYPE_descriptor_t;  -- ../../c/pkcs1/OtherPrimeInfos.h:33
   pragma Import (C, asn_DEF_OtherPrimeInfos, "asn_DEF_OtherPrimeInfos");

end OtherPrimeInfos_h;
