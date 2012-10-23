with Ahven.Framework;

package Util_Tests
is

   type Testcase is new Ahven.Framework.Test_Case with null record;

   procedure Initialize (T : in out Testcase);
   --  Initialize testcase.

   procedure Read_Files;
   --  Read file contents.

end Util_Tests;
