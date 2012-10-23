package X509
is

   type Byte is mod 2 ** 8;
   type Byte_Array is array (Positive range <>) of Byte;

   Load_Error : exception;

end X509;
