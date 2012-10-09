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

   Ref_Prime1 : constant String := "00ebd741cb81a87794d6d45c93ec36e028777b055b"
     & "4e54b8ec6d0c5cf1434137f9877a650632cd6f95e996d193dd754dbfaea7778e566e3f"
     & "8cefffa0fd399d289a2f1ab9e8ced96c006eeb7a2415fe765bc5f7ea30c94de10ab6b2"
     & "7056b1648327f89cd76c8ba799552b544d50be904568d5e50b8edc3bc0a6425315d270"
     & "a1cd9f";

   Ref_Prime2 : constant String := "00eb10151752f48aa212b02bb4ab588ce0bb47553f"
     & "78e28f35e41f1195110e3f144e5c968943ca61550813e4f5d19076439f9e5998aaa401"
     & "7d8ac230508f429f52f989e83f13e8e64e7b4f3fa12c2206b069490b07dc003b9a60d7"
     & "c93de046c99ad239e370d1a379c1bd5576c98999c17ad19d2eebd29d561f764730e1ab"
     & "6d8525";

   Ref_Exp1 : constant String := "0085a14c689128f1c8e6092203b6de4918e4ca51f8b0"
     & "6394fc71b5859c36ad6797fdc9be204afcd8732b0e07e62e9f5ed47393f44c3470f795"
     & "560f941aa760833709e5acdd5b071b090bd0653eb92f9bc4d86166d309dd14dc4b34c4"
     & "2e7b0926bfa940c5577db213518ce1918564d4be5f6e82ff8f8cfe56645e4451a311aa"
     & "bca5";

   Ref_Exp2 : constant String := "00ba03b20d11127f9a9e1b579ad37571966ddd973271"
     & "61285f4734e6df05ee3630c58a337e506d18f5073d6714b8500fa697ebe18f148a50bb"
     & "9e50e996f6a78c19476bc0a41a075629891f3f8535bd7f799ef7b488f5aa21809b5e67"
     & "dc555cef315b677ffac98b0a512c9933356d74854dc20f17107b4d12d836eb435d7221"
     & "6b19";

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
      Assert (Condition => Keys.Get_Prime_P (Key => Privkey) = Ref_Prime1,
              Message   => "Prime p mismatch");
      Assert (Condition => Keys.Get_Prime_Q (Key => Privkey) = Ref_Prime2,
              Message   => "Prime q mismatch");
      Assert (Condition => Keys.Get_Exponent1 (Key => Privkey) = Ref_Exp1,
              Message   => "Exponent 1 mismatch");
      Assert (Condition => Keys.Get_Exponent2 (Key => Privkey) = Ref_Exp2,
              Message   => "Exponent 2 mismatch");

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
