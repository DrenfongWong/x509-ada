with Interfaces.C; use Interfaces.C;
with AttributeType_h;
with AttributeValue_h;
with constr_TYPE_h;

package AttributeTypeAndValue_h is

   type AttributeTypeAndValue is record
      c_type : aliased AttributeType_h.AttributeType_t;  -- ../../c/x509/AttributeTypeAndValue.h:24
      value : aliased AttributeValue_h.AttributeValue_t;  -- ../../c/x509/AttributeTypeAndValue.h:25
      u_asn_ctx : aliased constr_TYPE_h.asn_struct_ctx_t;  -- ../../c/x509/AttributeTypeAndValue.h:28
   end record;
   pragma Convention (C_Pass_By_Copy, AttributeTypeAndValue);  -- ../../c/x509/AttributeTypeAndValue.h:23

   subtype AttributeTypeAndValue_t is AttributeTypeAndValue;

   asn_DEF_AttributeTypeAndValue : aliased constr_TYPE_h.asn_TYPE_descriptor_t;  -- ../../c/x509/AttributeTypeAndValue.h:32
   pragma Import (C, asn_DEF_AttributeTypeAndValue, "asn_DEF_AttributeTypeAndValue");

end AttributeTypeAndValue_h;
