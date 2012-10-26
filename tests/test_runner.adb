with Ada.Text_IO;

with Ahven.Text_Runner;
with Ahven.Framework;

with Util_Tests;
with Key_Tests;
with Cert_Tests;
with Oid_Tests;

procedure Test_Runner is
   use Ahven.Framework;

   Name : constant String := "X.509 tests";
   S    : constant Test_Suite_Access := Create_Suite (Suite_Name => Name);
begin
   Add_Test (Suite => S.all,
             T     => new Util_Tests.Testcase);
   Add_Test (Suite => S.all,
             T     => new Key_Tests.Testcase);
   Add_Test (Suite => S.all,
             T     => new Cert_Tests.Testcase);
   Add_Test (Suite => S.all,
             T     => new Oid_Tests.Testcase);

   Ada.Text_IO.Put_Line ("Running " & Name & " ... please wait");

   Ahven.Text_Runner.Run (Suite => S);
   Release_Suite (T => S);
end Test_Runner;
