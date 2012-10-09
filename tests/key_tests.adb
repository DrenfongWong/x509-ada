with X509.Keys;

package body Key_Tests
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

   Ref_Priv_Exp : constant String := "5877fd918fee9a9897189b1961dd2528ff8294e2"
     & "f11feeb5a575b3f2f766979aae10094690ccd6c330e9b92ea473b818497433bc9bb9d1"
     & "58bb946eff8c3e8c8eb4a2a5fa1626af6022896b3b78faea3e7e6ef7b54eaa8fba9eee"
     & "9cb3977630c0013b742f492aa63c9f82be9be5243c5c7b0a42d1cdd37535a91e56eb75"
     & "4f0cd4fdc52d015f22635c84b70fcaca2c8bfc8eda277cd9d6983ee6445224b283ad19"
     & "5fd3143e23b018d765eb4a299b2eac66c95996abbe059bf60058682f8bf371d38660fc"
     & "2e30a7803e8b316d37ccd68e4b58d5bad1ac29d17d411c7afbf984fa85c5f38f16607d"
     & "c7b997ffc787e6fd93f9747db30a05f76c561f1439eed701e0d1";

   -------------------------------------------------------------------------

   procedure Initialize (T : in out Testcase)
   is
   begin
      T.Set_Name (Name => "PKCS#1 key tests");
      T.Add_Test_Routine
        (Routine => Load_Keys'Access,
         Name    => "Load RSA private keys");
   end Initialize;

   -------------------------------------------------------------------------

   procedure Load_Keys
   is
      Privkey : Keys.RSA_Private_Key_Type;
   begin
      Assert (Condition => Keys.Get_Modulus (Key => Privkey) = "",
              Message   => "Unexpected modulus");

      Keys.Load (Filename => "data/key.der",
                 Key      => Privkey);
      Assert (Condition => Keys.Get_Modulus (Key => Privkey) = Ref_Modulus,
              Message   => "Modulus mismatch");
      Assert (Condition => Keys.Get_Pub_Exponent (Key => Privkey) = "010001",
              Message   => "Public exponent mismatch");
      Assert (Condition => Keys.Get_Priv_Exponent
              (Key => Privkey) = Ref_Priv_Exp,
              Message   => "Private exponent mismatch");

      begin
         Keys.Load (Filename => "data/key_invalid.der",
                    Key      => Privkey);
         Fail (Message => "Exception expected");

      exception
         when Keys.Load_Error => null;
      end;

      begin
         Keys.Load (Filename => "/invalid/key/test",
                    Key      => Privkey);
         Fail (Message => "Exception expected");

      exception
         when Keys.Load_Error => null;
      end;
   end Load_Keys;

end Key_Tests;
