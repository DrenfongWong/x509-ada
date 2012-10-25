with Ada.Strings.Unbounded;

with System;

package X509.Keys
is

   type Key_Type is abstract tagged private;

   function Get_Modulus (Key : Key_Type) return String;
   --  Return modulus of key.

   function Get_Pub_Exponent (Key : Key_Type) return String;
   --  Return public exponent.

   function Get_Size (Key : Key_Type) return Natural;
   --  Return size of modulus in bits.

   -----------------
   -- Private key --
   -----------------

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

   ----------------
   -- Public key --
   ----------------

   type RSA_Public_Key_Type is private;
   --  PKCS#1 RSA public key.

   Null_Public_Key : constant RSA_Public_Key_Type;
   --  Uninitialized public key.

   procedure Load
     (Address :     System.Address;
      Size    :     Positive;
      Key     : out RSA_Public_Key_Type);
   --  Load RSA public key from buffer starting at given address. Raises an
   --  exception if the parsing failed.

   function Get_Modulus (Key : RSA_Public_Key_Type) return String;
   --  Return modulus of public key.

   function Get_Pub_Exponent (Key : RSA_Public_Key_Type) return String;
   --  Return exponent.

   function Get_Size (Key : RSA_Public_Key_Type) return Natural;
   --  Return size of modulus in bits.

private

   type Key_Type is tagged record
      Size : Natural := 0;
      --  Size of modulus in bits.

      N, E : Ada.Strings.Unbounded.Unbounded_String;
   end record;

   type RSA_Private_Key_Type is record
      Size : Natural := 0;
      --  Size of modulus in bits.

      N, E, D, P, Q, Exp1, Exp2, Coe : Ada.Strings.Unbounded.Unbounded_String;
   end record;

   type RSA_Public_Key_Type is record
      Size : Natural := 0;
      --  Size of modulus in bits.

      N, E : Ada.Strings.Unbounded.Unbounded_String;
   end record;

   Null_Private_Key : constant RSA_Private_Key_Type := (others => <>);
   Null_Public_Key : constant RSA_Public_Key_Type := (others => <>);

end X509.Keys;
