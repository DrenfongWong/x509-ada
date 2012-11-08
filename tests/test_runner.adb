--
--  Copyright (C) 2012 secunet Security Networks AG
--  Copyright (C) 2012 Reto Buerki <reet@codelabs.ch>
--
--  This program is free software; you can redistribute it and/or modify it
--  under the terms of the GNU General Public License as published by the
--  Free Software Foundation; either version 2 of the License, or (at your
--  option) any later version.  See <http://www.fsf.org/copyleft/gpl.txt>.
--
--  This program is distributed in the hope that it will be useful, but
--  WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
--  or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
--  for more details.
--
--  As a special exception, if other files instantiate generics from this
--  unit,  or  you  link  this  unit  with  other  files  to  produce  an
--  executable   this  unit  does  not  by  itself  cause  the  resulting
--  executable to  be  covered by the  GNU General  Public License.  This
--  exception does  not  however  invalidate  any  other reasons why  the
--  executable file might be covered by the GNU Public License.
--

with Ada.Text_IO;

with Ahven.Text_Runner;
with Ahven.Framework;

with Util_Tests;
with Key_Tests;
with Cert_Tests;
with Oid_Tests;
with Validity_Tests;

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
   Add_Test (Suite => S.all,
             T     => new Validity_Tests.Testcase);

   Ada.Text_IO.Put_Line ("Running " & Name & " ... please wait");

   Ahven.Text_Runner.Run (Suite => S);
   Release_Suite (T => S);
end Test_Runner;
