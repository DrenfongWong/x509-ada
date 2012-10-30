with System;

package X509.Constraints
is

   procedure Check
     (Type_Descriptor : TD_Handle;
      Address         : System.Address;
      Error_Prefix    : String);
   --  Perform constraint checks for ASN.1 type identified by type descriptor
   --  and buffer address. If the check fails, the procedure raises an
   --  exception starting with Error_Prefix and frees the memory allocated by
   --  the type.

   Validation_Error : exception;

end X509.Constraints;
