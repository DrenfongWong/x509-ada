with Ada.Calendar.Conversions;

with System;

with Interfaces.C;

with time_h;

with UTCTime_h;
with GeneralizedTime_h;
with XTime_h;

package body X509.Validity
is

   function To_Ada (Asn_Time : XTime_h.XTime) return Ada.Calendar.Time;
   --  Convert given ASN.1 time to Ada calendar time.

   -------------------------------------------------------------------------

   function Get_End (V : Validity_Type) return Ada.Calendar.Time
   is
   begin
      return V.Not_After;
   end Get_End;

   -------------------------------------------------------------------------

   function Get_Start (V : Validity_Type) return Ada.Calendar.Time
   is
   begin
      return V.Not_Before;
   end Get_Start;

   -------------------------------------------------------------------------

   function Is_Valid (V : Validity_Type) return Boolean
   is
      use Ada.Calendar;

      Now : constant Time := Clock;
   begin
      return V.Not_Before < Now and then Now < V.Not_After;
   end Is_Valid;

   -------------------------------------------------------------------------

   function To_Ada (Asn_Time : XTime_h.XTime) return Ada.Calendar.Time
   is
      use XTime_h;
      use type Interfaces.C.long;

      T : time_h.time_t;
   begin
      case Asn_Time.present is
         when XTime_PR_utcTime =>
            T := UTCTime_h.asn_UT2time
              (arg1               => Asn_Time.choice.utcTime'Address,
               u_optional_tm4fill => System.Null_Address,
               as_gmt             => 0);
         when XTime_PR_generalTime =>
            T := GeneralizedTime_h.asn_GT2time
              (arg1               => Asn_Time.choice.generalTime'Address,
               u_optional_tm4fill => System.Null_Address,
               as_gmt             => 0);
         when others =>
            raise Conversion_Error with "Invalid time: "
              & Asn_Time.present'Img;
      end case;

      if T = -1 then
         raise Conversion_Error with "Unable to convert invalid time";
      end if;

      return Ada.Calendar.Conversions.To_Ada_Time (Unix_Time => T);
   end To_Ada;

   -------------------------------------------------------------------------

   function To_Ada (Asn_Validity : Validity_h.Validity_t) return Validity_Type
   is
      V : Validity_Type;
   begin
      V.Not_Before := To_Ada (Asn_Time => Asn_Validity.notBefore);
      V.Not_After  := To_Ada (Asn_Time => Asn_Validity.notAfter);
      return V;
   end To_Ada;

end X509.Validity;
