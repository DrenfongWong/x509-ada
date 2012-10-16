with Ada.Strings.Unbounded;

package X509.Keys
is

   type RSA_Private_Key_Type is private;
   --  PKCS#1 RSA private key.

   Null_Private_Key : constant RSA_Private_Key_Type;
   --  Uninitialized private key.

   procedure Load
     (Filename :     String;
      Key      : out RSA_Private_Key_Type);
   --  Load RSA private key from given file. Raises an exception if the parsing
   --  of the key file failed.

   function Get_Modulus (Key : RSA_Private_Key_Type) return String;
   --  Return modulus of private key.

   function Get_Pub_Exponent (Key : RSA_Private_Key_Type) return String;
   --  Return public exponent.

   function Get_Priv_Exponent (Key : RSA_Private_Key_Type) return String;
   --  Return private exponent.

   function Get_Prime_P (Key : RSA_Private_Key_Type) return String;
   --  Return first prime p.

   function Get_Prime_Q (Key : RSA_Private_Key_Type) return String;
   --  Return second prime q.

   function Get_Exponent1 (Key : RSA_Private_Key_Type) return String;
   --  Return first exponent, d mod (p-1).

   function Get_Exponent2 (Key : RSA_Private_Key_Type) return String;
   --  Return second exponent, d mod (q-1).

   function Get_Coefficient (Key : RSA_Private_Key_Type) return String;
   --  Return coefficient, (inverse of q) mod p.

   function Get_Size (Key : RSA_Private_Key_Type) return Natural;
   --  Return size of modulus in bits.

   Load_Error : exception;

private

   type RSA_Private_Key_Type is record
      Size : Natural := 0;
      --  Size of modulus in bits.

      N, E, D, P, Q, Exp1, Exp2, Coe : Ada.Strings.Unbounded.Unbounded_String;
   end record;

   Null_Private_Key : constant RSA_Private_Key_Type := (others => <>);

end X509.Keys;
