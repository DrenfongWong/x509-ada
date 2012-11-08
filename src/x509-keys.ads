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

with Ada.Strings.Unbounded;

with System;

package X509.Keys
is

   type Key_Type is abstract tagged private;
   --  PKCS#1 RSA key.

   function Get_Modulus (Key : Key_Type) return String;
   --  Return modulus of key.

   function Get_Pub_Exponent (Key : Key_Type) return String;
   --  Return public exponent.

   function Get_Size (Key : Key_Type) return Natural;
   --  Return size of modulus in bits.

   -----------------
   -- Private key --
   -----------------

   type RSA_Private_Key_Type is new Key_Type with private;
   --  PKCS#1 RSA private key.

   Null_Private_Key : constant RSA_Private_Key_Type;
   --  Uninitialized private key.

   procedure Load
     (Key      : out RSA_Private_Key_Type;
      Filename :     String);
   --  Load RSA private key from given file. Raises an exception if the parsing
   --  of the key file failed.

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

   ----------------
   -- Public key --
   ----------------

   type RSA_Public_Key_Type is new Key_Type with private;
   --  PKCS#1 RSA public key.

   Null_Public_Key : constant RSA_Public_Key_Type;
   --  Uninitialized public key.

   procedure Load
     (Key     : out RSA_Public_Key_Type;
      Address :     System.Address;
      Size    :     Positive);
   --  Load RSA public key from buffer starting at given address. Raises an
   --  exception if the parsing failed.

private

   type Key_Type is tagged record
      Size : Natural := 0;
      --  Size of modulus in bits.

      N, E : Ada.Strings.Unbounded.Unbounded_String;
   end record;

   type RSA_Private_Key_Type is new Key_Type with record
      D, P, Q, Exp1, Exp2, Coe : Ada.Strings.Unbounded.Unbounded_String;
   end record;

   type RSA_Public_Key_Type is new Key_Type with null record;

   Null_Private_Key : constant RSA_Private_Key_Type := (others => <>);
   Null_Public_Key  : constant RSA_Public_Key_Type  := (others => <>);

end X509.Keys;
