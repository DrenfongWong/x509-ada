with Interfaces.C; use Interfaces.C;
with OCTET_STRING_h;
with constr_TYPE_h;
with System;
with Interfaces.C.Strings;

package PrintableString_h is

   subtype PrintableString_t is OCTET_STRING_h.OCTET_STRING;

   asn_DEF_PrintableString : aliased constr_TYPE_h.asn_TYPE_descriptor_t;  -- ../../c/x509/PrintableString.h:16
   pragma Import (C, asn_DEF_PrintableString, "asn_DEF_PrintableString");

   function PrintableString_constraint
     (arg1 : access constr_TYPE_h.asn_TYPE_descriptor_s;
      arg2 : System.Address;
      arg3 : access procedure
        (arg1 : System.Address;
         arg2 : access constr_TYPE_h.asn_TYPE_descriptor_s;
         arg3 : System.Address;
         arg4 : Interfaces.C.Strings.chars_ptr  -- , ...
         );
      arg4 : System.Address) return int;  -- ../../c/x509/PrintableString.h:18
   pragma Import (C, PrintableString_constraint, "PrintableString_constraint");

end PrintableString_h;
