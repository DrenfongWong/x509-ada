with System;

package X509.Decoder
is

   procedure Decode
     (Type_Descriptor  : TD_Handle;
      Type_Handle_Addr : System.Address;
      Buffer           : System.Address;
      Buffer_Size      : Integer;
      Error_Prefix     : String);
   --  Decode ASN.1 type identified by type descriptor and buffer address. The
   --  type will be decoded to the address given by Type_Handle_Addr (which
   --  must be the address of an access type pointing to the concrete ASN.1
   --  type). The procedure raises an exception starting with Error_Prefix if
   --  the type cannot be decoded.

end X509.Decoder;
