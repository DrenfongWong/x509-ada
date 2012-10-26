with Ahven.Framework;

package Oid_Tests
is

   type Testcase is new Ahven.Framework.Test_Case with null record;

   procedure Initialize (T : in out Testcase);
   --  Initialize testcase.

   procedure Convert_Oids;
   --  Convert ASN.1 structures to OIDs.

end Oid_Tests;
