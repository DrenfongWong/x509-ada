with System;

with Interfaces.C;

package body X509.Utils
is

   package C renames Interfaces.C;

   Hex_Chars : constant String := "0123456789abcdef";

   function To_Hex_String (Input : Byte_Array) return String;
   --  Return hexadecimal string represenation of byte array.

   -------------------------------------------------------------------------

   function To_Hex_String (Input : Byte_Array) return String
   is
      use type Interfaces.Unsigned_8;
      use type Interfaces.C.size_t;
   begin
      if Input'Length = 0 then
         return "0";
      end if;

      declare
         Result : String (1 .. Input'Length * 2) := (others => '0');
         Where  : Integer range Result'Range     := Result'First;
         Temp   : Interfaces.Unsigned_8;
      begin
         for Index in Input'Range loop

            --  For each word

            Temp := Interfaces.Unsigned_8 (Input (Index));
            for J in reverse 0 .. 2 - 1 loop
               Result (Where + J) := Hex_Chars (Integer (Temp and 16#F#) + 1);
               Temp := Interfaces.Shift_Right (Value  => Temp,
                                               Amount => 4);
            end loop;

            if Index /= Input'Last then
               exit when Where + 2 >= Result'Last;
               Where := Where + 2;
            end if;
         end loop;

         return Result;
      end;
   end To_Hex_String;

   -------------------------------------------------------------------------

   function To_Hex_String (Num : INTEGER_h.INTEGER_t) return String
   is
      procedure C_Memcpy
        (Dst : System.Address;
         Src : System.Address;
         Len : C.size_t);
      pragma Import (C, C_Memcpy, "memcpy");

      Buffer : Byte_Array (1 .. Integer (Num.size)) := (others => 0);
   begin
      C_Memcpy (Dst => Buffer'Address,
                Src => Num.buf.all'Address,
                Len => C.size_t (Num.size));
      return To_Hex_String (Input => Buffer);
   end To_Hex_String;

end X509.Utils;
