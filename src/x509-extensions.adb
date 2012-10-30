with System.Storage_Elements;

with Interfaces.C;

with BOOLEAN_h;
with Extension_h;
with BasicConstraints_h;

with X509.Oids;
with X509.Decoder;
with X509.Constraints;

package body X509.Extensions
is

   package C renames Interfaces.C;

   function Decode_Basic_Constraints
     (Buffer : System.Address;
      Size   : Positive)
      return Boolean;
   --  Decode and check basicConstraints.

   -------------------------------------------------------------------------

   function Decode_Basic_Constraints
     (Buffer : System.Address;
      Size   : Positive)
      return Boolean
   is
      use BasicConstraints_h;
      use type BOOLEAN_h.BOOLEAN_t;

      type Constraint_Access is access all BasicConstraints_t;

      Data : Constraint_Access;
   begin
      Decoder.Decode
        (Type_Descriptor  => asn_DEF_BasicConstraints'Access,
         Type_Handle_Addr => Data'Address,
         Buffer           => Buffer,
         Buffer_Size      => Size,
         Error_Prefix     => "BasicConstraints decoding failed");
      Constraints.Check
        (Type_Descriptor => asn_DEF_BasicConstraints'Access,
         Address         => Data.all'Address,
         Error_Prefix    => "BasicConstraints validation failed");

      return Status : constant Boolean := Data.cA /= null
        and then Data.cA.all /= 0
      do
         asn_DEF_BasicConstraints.free_struct
           (asn_DEF_BasicConstraints'Address, Data.all'Address, 0);
      end return;
   end Decode_Basic_Constraints;

   -------------------------------------------------------------------------

   function Is_Ca (Asn_Ext : access Extensions_h.Extensions) return Boolean
   is
      use type C.int;

      Count : constant C.int := Asn_Ext.list.count;
   begin
      if Count = 0 then
         raise Conversion_Error with "Unable to convert empty extensions";
      end if;

      for I in 0 .. Count - 1 loop
         declare
            use System.Storage_Elements;
            use type Oids.Oid_Type;

            E_Addr : System.Address;
            for E_Addr'Address use Asn_Ext.list.c_array + Storage_Offset
              (I * (System.Word_Size / 8));
            E      : Extension_h.Extension_t;
            for E'Address use E_Addr;
            pragma Import (Ada, E);

            Oid : constant Oids.Oid_Type := Oids.To_Ada
              (Asn_Oid => E.extnID'Access);
         begin
            if Oid = Oids.basicConstraints then
               return Decode_Basic_Constraints
                 (Buffer => E.extnValue.buf.all'Address,
                  Size   => Positive (E.extnValue.size));
            end if;
            if E.critical.all /= 0 then
               raise Conversion_Error with "Unsupported critical extension "
                 & Oid'Img;
            end if;
         end;
      end loop;

      return False;
   end Is_Ca;

end X509.Extensions;
