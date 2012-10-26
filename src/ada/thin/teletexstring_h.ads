with Interfaces.C; use Interfaces.C;
with OCTET_STRING_h;
with constr_TYPE_h;

package TeletexString_h is

   subtype TeletexString_t is OCTET_STRING_h.OCTET_STRING;

   asn_DEF_TeletexString : aliased constr_TYPE_h.asn_TYPE_descriptor_t;  -- ../../c/x509/TeletexString.h:16
   pragma Import (C, asn_DEF_TeletexString, "asn_DEF_TeletexString");

end TeletexString_h;
