with Ada.Strings.Unbounded;

with X509.Keys;
with X509.Oids;
with X509.Validity;

pragma Elaborate_All (X509.Keys);

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

   procedure Load
     (Buffer :     Byte_Array;
      Cert   : out Certificate_Type);
   --  Load X.509 certificate from byte arrray buffer. Raises an exception if
   --  the parsing of the certificate failed.

   function Get_Public_Key
     (Cert : Certificate_Type)
      return Keys.RSA_Public_Key_Type;
   --  Return public key of certificate.

   function Get_Pubkey_Alg (Cert : Certificate_Type) return Oids.Oid_Type;
   --  Return public key algorithm identifier.

   function Get_Signature (Cert : Certificate_Type) return String;
   --  Return certificate signature.

   function Get_Signature_Alg (Cert : Certificate_Type) return Oids.Oid_Type;
   --  Return signature algorithm identifier.

   function Get_Issuer (Cert : Certificate_Type) return String;
   --  Return certificate issuer.

   function Get_Subject (Cert : Certificate_Type) return String;
   --  Return certificate subject.

   function Get_Validity
     (Cert : Certificate_Type)
      return Validity.Validity_Type;
   --  Return certificate validity period.

   function Is_Ca (Cert : Certificate_Type) return Boolean;
   --  Returns True if the given certificate is a Certificate Authority.

private

   type Certificate_Type is record
      Issuer          : Ada.Strings.Unbounded.Unbounded_String;
      Subject         : Ada.Strings.Unbounded.Unbounded_String;
      Signature       : Ada.Strings.Unbounded.Unbounded_String;
      Signature_Alg   : Oids.Oid_Type            := Oids.Undefined;
      Pubkey          : Keys.RSA_Public_Key_Type := Keys.Null_Public_Key;
      Pubkey_Alg      : Oids.Oid_Type            := Oids.Undefined;
      Validity_Period : Validity.Validity_Type   := Validity.Null_Validity;
      Is_Ca           : Boolean                  := False;
   end record;

   Null_Certificate : constant Certificate_Type := (others => <>);

end X509.Certs;
