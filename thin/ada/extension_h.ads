with Interfaces.C; use Interfaces.C;
with OBJECT_IDENTIFIER_h;
with BOOLEAN_h;
with OCTET_STRING_h;
with constr_TYPE_h;

package Extension_h is

   type Extension is record
      extnID : aliased OBJECT_IDENTIFIER_h.OBJECT_IDENTIFIER_t;  -- ../../c/x509/Extension.h:25
      critical : access BOOLEAN_h.BOOLEAN_t;  -- ../../c/x509/Extension.h:26
      extnValue : aliased OCTET_STRING_h.OCTET_STRING_t;  -- ../../c/x509/Extension.h:27
      u_asn_ctx : aliased constr_TYPE_h.asn_struct_ctx_t;  -- ../../c/x509/Extension.h:30
   end record;
   pragma Convention (C_Pass_By_Copy, Extension);  -- ../../c/x509/Extension.h:24

   subtype Extension_t is Extension;

   asn_DEF_Extension : aliased constr_TYPE_h.asn_TYPE_descriptor_t;  -- ../../c/x509/Extension.h:34
   pragma Import (C, asn_DEF_Extension, "asn_DEF_Extension");

end Extension_h;
