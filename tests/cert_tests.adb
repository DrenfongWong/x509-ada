with X509.Certs;

package body Cert_Tests
is

   use Ahven;
   use X509;

   Ref_Sig : constant String := "56bf83e11c656988b179337467a902d2a111632aa9f73"
     & "7d59ef35456c15469073c285046878b37a569572df45260eadec593f0fc174c1a83910"
     & "52a5720290f1f77fd2a2c4dfddeec066f80efaa5db0e3d34514352c939142fa93140c0"
     & "62c587c85bb6e96298e647da33034c3491cae9ee26ebe5a6a32e6e9646adc032510ea9"
     & "321b5d5827fa749f41c01b50c12682fdd3bf54fb14314fef5ad9fed368e07f51b40d3a"
     & "f3a0a9a75d939b940d38ea9d8fdb96d6c002eb88d5934cacf082354a2b71d8724896f5"
     & "b6517f2574d307a37ad17a984589e4e53d727ed354d00036ea082c92fe0c303c206021"
     & "acc99b825fdbd6f97b00ad1409e5fb1264388eed1f054f6";

   -------------------------------------------------------------------------

   procedure Initialize (T : in out Testcase)
   is
   begin
      T.Set_Name (Name => "Certificate tests");
      T.Add_Test_Routine
        (Routine => Load_Certs'Access,
         Name    => "Load X.509 certificates");
   end Initialize;

   -------------------------------------------------------------------------

   procedure Load_Certs
   is
      C : Certs.Certificate_Type;
   begin
      Assert (Condition => Certs.Get_Signature (Cert => C) = "",
              Message   => "Unexpected signature");

      Certs.Load (Filename => "data/cert.der",
                  Cert     => C);

      Assert (Condition => Certs.Get_Signature (Cert => C) = Ref_Sig,
              Message   => "Signature mismatch");
   end Load_Certs;

end Cert_Tests;
