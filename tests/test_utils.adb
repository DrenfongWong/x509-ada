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

with GNAT.OS_Lib;

package body Test_Utils
is

   -------------------------------------------------------------------------

   procedure Execute
     (Command     : String;
      Output_File : String;
      Interpreter : String := "/bin/sh")
   is
      Success     : Boolean;
      Return_Code : Integer;
      Args        : GNAT.OS_Lib.Argument_List_Access;
   begin
      Args := GNAT.OS_Lib.Argument_String_To_List
        (Arg_String => Interpreter & " " & Command);

      GNAT.OS_Lib.Spawn
        (Program_Name => Args (Args'First).all,
         Args         => Args (Args'First + 1 .. Args'Last),
         Output_File  => Output_File,
         Success      => Success,
         Return_Code  => Return_Code);

      GNAT.OS_Lib.Free (Arg => Args);

      if Return_Code /= 0 then
         raise Command_Error with "Error executing: '" & Command
           & "' (code" & Return_Code'Img & ")";
      end if;
   end Execute;

end Test_Utils;
