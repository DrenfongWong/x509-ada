with Interfaces.C; use Interfaces.C;
with System;
limited with RelativeDistinguishedName_h;
with constr_TYPE_h;

package RDNSequence_h is

   type RDNSequence;
   type anon_33 is record
      c_array : System.Address;  -- ../../c/x509/RDNSequence.h:26
      count : aliased int;  -- ../../c/x509/RDNSequence.h:26
      size : aliased int;  -- ../../c/x509/RDNSequence.h:26
      free : access procedure (arg1 : access RelativeDistinguishedName_h.RelativeDistinguishedName);  -- ../../c/x509/RDNSequence.h:26
   end record;
   pragma Convention (C_Pass_By_Copy, anon_33);
   type RDNSequence is record
      list : aliased anon_33;  -- ../../c/x509/RDNSequence.h:26
      u_asn_ctx : aliased constr_TYPE_h.asn_struct_ctx_t;  -- ../../c/x509/RDNSequence.h:29
   end record;
   pragma Convention (C_Pass_By_Copy, RDNSequence);  -- ../../c/x509/RDNSequence.h:25

   subtype RDNSequence_t is RDNSequence;

   asn_DEF_RDNSequence : aliased constr_TYPE_h.asn_TYPE_descriptor_t;  -- ../../c/x509/RDNSequence.h:33
   pragma Import (C, asn_DEF_RDNSequence, "asn_DEF_RDNSequence");

end RDNSequence_h;
