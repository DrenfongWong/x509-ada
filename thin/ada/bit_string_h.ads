with Interfaces.C; use Interfaces.C;
with stdint_h;
with constr_TYPE_h;
with System;
with stddef_h;
with Interfaces.C.Strings;
with xer_encoder_h;
with asn_codecs_h;

package BIT_STRING_h is

   type BIT_STRING_s is record
      buf : access stdint_h.uint8_t;  -- ../../c/common/BIT_STRING.h:15
      size : aliased int;  -- ../../c/common/BIT_STRING.h:16
      bits_unused : aliased int;  -- ../../c/common/BIT_STRING.h:18
      u_asn_ctx : aliased constr_TYPE_h.asn_struct_ctx_t;  -- ../../c/common/BIT_STRING.h:20
   end record;
   pragma Convention (C_Pass_By_Copy, BIT_STRING_s);  -- ../../c/common/BIT_STRING.h:14

   subtype BIT_STRING_t is BIT_STRING_s;

   asn_DEF_BIT_STRING : aliased constr_TYPE_h.asn_TYPE_descriptor_t;  -- ../../c/common/BIT_STRING.h:23
   pragma Import (C, asn_DEF_BIT_STRING, "asn_DEF_BIT_STRING");

   function BIT_STRING_print
     (arg1 : System.Address;
      arg2 : System.Address;
      arg3 : int;
      arg4 : access function
        (arg1 : System.Address;
         arg2 : stddef_h.size_t;
         arg3 : System.Address) return int;
      arg5 : System.Address) return int;  -- ../../c/common/BIT_STRING.h:25
   pragma Import (C, BIT_STRING_print, "BIT_STRING_print");

   function BIT_STRING_constraint
     (arg1 : access constr_TYPE_h.asn_TYPE_descriptor_s;
      arg2 : System.Address;
      arg3 : access procedure
        (arg1 : System.Address;
         arg2 : access constr_TYPE_h.asn_TYPE_descriptor_s;
         arg3 : System.Address;
         arg4 : Interfaces.C.Strings.chars_ptr  -- , ...
         );
      arg4 : System.Address) return int;  -- ../../c/common/BIT_STRING.h:26
   pragma Import (C, BIT_STRING_constraint, "BIT_STRING_constraint");

   function BIT_STRING_encode_xer
     (arg1 : access constr_TYPE_h.asn_TYPE_descriptor_s;
      arg2 : System.Address;
      arg3 : int;
      arg4 : xer_encoder_h.xer_encoder_flags_e;
      arg5 : access function
        (arg1 : System.Address;
         arg2 : stddef_h.size_t;
         arg3 : System.Address) return int;
      arg6 : System.Address) return asn_codecs_h.asn_enc_rval_t;  -- ../../c/common/BIT_STRING.h:27
   pragma Import (C, BIT_STRING_encode_xer, "BIT_STRING_encode_xer");

end BIT_STRING_h;
