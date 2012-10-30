with Interfaces.C; use Interfaces.C;
with RDNSequence_h;
with constr_TYPE_h;

package Name_h is

   type Name_PR is 
     (Name_PR_NOTHING,
      Name_PR_rdnSequence);
   pragma Convention (C, Name_PR);  -- ../../c/x509/Name.h:22

   type Name_u (discr : unsigned := 0) is record
      case discr is
         when others =>
            rdnSequence : aliased RDNSequence_h.RDNSequence_t;  -- ../../c/x509/Name.h:31
      end case;
   end record;
   pragma Convention (C_Pass_By_Copy, Name_u);
   pragma Unchecked_Union (Name_u);
   type Name is record
      present : aliased Name_PR;  -- ../../c/x509/Name.h:29
      choice : Name_u;  -- ../../c/x509/Name.h:32
      u_asn_ctx : aliased constr_TYPE_h.asn_struct_ctx_t;  -- ../../c/x509/Name.h:35
   end record;
   pragma Convention (C_Pass_By_Copy, Name);  -- ../../c/x509/Name.h:28

   subtype Name_t is Name;

   asn_DEF_Name : aliased constr_TYPE_h.asn_TYPE_descriptor_t;  -- ../../c/x509/Name.h:39
   pragma Import (C, asn_DEF_Name, "asn_DEF_Name");

end Name_h;
