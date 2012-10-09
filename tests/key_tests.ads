with Ahven.Framework;

package Key_Tests
is

   type Testcase is new Ahven.Framework.Test_Case with null record;

   procedure Initialize (T : in out Testcase);
   --  Initialize testcase.

   procedure Load_Keys;
   --  Test loading of PKCS#1 private keys.

end Key_Tests;
