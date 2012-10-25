with Ada.Strings.Unbounded;

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

   function Get_Signature (Cert : Certificate_Type) return String;
   --  Return certificate signature.

private

   type Certificate_Type is record
      Signature : Ada.Strings.Unbounded.Unbounded_String;
   end record;

   Null_Certificate : constant Certificate_Type := (others => <>);

end X509.Certs;
