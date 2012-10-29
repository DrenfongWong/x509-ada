with X509.Validity;

package body Validity_Tests
is

   use Ahven;
   use X509;

   -------------------------------------------------------------------------

   procedure Check_Is_Valid
   is
   begin
      Assert (Condition => not Validity.Is_Valid (V => Validity.Null_Validity),
              Message   => "Null validity valid");
   end Check_Is_Valid;

   -------------------------------------------------------------------------

   procedure Initialize (T : in out Testcase)
   is
   begin
      T.Set_Name (Name => "Validity tests");
      T.Add_Test_Routine
        (Routine => Check_Is_Valid'Access,
         Name    => "Is_Valid function");
   end Initialize;

end Validity_Tests;
