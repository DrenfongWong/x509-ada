with Interfaces.C; use Interfaces.C;
with x86_64_linux_gnu_bits_types_h;

package time_h is

   subtype clock_t is x86_64_linux_gnu_bits_types_h.uu_clock_t;  -- /usr/include/time.h:60

   subtype time_t is x86_64_linux_gnu_bits_types_h.uu_time_t;  -- /usr/include/time.h:76

   subtype clockid_t is x86_64_linux_gnu_bits_types_h.uu_clockid_t;  -- /usr/include/time.h:92

   subtype timer_t is x86_64_linux_gnu_bits_types_h.uu_timer_t;  -- /usr/include/time.h:104

   type timespec is record
      tv_sec : aliased x86_64_linux_gnu_bits_types_h.uu_time_t;  -- /usr/include/time.h:122
      tv_nsec : aliased long;  -- /usr/include/time.h:123
   end record;
   pragma Convention (C_Pass_By_Copy, timespec);  -- /usr/include/time.h:120

end time_h;
