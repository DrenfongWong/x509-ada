with Interfaces.C; use Interfaces.C;
with System;
limited with Extension_h;
with constr_TYPE_h;

package Extensions_h is

   type Extensions;
   type anon_35 is record
      c_array : System.Address;  -- ../../c/x509/Extensions.h:26
      count : aliased int;  -- ../../c/x509/Extensions.h:26
      size : aliased int;  -- ../../c/x509/Extensions.h:26
      free : access procedure (arg1 : access Extension_h.Extension);  -- ../../c/x509/Extensions.h:26
   end record;
   pragma Convention (C_Pass_By_Copy, anon_35);
   type Extensions is record
      list : aliased anon_35;  -- ../../c/x509/Extensions.h:26
      u_asn_ctx : aliased constr_TYPE_h.asn_struct_ctx_t;  -- ../../c/x509/Extensions.h:29
   end record;
   pragma Convention (C_Pass_By_Copy, Extensions);  -- ../../c/x509/Extensions.h:25

   subtype Extensions_t is Extensions;

   asn_DEF_Extensions : aliased constr_TYPE_h.asn_TYPE_descriptor_t;  -- ../../c/x509/Extensions.h:33
   pragma Import (C, asn_DEF_Extensions, "asn_DEF_Extensions");

end Extensions_h;
