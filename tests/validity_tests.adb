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

with X509.Certs;
with X509.Validity;

package body Validity_Tests
is

   use Ahven;
   use X509;

   -------------------------------------------------------------------------

   procedure Check_Is_Valid
   is
      Cacert : Certs.Certificate_Type;
      Val    : Validity.Validity_Type;
   begin
      Assert (Condition => not Validity.Is_Valid (V => Validity.Null_Validity),
              Message   => "Null validity valid");

      Certs.Load (Filename => "data/ca_invalid.der",
                  Cert     => Cacert);
      Val := Certs.Get_Validity (Cert => Cacert);
      Assert (Condition => not Validity.Is_Valid (V => Val),
              Message   => "CA not invalid");
   end Check_Is_Valid;

   -------------------------------------------------------------------------

   procedure Initialize (T : in out Testcase)
   is
   begin
      T.Set_Name (Name => "Validity tests");
      T.Add_Test_Routine
        (Routine => Check_Is_Valid'Access,
         Name    => "Is_Valid function");
   end Initialize;

end Validity_Tests;
