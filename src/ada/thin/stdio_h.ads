with Interfaces.C; use Interfaces.C;
with libio_h;
with stdarg_h;
with x86_64_linux_gnu_bits_types_h;
with uG_config_h;
with Interfaces.C.Strings;
with System;
with stddef_h;

package stdio_h is

   --  unsupported macro: BUFSIZ _IO_BUFSIZ
   --  unsupported macro: SEEK_SET 0
   --  unsupported macro: SEEK_CUR 1
   --  unsupported macro: SEEK_END 2
   --  unsupported macro: P_tmpdir "/tmp"
   --  unsupported macro: stdin stdin
   --  unsupported macro: stdout stdout
   --  unsupported macro: stderr stderr
   --  arg-macro: procedure getc (_fp)
   --    _IO_getc (_fp)
   --  arg-macro: procedure putc (_ch, _fp)
   --    _IO_putc (_ch, _fp)
   subtype FILE is libio_h.u_IO_FILE;

   subtype uu_FILE is libio_h.u_IO_FILE;

   subtype va_list is stdarg_h.uu_gnuc_va_list;  -- /usr/include/stdio.h:80

   subtype off_t is x86_64_linux_gnu_bits_types_h.uu_off_t;  -- /usr/include/stdio.h:91

   subtype off64_t is x86_64_linux_gnu_bits_types_h.uu_off64_t;  -- /usr/include/stdio.h:98

   subtype ssize_t is x86_64_linux_gnu_bits_types_h.uu_ssize_t;  -- /usr/include/stdio.h:103

   subtype fpos_t is uG_config_h.u_G_fpos_t;

   subtype fpos64_t is uG_config_h.u_G_fpos64_t;

   stdin : access libio_h.u_IO_FILE;  -- /usr/include/stdio.h:165
   pragma Import (C, stdin, "stdin");

   stdout : access libio_h.u_IO_FILE;  -- /usr/include/stdio.h:166
   pragma Import (C, stdout, "stdout");

   stderr : access libio_h.u_IO_FILE;  -- /usr/include/stdio.h:167
   pragma Import (C, stderr, "stderr");

   function remove (uu_filename : Interfaces.C.Strings.chars_ptr) return int;  -- /usr/include/stdio.h:175
   pragma Import (C, remove, "remove");

   function rename (uu_old : Interfaces.C.Strings.chars_ptr; uu_new : Interfaces.C.Strings.chars_ptr) return int;  -- /usr/include/stdio.h:177
   pragma Import (C, rename, "rename");

   function renameat
     (uu_oldfd : int;
      uu_old : Interfaces.C.Strings.chars_ptr;
      uu_newfd : int;
      uu_new : Interfaces.C.Strings.chars_ptr) return int;  -- /usr/include/stdio.h:182
   pragma Import (C, renameat, "renameat");

   function tmpfile return access FILE;  -- /usr/include/stdio.h:192
   pragma Import (C, tmpfile, "tmpfile");

   function tmpfile64 return access FILE;  -- /usr/include/stdio.h:202
   pragma Import (C, tmpfile64, "tmpfile64");

   function tmpnam (uu_s : Interfaces.C.Strings.chars_ptr) return Interfaces.C.Strings.chars_ptr;  -- /usr/include/stdio.h:206
   pragma Import (C, tmpnam, "tmpnam");

   function tmpnam_r (uu_s : Interfaces.C.Strings.chars_ptr) return Interfaces.C.Strings.chars_ptr;  -- /usr/include/stdio.h:212
   pragma Import (C, tmpnam_r, "tmpnam_r");

   function tempnam (uu_dir : Interfaces.C.Strings.chars_ptr; uu_pfx : Interfaces.C.Strings.chars_ptr) return Interfaces.C.Strings.chars_ptr;  -- /usr/include/stdio.h:224
   pragma Import (C, tempnam, "tempnam");

   function fclose (uu_stream : access FILE) return int;  -- /usr/include/stdio.h:234
   pragma Import (C, fclose, "fclose");

   function fflush (uu_stream : access FILE) return int;  -- /usr/include/stdio.h:239
   pragma Import (C, fflush, "fflush");

   function fflush_unlocked (uu_stream : access FILE) return int;  -- /usr/include/stdio.h:249
   pragma Import (C, fflush_unlocked, "fflush_unlocked");

   function fcloseall return int;  -- /usr/include/stdio.h:259
   pragma Import (C, fcloseall, "fcloseall");

   function fopen (uu_filename : Interfaces.C.Strings.chars_ptr; uu_modes : Interfaces.C.Strings.chars_ptr) return access FILE;  -- /usr/include/stdio.h:269
   pragma Import (C, fopen, "fopen");

   function freopen
     (uu_filename : Interfaces.C.Strings.chars_ptr;
      uu_modes : Interfaces.C.Strings.chars_ptr;
      uu_stream : access FILE) return access FILE;  -- /usr/include/stdio.h:275
   pragma Import (C, freopen, "freopen");

   function fopen64 (uu_filename : Interfaces.C.Strings.chars_ptr; uu_modes : Interfaces.C.Strings.chars_ptr) return access FILE;  -- /usr/include/stdio.h:294
   pragma Import (C, fopen64, "fopen64");

   function freopen64
     (uu_filename : Interfaces.C.Strings.chars_ptr;
      uu_modes : Interfaces.C.Strings.chars_ptr;
      uu_stream : access FILE) return access FILE;  -- /usr/include/stdio.h:296
   pragma Import (C, freopen64, "freopen64");

   function fdopen (uu_fd : int; uu_modes : Interfaces.C.Strings.chars_ptr) return access FILE;  -- /usr/include/stdio.h:303
   pragma Import (C, fdopen, "fdopen");

   function fopencookie
     (uu_magic_cookie : System.Address;
      uu_modes : Interfaces.C.Strings.chars_ptr;
      uu_io_funcs : libio_h.u_IO_cookie_io_functions_t) return access FILE;  -- /usr/include/stdio.h:309
   pragma Import (C, fopencookie, "fopencookie");

   function fmemopen
     (uu_s : System.Address;
      uu_len : stddef_h.size_t;
      uu_modes : Interfaces.C.Strings.chars_ptr) return access FILE;  -- /usr/include/stdio.h:316
   pragma Import (C, fmemopen, "fmemopen");

   function open_memstream (uu_bufloc : System.Address; uu_sizeloc : access stddef_h.size_t) return access FILE;  -- /usr/include/stdio.h:322
   pragma Import (C, open_memstream, "open_memstream");

   procedure setbuf (uu_stream : access FILE; uu_buf : Interfaces.C.Strings.chars_ptr);  -- /usr/include/stdio.h:329
   pragma Import (C, setbuf, "setbuf");

   function setvbuf
     (uu_stream : access FILE;
      uu_buf : Interfaces.C.Strings.chars_ptr;
      uu_modes : int;
      uu_n : stddef_h.size_t) return int;  -- /usr/include/stdio.h:333
   pragma Import (C, setvbuf, "setvbuf");

   procedure setbuffer
     (uu_stream : access FILE;
      uu_buf : Interfaces.C.Strings.chars_ptr;
      uu_size : stddef_h.size_t);  -- /usr/include/stdio.h:340
   pragma Import (C, setbuffer, "setbuffer");

   procedure setlinebuf (uu_stream : access FILE);  -- /usr/include/stdio.h:344
   pragma Import (C, setlinebuf, "setlinebuf");

   function fprintf (uu_stream : access FILE; uu_format : Interfaces.C.Strings.chars_ptr  -- , ...
      ) return int;  -- /usr/include/stdio.h:353
   pragma Import (C, fprintf, "fprintf");

   function printf (uu_format : Interfaces.C.Strings.chars_ptr  -- , ...
      ) return int;  -- /usr/include/stdio.h:359
   pragma Import (C, printf, "printf");

   function sprintf (uu_s : Interfaces.C.Strings.chars_ptr; uu_format : Interfaces.C.Strings.chars_ptr  -- , ...
      ) return int;  -- /usr/include/stdio.h:361
   pragma Import (C, sprintf, "sprintf");

   function vfprintf
     (uu_s : access FILE;
      uu_format : Interfaces.C.Strings.chars_ptr;
      uu_arg : access System.Address) return int;  -- /usr/include/stdio.h:368
   pragma Import (C, vfprintf, "vfprintf");

   function vprintf (uu_format : Interfaces.C.Strings.chars_ptr; uu_arg : access System.Address) return int;  -- /usr/include/stdio.h:374
   pragma Import (C, vprintf, "vprintf");

   function vsprintf
     (uu_s : Interfaces.C.Strings.chars_ptr;
      uu_format : Interfaces.C.Strings.chars_ptr;
      uu_arg : access System.Address) return int;  -- /usr/include/stdio.h:376
   pragma Import (C, vsprintf, "vsprintf");

   function snprintf
     (uu_s : Interfaces.C.Strings.chars_ptr;
      uu_maxlen : stddef_h.size_t;
      uu_format : Interfaces.C.Strings.chars_ptr  -- , ...
      ) return int;  -- /usr/include/stdio.h:383
   pragma Import (C, snprintf, "snprintf");

   function vsnprintf
     (uu_s : Interfaces.C.Strings.chars_ptr;
      uu_maxlen : stddef_h.size_t;
      uu_format : Interfaces.C.Strings.chars_ptr;
      uu_arg : access System.Address) return int;  -- /usr/include/stdio.h:387
   pragma Import (C, vsnprintf, "vsnprintf");

   function vasprintf
     (uu_ptr : System.Address;
      uu_f : Interfaces.C.Strings.chars_ptr;
      uu_arg : access System.Address) return int;  -- /usr/include/stdio.h:396
   pragma Import (C, vasprintf, "vasprintf");

   function asprintf (uu_ptr : System.Address; uu_fmt : Interfaces.C.Strings.chars_ptr  -- , ...
      ) return int;  -- /usr/include/stdio.h:402
   pragma Import (C, asprintf, "asprintf");

   function vdprintf
     (uu_fd : int;
      uu_fmt : Interfaces.C.Strings.chars_ptr;
      uu_arg : access System.Address) return int;  -- /usr/include/stdio.h:414
   pragma Import (C, vdprintf, "vdprintf");

   function dprintf (uu_fd : int; uu_fmt : Interfaces.C.Strings.chars_ptr  -- , ...
      ) return int;  -- /usr/include/stdio.h:417
   pragma Import (C, dprintf, "dprintf");

   function fscanf (uu_stream : access FILE; uu_format : Interfaces.C.Strings.chars_ptr  -- , ...
      ) return int;  -- /usr/include/stdio.h:427
   pragma Import (C, fscanf, "fscanf");

   function scanf (uu_format : Interfaces.C.Strings.chars_ptr  -- , ...
      ) return int;  -- /usr/include/stdio.h:433
   pragma Import (C, scanf, "scanf");

   function sscanf (uu_s : Interfaces.C.Strings.chars_ptr; uu_format : Interfaces.C.Strings.chars_ptr  -- , ...
      ) return int;  -- /usr/include/stdio.h:435
   pragma Import (C, sscanf, "sscanf");

   function vfscanf
     (uu_s : access FILE;
      uu_format : Interfaces.C.Strings.chars_ptr;
      uu_arg : access System.Address) return int;  -- /usr/include/stdio.h:473
   pragma Import (C, vfscanf, "vfscanf");

   function vscanf (uu_format : Interfaces.C.Strings.chars_ptr; uu_arg : access System.Address) return int;  -- /usr/include/stdio.h:481
   pragma Import (C, vscanf, "vscanf");

   function vsscanf
     (uu_s : Interfaces.C.Strings.chars_ptr;
      uu_format : Interfaces.C.Strings.chars_ptr;
      uu_arg : access System.Address) return int;  -- /usr/include/stdio.h:485
   pragma Import (C, vsscanf, "vsscanf");

   function fgetc (uu_stream : access FILE) return int;  -- /usr/include/stdio.h:533
   pragma Import (C, fgetc, "fgetc");

   function getc (uu_stream : access FILE) return int;  -- /usr/include/stdio.h:534
   pragma Import (C, getc, "getc");

   function getchar return int;  -- /usr/include/stdio.h:540
   pragma Import (C, getchar, "getchar");

   function getc_unlocked (uu_stream : access FILE) return int;  -- /usr/include/stdio.h:552
   pragma Import (C, getc_unlocked, "getc_unlocked");

   function getchar_unlocked return int;  -- /usr/include/stdio.h:553
   pragma Import (C, getchar_unlocked, "getchar_unlocked");

   function fgetc_unlocked (uu_stream : access FILE) return int;  -- /usr/include/stdio.h:563
   pragma Import (C, fgetc_unlocked, "fgetc_unlocked");

   function fputc (uu_c : int; uu_stream : access FILE) return int;  -- /usr/include/stdio.h:575
   pragma Import (C, fputc, "fputc");

   function putc (uu_c : int; uu_stream : access FILE) return int;  -- /usr/include/stdio.h:576
   pragma Import (C, putc, "putc");

   function putchar (uu_c : int) return int;  -- /usr/include/stdio.h:582
   pragma Import (C, putchar, "putchar");

   function fputc_unlocked (uu_c : int; uu_stream : access FILE) return int;  -- /usr/include/stdio.h:596
   pragma Import (C, fputc_unlocked, "fputc_unlocked");

   function putc_unlocked (uu_c : int; uu_stream : access FILE) return int;  -- /usr/include/stdio.h:604
   pragma Import (C, putc_unlocked, "putc_unlocked");

   function putchar_unlocked (uu_c : int) return int;  -- /usr/include/stdio.h:605
   pragma Import (C, putchar_unlocked, "putchar_unlocked");

   function getw (uu_stream : access FILE) return int;  -- /usr/include/stdio.h:612
   pragma Import (C, getw, "getw");

   function putw (uu_w : int; uu_stream : access FILE) return int;  -- /usr/include/stdio.h:615
   pragma Import (C, putw, "putw");

   function fgets
     (uu_s : Interfaces.C.Strings.chars_ptr;
      uu_n : int;
      uu_stream : access FILE) return Interfaces.C.Strings.chars_ptr;  -- /usr/include/stdio.h:624
   pragma Import (C, fgets, "fgets");

   function gets (uu_s : Interfaces.C.Strings.chars_ptr) return Interfaces.C.Strings.chars_ptr;  -- /usr/include/stdio.h:632
   pragma Import (C, gets, "gets");

   function fgets_unlocked
     (uu_s : Interfaces.C.Strings.chars_ptr;
      uu_n : int;
      uu_stream : access FILE) return Interfaces.C.Strings.chars_ptr;  -- /usr/include/stdio.h:642
   pragma Import (C, fgets_unlocked, "fgets_unlocked");

   function getdelim
     (uu_lineptr : System.Address;
      uu_n : access stddef_h.size_t;
      uu_delimiter : int;
      uu_stream : access FILE) return x86_64_linux_gnu_bits_types_h.uu_ssize_t;  -- /usr/include/stdio.h:661
   pragma Import (C, getdelim, "getdelim");

   function getline
     (uu_lineptr : System.Address;
      uu_n : access stddef_h.size_t;
      uu_stream : access FILE) return x86_64_linux_gnu_bits_types_h.uu_ssize_t;  -- /usr/include/stdio.h:671
   pragma Import (C, getline, "getline");

   function fputs (uu_s : Interfaces.C.Strings.chars_ptr; uu_stream : access FILE) return int;  -- /usr/include/stdio.h:682
   pragma Import (C, fputs, "fputs");

   function puts (uu_s : Interfaces.C.Strings.chars_ptr) return int;  -- /usr/include/stdio.h:688
   pragma Import (C, puts, "puts");

   function ungetc (uu_c : int; uu_stream : access FILE) return int;  -- /usr/include/stdio.h:695
   pragma Import (C, ungetc, "ungetc");

   function fread
     (uu_ptr : System.Address;
      uu_size : stddef_h.size_t;
      uu_n : stddef_h.size_t;
      uu_stream : access FILE) return stddef_h.size_t;  -- /usr/include/stdio.h:702
   pragma Import (C, fread, "fread");

   function fwrite
     (uu_ptr : System.Address;
      uu_size : stddef_h.size_t;
      uu_n : stddef_h.size_t;
      uu_s : access FILE) return stddef_h.size_t;  -- /usr/include/stdio.h:708
   pragma Import (C, fwrite, "fwrite");

   function fputs_unlocked (uu_s : Interfaces.C.Strings.chars_ptr; uu_stream : access FILE) return int;  -- /usr/include/stdio.h:719
   pragma Import (C, fputs_unlocked, "fputs_unlocked");

   function fread_unlocked
     (uu_ptr : System.Address;
      uu_size : stddef_h.size_t;
      uu_n : stddef_h.size_t;
      uu_stream : access FILE) return stddef_h.size_t;  -- /usr/include/stdio.h:730
   pragma Import (C, fread_unlocked, "fread_unlocked");

   function fwrite_unlocked
     (uu_ptr : System.Address;
      uu_size : stddef_h.size_t;
      uu_n : stddef_h.size_t;
      uu_stream : access FILE) return stddef_h.size_t;  -- /usr/include/stdio.h:732
   pragma Import (C, fwrite_unlocked, "fwrite_unlocked");

   function fseek
     (uu_stream : access FILE;
      uu_off : long;
      uu_whence : int) return int;  -- /usr/include/stdio.h:742
   pragma Import (C, fseek, "fseek");

   function ftell (uu_stream : access FILE) return long;  -- /usr/include/stdio.h:747
   pragma Import (C, ftell, "ftell");

   procedure rewind (uu_stream : access FILE);  -- /usr/include/stdio.h:752
   pragma Import (C, rewind, "rewind");

   function fseeko
     (uu_stream : access FILE;
      uu_off : x86_64_linux_gnu_bits_types_h.uu_off_t;
      uu_whence : int) return int;  -- /usr/include/stdio.h:766
   pragma Import (C, fseeko, "fseeko");

   function ftello (uu_stream : access FILE) return x86_64_linux_gnu_bits_types_h.uu_off_t;  -- /usr/include/stdio.h:771
   pragma Import (C, ftello, "ftello");

   function fgetpos (uu_stream : access FILE; uu_pos : access fpos_t) return int;  -- /usr/include/stdio.h:791
   pragma Import (C, fgetpos, "fgetpos");

   function fsetpos (uu_stream : access FILE; uu_pos : System.Address) return int;  -- /usr/include/stdio.h:796
   pragma Import (C, fsetpos, "fsetpos");

   function fseeko64
     (uu_stream : access FILE;
      uu_off : x86_64_linux_gnu_bits_types_h.uu_off64_t;
      uu_whence : int) return int;  -- /usr/include/stdio.h:811
   pragma Import (C, fseeko64, "fseeko64");

   function ftello64 (uu_stream : access FILE) return x86_64_linux_gnu_bits_types_h.uu_off64_t;  -- /usr/include/stdio.h:812
   pragma Import (C, ftello64, "ftello64");

   function fgetpos64 (uu_stream : access FILE; uu_pos : access fpos64_t) return int;  -- /usr/include/stdio.h:813
   pragma Import (C, fgetpos64, "fgetpos64");

   function fsetpos64 (uu_stream : access FILE; uu_pos : System.Address) return int;  -- /usr/include/stdio.h:814
   pragma Import (C, fsetpos64, "fsetpos64");

   procedure clearerr (uu_stream : access FILE);  -- /usr/include/stdio.h:819
   pragma Import (C, clearerr, "clearerr");

   function feof (uu_stream : access FILE) return int;  -- /usr/include/stdio.h:821
   pragma Import (C, feof, "feof");

   function ferror (uu_stream : access FILE) return int;  -- /usr/include/stdio.h:823
   pragma Import (C, ferror, "ferror");

   procedure clearerr_unlocked (uu_stream : access FILE);  -- /usr/include/stdio.h:828
   pragma Import (C, clearerr_unlocked, "clearerr_unlocked");

   function feof_unlocked (uu_stream : access FILE) return int;  -- /usr/include/stdio.h:829
   pragma Import (C, feof_unlocked, "feof_unlocked");

   function ferror_unlocked (uu_stream : access FILE) return int;  -- /usr/include/stdio.h:830
   pragma Import (C, ferror_unlocked, "ferror_unlocked");

   procedure perror (uu_s : Interfaces.C.Strings.chars_ptr);  -- /usr/include/stdio.h:839
   pragma Import (C, perror, "perror");

   function fileno (uu_stream : access FILE) return int;  -- /usr/include/stdio.h:851
   pragma Import (C, fileno, "fileno");

   function fileno_unlocked (uu_stream : access FILE) return int;  -- /usr/include/stdio.h:856
   pragma Import (C, fileno_unlocked, "fileno_unlocked");

   function popen (uu_command : Interfaces.C.Strings.chars_ptr; uu_modes : Interfaces.C.Strings.chars_ptr) return access FILE;  -- /usr/include/stdio.h:866
   pragma Import (C, popen, "popen");

   function pclose (uu_stream : access FILE) return int;  -- /usr/include/stdio.h:872
   pragma Import (C, pclose, "pclose");

   function ctermid (uu_s : Interfaces.C.Strings.chars_ptr) return Interfaces.C.Strings.chars_ptr;  -- /usr/include/stdio.h:878
   pragma Import (C, ctermid, "ctermid");

   function cuserid (uu_s : Interfaces.C.Strings.chars_ptr) return Interfaces.C.Strings.chars_ptr;  -- /usr/include/stdio.h:884
   pragma Import (C, cuserid, "cuserid");

   --  skipped empty struct obstack

   function obstack_printf (uu_obstack : System.Address; uu_format : Interfaces.C.Strings.chars_ptr  -- , ...
      ) return int;  -- /usr/include/stdio.h:892
   pragma Import (C, obstack_printf, "obstack_printf");

   function obstack_vprintf
     (uu_obstack : System.Address;
      uu_format : Interfaces.C.Strings.chars_ptr;
      uu_args : access System.Address) return int;  -- /usr/include/stdio.h:895
   pragma Import (C, obstack_vprintf, "obstack_vprintf");

   procedure flockfile (uu_stream : access FILE);  -- /usr/include/stdio.h:906
   pragma Import (C, flockfile, "flockfile");

   function ftrylockfile (uu_stream : access FILE) return int;  -- /usr/include/stdio.h:910
   pragma Import (C, ftrylockfile, "ftrylockfile");

   procedure funlockfile (uu_stream : access FILE);  -- /usr/include/stdio.h:913
   pragma Import (C, funlockfile, "funlockfile");

end stdio_h;
