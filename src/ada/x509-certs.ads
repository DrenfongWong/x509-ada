with Ada.Strings.Unbounded;

with X509.Keys;

package X509.Certs
is

   type Certificate_Type is private;
   --  X.509 certificate.

   Null_Certificate : constant Certificate_Type;
   --  Uninitialized certificate.

   procedure Load
     (Filename :     String;
      Cert     : out Certificate_Type);
   --  Load X.509 certificate from given file. Raises an exception if the
   --  parsing of the certificate file failed.

   function Get_Public_Key
     (Cert : Certificate_Type)
      return Keys.RSA_Public_Key_Type;
   --  Return public key of certificate.

   function Get_Signature (Cert : Certificate_Type) return String;
   --  Return certificate signature.

private

   type Certificate_Type is record
      Signature : Ada.Strings.Unbounded.Unbounded_String;
      Pubkey    : Keys.RSA_Public_Key_Type := Keys.Null_Public_Key;
   end record;

   Null_Certificate : constant Certificate_Type := (others => <>);

end X509.Certs;
