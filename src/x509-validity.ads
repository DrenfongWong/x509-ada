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

with Ada.Calendar;

with Validity_h;

package X509.Validity
is

   type Validity_Type is private;
   --  Certificate validity period.

   Null_Validity : constant Validity_Type;
   --  Null validity constant (= invalid).

   function Get_Start (V : Validity_Type) return Ada.Calendar.Time;
   --  Return start of validity period.

   function Get_End (V : Validity_Type) return Ada.Calendar.Time;
   --  Return end of validity period.

   function Is_Valid (V : Validity_Type) return Boolean;
   --  Returns True if the current time lies in the validity period.

   function To_Ada (Asn_Validity : Validity_h.Validity_t) return Validity_Type;
   --  Convert given ASN.1 validity structure to Ada Validity_Type.

private

   type Validity_Type is record
      Not_Before : Ada.Calendar.Time;
      Not_After  : Ada.Calendar.Time;
   end record;

   Null_Validity : constant Validity_Type := (others => <>);

end X509.Validity;
