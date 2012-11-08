--
--  Copyright (C) 2012 secunet Security Networks AG
--  Copyright (C) 2012 Reto Buerki <reet@codelabs.ch>
--
--  This program is free software; you can redistribute it and/or modify it
--  under the terms of the GNU General Public License as published by the
--  Free Software Foundation; either version 2 of the License, or (at your
--  option) any later version.  See <http://www.fsf.org/copyleft/gpl.txt>.
--
--  This program is distributed in the hope that it will be useful, but
--  WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
--  or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
--  for more details.
--
--  As a special exception, if other files instantiate generics from this
--  unit,  or  you  link  this  unit  with  other  files  to  produce  an
--  executable   this  unit  does  not  by  itself  cause  the  resulting
--  executable to  be  covered by the  GNU General  Public License.  This
--  exception does  not  however  invalidate  any  other reasons why  the
--  executable file might be covered by the GNU Public License.
--

with Ada.Direct_IO;
with Ada.Exceptions;

package body X509.Utils
is

   package C renames Interfaces.C;
   package D_IO is new Ada.Direct_IO (Element_Type => Byte);

   Hex_Chars : constant String := "0123456789abcdef";

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

   function To_Bytes
     (Address : System.Address;
      Size    : Interfaces.C.int)
      return Byte_Array
   is
      procedure C_Memcpy
        (Dst : System.Address;
         Src : System.Address;
         Len : C.size_t);
      pragma Import (C, C_Memcpy, "memcpy");

      Buffer : Byte_Array (1 .. Integer (Size)) := (others => 0);
   begin
      C_Memcpy (Dst => Buffer'Address,
                Src => Address,
                Len => C.size_t (Size));
      return Buffer;
   end To_Bytes;

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
   begin
      return To_Hex_String
        (Input => To_Bytes
           (Address => Address,
            Size    => Size));
   end To_Hex_String;

   -------------------------------------------------------------------------

   function To_String
     (Address : System.Address;
      Size    : Interfaces.C.int)
      return String
   is
      Buffer : constant Byte_Array
        := To_Bytes (Address => Address,
                     Size    => Size);
      Result : String (Buffer'Range);
   begin
      for I in Result'Range loop
         Result (I) := Character'Val (Buffer (I));
      end loop;

      return Result;
   end To_String;

end X509.Utils;
