with Interfaces.C; use Interfaces.C;
with System;
limited with AttributeTypeAndValue_h;
with constr_TYPE_h;

package RelativeDistinguishedName_h is

   type RelativeDistinguishedName;
   type anon_34 is record
      c_array : System.Address;  -- ../../c/x509/RelativeDistinguishedName.h:26
      count : aliased int;  -- ../../c/x509/RelativeDistinguishedName.h:26
      size : aliased int;  -- ../../c/x509/RelativeDistinguishedName.h:26
      free : access procedure (arg1 : access AttributeTypeAndValue_h.AttributeTypeAndValue);  -- ../../c/x509/RelativeDistinguishedName.h:26
   end record;
   pragma Convention (C_Pass_By_Copy, anon_34);
   type RelativeDistinguishedName is record
      list : aliased anon_34;  -- ../../c/x509/RelativeDistinguishedName.h:26
      u_asn_ctx : aliased constr_TYPE_h.asn_struct_ctx_t;  -- ../../c/x509/RelativeDistinguishedName.h:29
   end record;
   pragma Convention (C_Pass_By_Copy, RelativeDistinguishedName);  -- ../../c/x509/RelativeDistinguishedName.h:25

   subtype RelativeDistinguishedName_t is RelativeDistinguishedName;

   asn_DEF_RelativeDistinguishedName : aliased constr_TYPE_h.asn_TYPE_descriptor_t;  -- ../../c/x509/RelativeDistinguishedName.h:33
   pragma Import (C, asn_DEF_RelativeDistinguishedName, "asn_DEF_RelativeDistinguishedName");

end RelativeDistinguishedName_h;
