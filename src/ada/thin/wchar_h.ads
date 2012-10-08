with Interfaces.C; use Interfaces.C;

package wchar_h is

   subtype uu_mbstate_t_uu_wchb_array is Interfaces.C.char_array (0 .. 3);
   type anon_2 (discr : unsigned := 0) is record
      case discr is
         when 0 =>
            uu_wch : aliased unsigned;  -- /usr/include/wchar.h:89
         when others =>
            uu_wchb : aliased uu_mbstate_t_uu_wchb_array;  -- /usr/include/wchar.h:93
      end case;
   end record;
   pragma Convention (C_Pass_By_Copy, anon_2);
   pragma Unchecked_Union (anon_2);
   type uu_mbstate_t is record
      uu_count : aliased int;  -- /usr/include/wchar.h:85
      uu_value : anon_2;  -- /usr/include/wchar.h:94
   end record;
   pragma Convention (C_Pass_By_Copy, uu_mbstate_t);  -- /usr/include/wchar.h:95

   --  skipped anonymous struct anon_1

end wchar_h;
