with X509.Certs;
with X509.Keys;

package body Cert_Tests
is

   use Ahven;
   use X509;

   Ref_Modulus : constant String := "00d88d6a4811e6972dd0daa2adf3c911bf5edd866"
     & "4607bea67f45427a11af59184f0ab90c46007b8b5aa69fff71ab2ff2d822cd5f4c9ec9"
     & "4cd32ef8f49e73c91ff48e40c48b4fcdbfae4b023d857431865349f15f998ecf50dc65"
     & "ffe7dc12dc37071788bc6fcf08fdfeda2c6c073a84724ff5193d73c622b1d2f545a1ff"
     & "9d3ffd0fc62eb7a2be85bae427e3ee8362df0313630641e4cc8f639abd311718c843da"
     & "d0634cd06cf361f204910cfc9ee48bfea590ae62e6952e8ab70e4bdc75ec51a2a29c6b"
     & "74c48ee32c65a1e32b27ae330dc4acd1b762c84ea48fb684d3476241e9ae7feb9e3898"
     & "1d85184ae949dfcb8064e6c333a096864ba6c420b0deb18e952fb";

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
      Cert   : Certs.Certificate_Type;
      Pubkey : Keys.RSA_Public_Key_Type;
   begin
      Assert (Condition => Certs.Get_Signature (Cert) = "",
              Message   => "Unexpected signature");

      Certs.Load (Filename => "data/cert.der",
                  Cert     => Cert);

      Pubkey := Certs.Get_Public_Key (Cert);
      Assert (Condition => Pubkey.Get_Pub_Exponent = "010001",
              Message   => "Pubkey exponent mismatch");
      Assert (Condition => Pubkey.Get_Size = 2048,
              Message   => "Pubkey modulus size mismatch");
      Assert (Condition => Pubkey.Get_Modulus = Ref_Modulus,
              Message   => "Pubkey modulus mismatch");

      Assert (Condition => Certs.Get_Signature (Cert) = Ref_Sig,
              Message   => "Signature mismatch");
   end Load_Certs;

end Cert_Tests;
