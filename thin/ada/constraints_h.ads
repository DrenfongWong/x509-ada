with Interfaces.C; use Interfaces.C;
with constr_TYPE_h;
with System;
with Interfaces.C.Strings;
with stddef_h;

package constraints_h is

   function asn_check_constraints
     (type_descriptor : access constr_TYPE_h.asn_TYPE_descriptor_s;
      struct_ptr : System.Address;
      errbuf : Interfaces.C.Strings.chars_ptr;
      errlen : access stddef_h.size_t) return int;  -- ../../c/common/constraints.h:29
   pragma Import (C, asn_check_constraints, "asn_check_constraints");

   --  skipped function type asn_constr_check_f

   function asn_generic_no_constraint
     (arg1 : access constr_TYPE_h.asn_TYPE_descriptor_s;
      arg2 : System.Address;
      arg3 : access procedure
        (arg1 : System.Address;
         arg2 : access constr_TYPE_h.asn_TYPE_descriptor_s;
         arg3 : System.Address;
         arg4 : Interfaces.C.Strings.chars_ptr  -- , ...
         );
      arg4 : System.Address) return int;  -- ../../c/common/constraints.h:51
   pragma Import (C, asn_generic_no_constraint, "asn_generic_no_constraint");

   function asn_generic_unknown_constraint
     (arg1 : access constr_TYPE_h.asn_TYPE_descriptor_s;
      arg2 : System.Address;
      arg3 : access procedure
        (arg1 : System.Address;
         arg2 : access constr_TYPE_h.asn_TYPE_descriptor_s;
         arg3 : System.Address;
         arg4 : Interfaces.C.Strings.chars_ptr  -- , ...
         );
      arg4 : System.Address) return int;  -- ../../c/common/constraints.h:52
   pragma Import (C, asn_generic_unknown_constraint, "asn_generic_unknown_constraint");

end constraints_h;
