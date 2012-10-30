with X509.Certs;
with X509.Validity;

package body Validity_Tests
is

   use Ahven;
   use X509;

   -------------------------------------------------------------------------

   procedure Check_Is_Valid
   is
      Cacert : Certs.Certificate_Type;
      Val    : Validity.Validity_Type;
   begin
      Assert (Condition => not Validity.Is_Valid (V => Validity.Null_Validity),
              Message   => "Null validity valid");

      Certs.Load (Filename => "data/ca_invalid.der",
                  Cert     => Cacert);
      Val := Certs.Get_Validity (Cert => Cacert);
      Assert (Condition => not Validity.Is_Valid (V => Val),
              Message   => "CA not invalid");
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
