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

with Ada.Exceptions;

with stdint_h;

with Interfaces.C;

with OBJECT_IDENTIFIER_h;

with X509.Oids;

package body Oid_Tests
is

   use Ahven;
   use X509;

   -------------------------------------------------------------------------

   procedure Convert_Oids
   is
      use type Interfaces.C.int;
      use type Oids.Oid_Type;

      type Uint8_Array is array (Interfaces.C.int range <>)
        of aliased stdint_h.uint8_t;

      A       : OBJECT_IDENTIFIER_h.OBJECT_IDENTIFIER_t
        := (others => <>);
      Unknown : Uint8_Array := (1 => 43);
      Known   : Uint8_Array := (16#2a#, 16#86#, 16#48#, 16#86#, 16#f7#, 16#0d#,
                                16#01#, 16#01#, 16#0b#);

      Oid : Oids.Oid_Type;
   begin
      begin
         Oid := Oids.To_Ada (A);

      exception
         when Conversion_Error => null;
      end;

      A.buf  := Unknown (Unknown'First)'Unchecked_Access;
      A.size := Unknown'Length;

      begin
         Oid := Oids.To_Ada (A);

      exception
         when E : Conversion_Error =>
            Assert (Condition => Ada.Exceptions.Exception_Message
                    (E) = "Unsupported OID: 1.3",
                    Message   => "Invalid exception message");
      end;

      A.buf  := Known (Known'First)'Unchecked_Access;
      A.size := Known'Length;

      Oid := Oids.To_Ada (Asn_Oid => A);

      Assert (Condition => Oid = Oids.sha256WithRSAEncryption,
              Message   => "Invalid OID");
   end Convert_Oids;

   -------------------------------------------------------------------------

   procedure Initialize (T : in out Testcase)
   is
   begin
      T.Set_Name (Name => "OID tests");
      T.Add_Test_Routine
        (Routine => Convert_Oids'Access,
         Name    => "Convert ASN.1 to OIDs");
   end Initialize;

end Oid_Tests;
