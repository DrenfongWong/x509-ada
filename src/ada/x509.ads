with constr_TYPE_h;

package X509
is

   type Byte is mod 2 ** 8;
   type Byte_Array is array (Positive range <>) of Byte;

   Load_Error : exception;

   type TD_Handle is not null access all constr_TYPE_h.asn_TYPE_descriptor_t;

end X509;
