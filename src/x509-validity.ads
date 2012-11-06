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
