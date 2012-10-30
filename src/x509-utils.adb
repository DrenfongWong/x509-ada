with Ada.Direct_IO;
with Ada.Exceptions;

package body X509.Utils
is

   package C renames Interfaces.C;
   package D_IO is new Ada.Direct_IO (Element_Type => Byte);

   Hex_Chars : constant String := "0123456789abcdef";

   function To_Hex_String (Input : Byte_Array) return String;
   --  Return hexadecimal string represenation of byte array.

   procedure C_Memcpy
     (Dst : System.Address;
      Src : System.Address;
      Len : C.size_t);
   pragma Import (C, C_Memcpy, "memcpy");

   -------------------------------------------------------------------------

   function Read_File (Filename : String) return Byte_Array
   is
      File : D_IO.File_Type;
      Size : D_IO.Count;
   begin
      begin
         D_IO.Open (File => File,
                    Mode => D_IO.In_File,
                    Name => Filename);
         Size := D_IO.Size (File => File);

      exception
         when E : others =>
            raise IO_Error with "Unable to load file '" & Filename & "' : "
              & Ada.Exceptions.Exception_Message (E);
      end;

      declare
         Buffer : Byte_Array (1 .. Integer (Size)) := (others => 0);
      begin
         for I in Buffer'Range loop
            D_IO.Read (File => File,
                       Item => Buffer (I));
         end loop;
         D_IO.Close (File => File);

         return Buffer;

      exception
         when others =>
            if D_IO.Is_Open (File => File) then
               D_IO.Close (File => File);
            end if;
            raise;
      end;
   end Read_File;

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

   function To_Hex_String
     (Address : System.Address;
      Size    : Interfaces.C.int)
      return String
   is
      Buffer : Byte_Array (1 .. Integer (Size)) := (others => 0);
   begin
      C_Memcpy (Dst => Buffer'Address,
                Src => Address,
                Len => C.size_t (Size));
      return To_Hex_String (Input => Buffer);
   end To_Hex_String;

   -------------------------------------------------------------------------

   function To_String
     (Address : System.Address;
      Size    : Interfaces.C.int)
      return String
   is
      Buffer : Byte_Array (1 .. Integer (Size)) := (others => 0);
      Result : String (Buffer'Range);
   begin
      C_Memcpy (Dst => Buffer'Address,
                Src => Address,
                Len => C.size_t (Size));
      for I in Result'Range loop
         Result (I) := Character'Val (Buffer (I));
      end loop;

      return Result;
   end To_String;

end X509.Utils;
