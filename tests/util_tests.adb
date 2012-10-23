with X509.Utils;

package body Util_Tests
is

   use Ahven;
   use X509;

   -------------------------------------------------------------------------

   procedure Initialize (T : in out Testcase)
   is
   begin
      T.Set_Name (Name => "Util tests");
      T.Add_Test_Routine
        (Routine => Read_Files'Access,
         Name    => "Read files");
   end Initialize;

   -------------------------------------------------------------------------

   procedure Read_Files
   is
   begin
      declare
         Content : constant Byte_Array := Utils.Read_File
           (Filename => "data/file");
      begin
         Assert (Condition => Content = (97, 98, 99, 10),
                 Message   => "Content mismatch");
      end;

      begin
         declare
            Dummy : constant Byte_Array := Utils.Read_File
              (Filename => "/invalid/key/test");
            pragma Unreferenced (Dummy);
         begin
            Fail (Message => "Exception expected");
         end;

      exception
         when Utils.IO_Error => null;
      end;
   end Read_Files;

end Util_Tests;
