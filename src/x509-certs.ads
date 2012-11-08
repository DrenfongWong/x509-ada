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
   --  Load X.509 certificate from byte array buffer. Raises an exception if
   --  the parsing of the certificate failed.

   function Get_Public_Key
     (Cert : Certificate_Type)
      return Keys.RSA_Public_Key_Type;
   --  Return public key of certificate.

   function Get_Pubkey_Alg (Cert : Certificate_Type) return Oids.Oid_Type;
   --  Return public key algorithm identifier.

   function Get_Signature (Cert : Certificate_Type) return Byte_Array;
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

   function Get_Tbs_Data (Cert : Certificate_Type) return Byte_Array;
   --  Return DER encoded TBSCertificate data.

   function Is_Ca (Cert : Certificate_Type) return Boolean;
   --  Returns True if the given certificate is a Certificate Authority.

   Encoding_Error : exception;

private

   type Byte_Sequence is record
      Size : Natural := 0;
      Data : Byte_Array (1 .. 8192);
   end record;
   --  Byte sequence.

   Null_Sequence : constant Byte_Sequence
     := (Size => 0,
         Data => (others => 0));

   type Certificate_Type is record
      Issuer          : Ada.Strings.Unbounded.Unbounded_String;
      Subject         : Ada.Strings.Unbounded.Unbounded_String;
      Signature       : Byte_Sequence            := Null_Sequence;
      Signature_Alg   : Oids.Oid_Type            := Oids.Undefined;
      Pubkey          : Keys.RSA_Public_Key_Type := Keys.Null_Public_Key;
      Pubkey_Alg      : Oids.Oid_Type            := Oids.Undefined;
      Validity_Period : Validity.Validity_Type   := Validity.Null_Validity;
      Is_Ca           : Boolean                  := False;
      Der_Encoding    : Byte_Sequence            := Null_Sequence;
   end record;

   Null_Certificate : constant Certificate_Type := (others => <>);

end X509.Certs;
