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
