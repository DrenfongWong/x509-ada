with Ahven.Framework;

package Validity_Tests
is

   type Testcase is new Ahven.Framework.Test_Case with null record;

   procedure Initialize (T : in out Testcase);
   --  Initialize testcase.

   procedure Check_Is_Valid;
   --  Test Is_Valid function.

end Validity_Tests;
