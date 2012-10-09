with Ada.Strings.Unbounded;

package X509.Keys
is

   type RSA_Private_Key_Type is private;
   --  PKCS#1 RSA private key.

   procedure Load
     (Filename :     String;
      Key      : out RSA_Private_Key_Type);
   --  Load RSA private key from given file. Raises an exception if the parsing
   --  of the key file failed.

   function Get_Modulus (Key : RSA_Private_Key_Type) return String;
   --  Return modulus of private key.

   function Get_Pub_Exponent (Key : RSA_Private_Key_Type) return String;
   --  Return public exponent.

   Load_Error : exception;

private

   type RSA_Private_Key_Type is record
      Modulus, Pub_Exp : Ada.Strings.Unbounded.Unbounded_String;
   end record;

end X509.Keys;
