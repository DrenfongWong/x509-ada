with Interfaces.C; use Interfaces.C;
with BOOLEAN_h;
with INTEGER_h;
with constr_TYPE_h;

package BasicConstraints_h is

   type BasicConstraints is record
      cA : access BOOLEAN_h.BOOLEAN_t;  -- ../../c/x509/BasicConstraints.h:24
      pathLenConstraint : access INTEGER_h.INTEGER_t;  -- ../../c/x509/BasicConstraints.h:25
      u_asn_ctx : aliased constr_TYPE_h.asn_struct_ctx_t;  -- ../../c/x509/BasicConstraints.h:28
   end record;
   pragma Convention (C_Pass_By_Copy, BasicConstraints);  -- ../../c/x509/BasicConstraints.h:23

   subtype BasicConstraints_t is BasicConstraints;

   asn_DEF_BasicConstraints : aliased constr_TYPE_h.asn_TYPE_descriptor_t;  -- ../../c/x509/BasicConstraints.h:32
   pragma Import (C, asn_DEF_BasicConstraints, "asn_DEF_BasicConstraints");

end BasicConstraints_h;
