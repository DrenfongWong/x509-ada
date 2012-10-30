with Interfaces.C; use Interfaces.C;
with stdint_h;
with stddef_h;
with System;
with x86_64_linux_gnu_sys_types_h;
with stdio_h;
with Interfaces.C.Strings;

package per_support_h is

   subtype asn_per_constraint_flags is unsigned;
   APC_UNCONSTRAINED : constant asn_per_constraint_flags := 0;
   APC_SEMI_CONSTRAINED : constant asn_per_constraint_flags := 1;
   APC_CONSTRAINED : constant asn_per_constraint_flags := 2;
   APC_EXTENSIBLE : constant asn_per_constraint_flags := 4;  -- ../../c/common/per_support.h:15

   type asn_per_constraint_s is record
      flags : aliased asn_per_constraint_flags;  -- ../../c/common/per_support.h:26
      range_bits : aliased int;  -- ../../c/common/per_support.h:27
      effective_bits : aliased int;  -- ../../c/common/per_support.h:28
      lower_bound : aliased long;  -- ../../c/common/per_support.h:29
      upper_bound : aliased long;  -- ../../c/common/per_support.h:30
   end record;
   pragma Convention (C_Pass_By_Copy, asn_per_constraint_s);  -- ../../c/common/per_support.h:25

   subtype asn_per_constraint_t is asn_per_constraint_s;

   type asn_per_constraints_s is record
      value : aliased asn_per_constraint_t;  -- ../../c/common/per_support.h:33
      size : aliased asn_per_constraint_t;  -- ../../c/common/per_support.h:34
      value2code : access function (arg1 : unsigned) return int;  -- ../../c/common/per_support.h:35
      code2value : access function (arg1 : unsigned) return int;  -- ../../c/common/per_support.h:36
   end record;
   pragma Convention (C_Pass_By_Copy, asn_per_constraints_s);  -- ../../c/common/per_support.h:32

   subtype asn_per_constraints_t is asn_per_constraints_s;

   type asn_per_data_s is record
      buffer : access stdint_h.uint8_t;  -- ../../c/common/per_support.h:43
      nboff : aliased stddef_h.size_t;  -- ../../c/common/per_support.h:44
      nbits : aliased stddef_h.size_t;  -- ../../c/common/per_support.h:45
      moved : aliased stddef_h.size_t;  -- ../../c/common/per_support.h:46
      refill : access function (arg1 : access asn_per_data_s) return int;  -- ../../c/common/per_support.h:47
      refill_key : System.Address;  -- ../../c/common/per_support.h:48
   end record;
   pragma Convention (C_Pass_By_Copy, asn_per_data_s);  -- ../../c/common/per_support.h:42

   subtype asn_per_data_t is asn_per_data_s;

   function per_get_few_bits (per_data : access asn_per_data_t; get_nbits : int) return x86_64_linux_gnu_sys_types_h.int32_t;  -- ../../c/common/per_support.h:56
   pragma Import (C, per_get_few_bits, "per_get_few_bits");

   procedure per_get_undo (per_data : access asn_per_data_t; get_nbits : int);  -- ../../c/common/per_support.h:59
   pragma Import (C, per_get_undo, "per_get_undo");

   function per_get_many_bits
     (pd : access asn_per_data_t;
      dst : access stdint_h.uint8_t;
      right_align : int;
      get_nbits : int) return int;  -- ../../c/common/per_support.h:66
   pragma Import (C, per_get_many_bits, "per_get_many_bits");

   function uper_get_length
     (pd : access asn_per_data_t;
      effective_bound_bits : int;
      repeat : access int) return stdio_h.ssize_t;  -- ../../c/common/per_support.h:72
   pragma Import (C, uper_get_length, "uper_get_length");

   function uper_get_nslength (pd : access asn_per_data_t) return stdio_h.ssize_t;  -- ../../c/common/per_support.h:79
   pragma Import (C, uper_get_nslength, "uper_get_nslength");

   function uper_get_nsnnwn (pd : access asn_per_data_t) return stdio_h.ssize_t;  -- ../../c/common/per_support.h:84
   pragma Import (C, uper_get_nsnnwn, "uper_get_nsnnwn");

   function per_data_string (pd : access asn_per_data_t) return Interfaces.C.Strings.chars_ptr;  -- ../../c/common/per_support.h:87
   pragma Import (C, per_data_string, "per_data_string");

   type asn_per_outp_s_tmpspace_array is array (0 .. 31) of aliased stdint_h.uint8_t;
   type asn_per_outp_s is record
      buffer : access stdint_h.uint8_t;  -- ../../c/common/per_support.h:93
      nboff : aliased stddef_h.size_t;  -- ../../c/common/per_support.h:94
      nbits : aliased stddef_h.size_t;  -- ../../c/common/per_support.h:95
      tmpspace : aliased asn_per_outp_s_tmpspace_array;  -- ../../c/common/per_support.h:96
      outper : access function
           (arg1 : System.Address;
            arg2 : stddef_h.size_t;
            arg3 : System.Address) return int;  -- ../../c/common/per_support.h:97
      op_key : System.Address;  -- ../../c/common/per_support.h:98
      flushed_bytes : aliased stddef_h.size_t;  -- ../../c/common/per_support.h:99
   end record;
   pragma Convention (C_Pass_By_Copy, asn_per_outp_s);  -- ../../c/common/per_support.h:92

   subtype asn_per_outp_t is asn_per_outp_s;

   function per_put_few_bits
     (per_data : access asn_per_outp_t;
      bits : stdint_h.uint32_t;
      obits : int) return int;  -- ../../c/common/per_support.h:103
   pragma Import (C, per_put_few_bits, "per_put_few_bits");

   function per_put_many_bits
     (po : access asn_per_outp_t;
      src : access stdint_h.uint8_t;
      put_nbits : int) return int;  -- ../../c/common/per_support.h:106
   pragma Import (C, per_put_many_bits, "per_put_many_bits");

   function uper_put_length (po : access asn_per_outp_t; whole_length : stddef_h.size_t) return stdio_h.ssize_t;  -- ../../c/common/per_support.h:113
   pragma Import (C, uper_put_length, "uper_put_length");

   function uper_put_nslength (po : access asn_per_outp_t; length : stddef_h.size_t) return int;  -- ../../c/common/per_support.h:119
   pragma Import (C, uper_put_nslength, "uper_put_nslength");

   function uper_put_nsnnwn (po : access asn_per_outp_t; n : int) return int;  -- ../../c/common/per_support.h:124
   pragma Import (C, uper_put_nsnnwn, "uper_put_nsnnwn");

end per_support_h;
