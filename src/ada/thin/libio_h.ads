with Interfaces.C; use Interfaces.C;
with System;
with Interfaces.C.Strings;
with x86_64_linux_gnu_bits_types_h;
with stddef_h;

package libio_h is

   --  unsupported macro: EOF (-1)
   --  skipped empty struct u_IO_jump_t

   subtype u_IO_lock_t is System.Address;  -- /usr/include/libio.h:180

   type u_IO_FILE;
   type u_IO_marker is record
      u_next : access u_IO_marker;  -- /usr/include/libio.h:187
      u_sbuf : access u_IO_FILE;  -- /usr/include/libio.h:188
      u_pos : aliased int;  -- /usr/include/libio.h:192
   end record;
   pragma Convention (C_Pass_By_Copy, u_IO_marker);  -- /usr/include/libio.h:186

   type uu_codecvt_result is
     (uu_codecvt_ok,
      uu_codecvt_partial,
      uu_codecvt_error,
      uu_codecvt_noconv);
   pragma Convention (C, uu_codecvt_result);  -- /usr/include/libio.h:206

   type u_IO_FILE is record
      u_flags : aliased int;  -- /usr/include/libio.h:272
      u_IO_read_ptr : Interfaces.C.Strings.chars_ptr;  -- /usr/include/libio.h:277
      u_IO_read_end : Interfaces.C.Strings.chars_ptr;  -- /usr/include/libio.h:278
      u_IO_read_base : Interfaces.C.Strings.chars_ptr;  -- /usr/include/libio.h:279
      u_IO_write_base : Interfaces.C.Strings.chars_ptr;  -- /usr/include/libio.h:280
      u_IO_write_ptr : Interfaces.C.Strings.chars_ptr;  -- /usr/include/libio.h:281
      u_IO_write_end : Interfaces.C.Strings.chars_ptr;  -- /usr/include/libio.h:282
      u_IO_buf_base : Interfaces.C.Strings.chars_ptr;  -- /usr/include/libio.h:283
      u_IO_buf_end : Interfaces.C.Strings.chars_ptr;  -- /usr/include/libio.h:284
      u_IO_save_base : Interfaces.C.Strings.chars_ptr;  -- /usr/include/libio.h:286
      u_IO_backup_base : Interfaces.C.Strings.chars_ptr;  -- /usr/include/libio.h:287
      u_IO_save_end : Interfaces.C.Strings.chars_ptr;  -- /usr/include/libio.h:288
      u_markers : access u_IO_marker;  -- /usr/include/libio.h:290
      u_chain : access u_IO_FILE;  -- /usr/include/libio.h:292
      u_fileno : aliased int;  -- /usr/include/libio.h:294
      u_flags2 : aliased int;  -- /usr/include/libio.h:298
      u_old_offset : aliased x86_64_linux_gnu_bits_types_h.uu_off_t;  -- /usr/include/libio.h:300
      u_cur_column : aliased unsigned_short;  -- /usr/include/libio.h:304
      u_vtable_offset : aliased signed_char;  -- /usr/include/libio.h:305
      u_shortbuf : aliased Interfaces.C.char_array (1 .. 1);  -- /usr/include/libio.h:306
      u_lock : System.Address;  -- /usr/include/libio.h:310
      u_offset : aliased x86_64_linux_gnu_bits_types_h.uu_off64_t;  -- /usr/include/libio.h:319
      uu_pad1 : System.Address;  -- /usr/include/libio.h:328
      uu_pad2 : System.Address;  -- /usr/include/libio.h:329
      uu_pad3 : System.Address;  -- /usr/include/libio.h:330
      uu_pad4 : System.Address;  -- /usr/include/libio.h:331
      uu_pad5 : aliased stddef_h.size_t;  -- /usr/include/libio.h:332
      u_mode : aliased int;  -- /usr/include/libio.h:334
      u_unused2 : aliased Interfaces.C.char_array (1 .. 1);  -- /usr/include/libio.h:336
   end record;
   pragma Convention (C_Pass_By_Copy, u_IO_FILE);  -- /usr/include/libio.h:271

   --  skipped empty struct u_IO_FILE_plus

   --  skipped function type uu_io_read_fn

   --  skipped function type uu_io_write_fn

   --  skipped function type uu_io_seek_fn

   --  skipped function type uu_io_close_fn

   --  skipped function type cookie_read_function_t

   --  skipped function type cookie_write_function_t

   --  skipped function type cookie_seek_function_t

   --  skipped function type cookie_close_function_t

   type u_IO_cookie_io_functions_t is record
      read : access function
           (arg1 : System.Address;
            arg2 : Interfaces.C.Strings.chars_ptr;
            arg3 : stddef_h.size_t) return x86_64_linux_gnu_bits_types_h.uu_ssize_t;  -- /usr/include/libio.h:397
      write : access function
           (arg1 : System.Address;
            arg2 : Interfaces.C.Strings.chars_ptr;
            arg3 : stddef_h.size_t) return x86_64_linux_gnu_bits_types_h.uu_ssize_t;  -- /usr/include/libio.h:398
      seek : access function
           (arg1 : System.Address;
            arg2 : access x86_64_linux_gnu_bits_types_h.uu_off64_t;
            arg3 : int) return int;  -- /usr/include/libio.h:399
      close : access function (arg1 : System.Address) return int;  -- /usr/include/libio.h:400
   end record;
   pragma Convention (C_Pass_By_Copy, u_IO_cookie_io_functions_t);  -- /usr/include/libio.h:401

   --  skipped anonymous struct anon_5

   subtype cookie_io_functions_t is u_IO_cookie_io_functions_t;

   --  skipped empty struct u_IO_cookie_file

   --  skipped func _IO_cookie_init

   --  skipped func _IO_getc

   --  skipped func _IO_putc

   --  skipped func _IO_feof

   --  skipped func _IO_ferror

   --  skipped func _IO_peekc_locked

   --  skipped func _IO_flockfile

   --  skipped func _IO_funlockfile

   --  skipped func _IO_ftrylockfile

   --  skipped func _IO_vfscanf

   --  skipped func _IO_vfprintf

   --  skipped func _IO_padn

   --  skipped func _IO_sgetn

   --  skipped func _IO_seekoff

   --  skipped func _IO_seekpos

   --  skipped func _IO_free_backup_area

end libio_h;
