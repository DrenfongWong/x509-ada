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

with Interfaces.C;

with RSAPrivateKey_h;
with RSAPublicKey_h;

with X509.Utils;
with X509.Decoder;
with X509.Constraints;

package body X509.Keys
is

   use Ada.Strings.Unbounded;

   type Privkey_Access is access all RSAPrivateKey_h.RSAPrivateKey_t;
   type Pubkey_Access is access all RSAPublicKey_h.RSAPublicKey_t;

   -------------------------------------------------------------------------

   function Get_Coefficient (Key : RSA_Private_Key_Type) return String
   is
   begin
      return To_String (Key.Coe);
   end Get_Coefficient;

   -------------------------------------------------------------------------

   function Get_Exponent1 (Key : RSA_Private_Key_Type) return String
   is
   begin
      return To_String (Key.Exp1);
   end Get_Exponent1;

   -------------------------------------------------------------------------

   function Get_Exponent2 (Key : RSA_Private_Key_Type) return String
   is
   begin
      return To_String (Key.Exp2);
   end Get_Exponent2;

   -------------------------------------------------------------------------

   function Get_Modulus (Key : Key_Type) return String
   is
   begin
      return To_String (Key.N);
   end Get_Modulus;

   -------------------------------------------------------------------------

   function Get_Prime_P (Key : RSA_Private_Key_Type) return String
   is
   begin
      return To_String (Key.P);
   end Get_Prime_P;

   -------------------------------------------------------------------------

   function Get_Prime_Q (Key : RSA_Private_Key_Type) return String
   is
   begin
      return To_String (Key.Q);
   end Get_Prime_Q;

   -------------------------------------------------------------------------

   function Get_Priv_Exponent (Key : RSA_Private_Key_Type) return String
   is
   begin
      return To_String (Key.D);
   end Get_Priv_Exponent;

   -------------------------------------------------------------------------

   function Get_Pub_Exponent (Key : Key_Type) return String
   is
   begin
      return To_String (Key.E);
   end Get_Pub_Exponent;

   -------------------------------------------------------------------------

   function Get_Size (Key : Key_Type) return Natural
   is
   begin
      return Key.Size;
   end Get_Size;

   -------------------------------------------------------------------------

   procedure Load
     (Key      : out RSA_Private_Key_Type;
      Filename :     String)
   is
      use type Interfaces.C.int;

      Data   : Privkey_Access;
      Buffer : Byte_Array := Utils.Read_File (Filename);
   begin
      Decoder.Decode
        (Type_Descriptor  => RSAPrivateKey_h.asn_DEF_RSAPrivateKey'Access,
         Type_Handle_Addr => Data'Address,
         Buffer           => Buffer'Address,
         Buffer_Size      => Buffer'Length,
         Error_Prefix     => "Unable to load private key '" & Filename & "'");
      Constraints.Check
        (Type_Descriptor => RSAPrivateKey_h.asn_DEF_RSAPrivateKey'Access,
         Address         => Data.all'Address,
         Error_Prefix    => "Validation failed for '" & Filename & "'");

      Key.Size := Positive (Data.modulus.size - 1) * 8;
      Key.N    := To_Unbounded_String
        (Utils.To_Hex_String (Address => Data.modulus.buf.all'Address,
                              Size    => Data.modulus.size));
      Key.E    := To_Unbounded_String
        (Utils.To_Hex_String (Address => Data.publicExponent.buf.all'Address,
                              Size    => Data.publicExponent.size));
      Key.D    := To_Unbounded_String
        (Utils.To_Hex_String (Address => Data.privateExponent.buf.all'Address,
                              Size    => Data.privateExponent.size));
      Key.P    := To_Unbounded_String
        (Utils.To_Hex_String (Address => Data.prime1.buf.all'Address,
                              Size    => Data.prime1.size));
      Key.Q    := To_Unbounded_String
        (Utils.To_Hex_String (Address => Data.prime2.buf.all'Address,
                              Size    => Data.prime2.size));
      Key.Exp1 := To_Unbounded_String
        (Utils.To_Hex_String (Address => Data.exponent1.buf.all'Address,
                              Size    => Data.exponent1.size));
      Key.Exp2 := To_Unbounded_String
        (Utils.To_Hex_String (Address => Data.exponent2.buf.all'Address,
                              Size    => Data.exponent2.size));
      Key.Coe  := To_Unbounded_String
        (Utils.To_Hex_String (Address => Data.coefficient.buf.all'Address,
                              Size    => Data.coefficient.size));

      RSAPrivateKey_h.asn_DEF_RSAPrivateKey.free_struct
        (RSAPrivateKey_h.asn_DEF_RSAPrivateKey'Address,
         Data.all'Address, 0);
   end Load;

   -------------------------------------------------------------------------

   procedure Load
     (Key     : out RSA_Public_Key_Type;
      Address :     System.Address;
      Size    :     Positive)
   is
      use type Interfaces.C.int;

      Data : Pubkey_Access;
   begin
      Decoder.Decode
        (Type_Descriptor  => RSAPublicKey_h.asn_DEF_RSAPublicKey'Access,
         Type_Handle_Addr => Data'Address,
         Buffer           => Address,
         Buffer_Size      => Size,
         Error_Prefix     => "Unable to load public key from buffer");
      Constraints.Check
        (Type_Descriptor => RSAPublicKey_h.asn_DEF_RSAPublicKey'Access,
         Address         => Data.all'Address,
         Error_Prefix    => "Public key validation failed");

      Key.Size := Positive (Data.modulus.size - 1) * 8;
      Key.N    := To_Unbounded_String
        (Utils.To_Hex_String (Address => Data.modulus.buf.all'Address,
                              Size    => Data.modulus.size));
      Key.E    := To_Unbounded_String
        (Utils.To_Hex_String (Address => Data.publicExponent.buf.all'Address,
                              Size    => Data.publicExponent.size));

      RSAPublicKey_h.asn_DEF_RSAPublicKey.free_struct
        (RSAPublicKey_h.asn_DEF_RSAPublicKey'Address,
         Data.all'Address, 0);
   end Load;

end X509.Keys;
