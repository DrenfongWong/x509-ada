package Test_Utils
is
   procedure Execute
     (Command     : String;
      Output_File : String;
      Interpreter : String := "/bin/sh");
   --  Execute given command with the specified interpreter. The output (if
   --  any) produced by the command will be redirected to Output_File.

   Command_Error : exception;

end Test_Utils;
