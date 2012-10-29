with Ahven.Framework;

package Cert_Tests
is

   type Testcase is new Ahven.Framework.Test_Case with null record;

   procedure Initialize (T : in out Testcase);
   --  Initialize testcase.

   procedure Load_Cert;
   --  Test loading of a X.509 cert.

   procedure Load_Ca_Cert;
   --  Test loading of a X.509 CA cert.

   procedure Load_Random_Certs;
   --  Test loading of randomly generated X.509 certs.

   procedure Load_Random_Chunk;
   --  Test loading of random chunks.

   procedure Load_Random_ASN1;
   --  Test loading of random ASN1 structures.

end Cert_Tests;
