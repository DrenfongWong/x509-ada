with Interfaces.C; use Interfaces.C;
with OCTET_STRING_h;
with constr_TYPE_h;
with System;
with stddef_h;
with Interfaces.C.Strings;
with stdio_h;
with stdint_h;

package UTF8String_h is

   subtype UTF8String_t is OCTET_STRING_h.OCTET_STRING;

   asn_DEF_UTF8String : aliased constr_TYPE_h.asn_TYPE_descriptor_t;  -- ../../c/x509/UTF8String.h:16
   pragma Import (C, asn_DEF_UTF8String, "asn_DEF_UTF8String");

   function UTF8String_print
     (arg1 : System.Address;
      arg2 : System.Address;
      arg3 : int;
      arg4 : access function
        (arg1 : System.Address;
         arg2 : stddef_h.size_t;
         arg3 : System.Address) return int;
      arg5 : System.Address) return int;  -- ../../c/x509/UTF8String.h:18
   pragma Import (C, UTF8String_print, "UTF8String_print");

   function UTF8String_constraint
     (arg1 : access constr_TYPE_h.asn_TYPE_descriptor_s;
      arg2 : System.Address;
      arg3 : access procedure
        (arg1 : System.Address;
         arg2 : access constr_TYPE_h.asn_TYPE_descriptor_s;
         arg3 : System.Address;
         arg4 : Interfaces.C.Strings.chars_ptr  -- , ...
         );
      arg4 : System.Address) return int;  -- ../../c/x509/UTF8String.h:19
   pragma Import (C, UTF8String_constraint, "UTF8String_constraint");

   function UTF8String_length (st : System.Address) return stdio_h.ssize_t;  -- ../../c/x509/UTF8String.h:30
   pragma Import (C, UTF8String_length, "UTF8String_length");

   function UTF8String_to_wcs
     (st : System.Address;
      dst : access stdint_h.uint32_t;
      dstlen : stddef_h.size_t) return stddef_h.size_t;  -- ../../c/x509/UTF8String.h:43
   pragma Import (C, UTF8String_to_wcs, "UTF8String_to_wcs");

end UTF8String_h;
