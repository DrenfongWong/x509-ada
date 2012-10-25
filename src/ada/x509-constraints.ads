with System;

with constr_TYPE_h;

package X509.Constraints
is

   type TD_Handle is not null access all constr_TYPE_h.asn_TYPE_descriptor_t;

   procedure Check
     (Type_Descriptor : TD_Handle;
      Address         : System.Address;
      Error_Prefix    : String);
   --  Perform constraint checks for ASN.1 type identified by type descriptor
   --  and buffer address. If the check fails, the procedure raises an
   --  exception and frees the memory allocated by the type.

   Constraints_Error : exception;

end X509.Constraints;
