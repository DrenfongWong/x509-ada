with constr_TYPE_h;

package X509
is

   type Byte is mod 2 ** 8;
   type Byte_Array is array (Positive range <>) of Byte;

   Null_Byte_Array : constant Byte_Array (1 .. 0) := (others => 0);

   type TD_Handle is not null access all constr_TYPE_h.asn_TYPE_descriptor_t;

   Load_Error       : exception;
   Conversion_Error : exception;

end X509;
