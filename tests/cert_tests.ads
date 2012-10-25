with Ahven.Framework;

package Cert_Tests
is

   type Testcase is new Ahven.Framework.Test_Case with null record;

   procedure Initialize (T : in out Testcase);
   --  Initialize testcase.

   procedure Load_Certs;
   --  Test loading of X.509 certs.

end Cert_Tests;
