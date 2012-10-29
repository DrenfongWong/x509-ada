with Interfaces.C; use Interfaces.C;
with TeletexString_h;
with PrintableString_h;
with UniversalString_h;
with UTF8String_h;
with BMPString_h;
with constr_TYPE_h;

package X520OrganizationalUnitName_h is

   type X520OrganizationalUnitName_PR is 
     (X520OrganizationalUnitName_PR_NOTHING,
      X520OrganizationalUnitName_PR_teletexString,
      X520OrganizationalUnitName_PR_printableString,
      X520OrganizationalUnitName_PR_universalString,
      X520OrganizationalUnitName_PR_utf8String,
      X520OrganizationalUnitName_PR_bmpString);
   pragma Convention (C, X520OrganizationalUnitName_PR);  -- ../../c/x509/X520OrganizationalUnitName.h:26

   type X520OrganizationalUnitName_u (discr : unsigned := 0) is record
      case discr is
         when 0 =>
            teletexString : aliased TeletexString_h.TeletexString_t;  -- ../../c/x509/X520OrganizationalUnitName.h:39
         when 1 =>
            printableString : aliased PrintableString_h.PrintableString_t;  -- ../../c/x509/X520OrganizationalUnitName.h:40
         when 2 =>
            universalString : aliased UniversalString_h.UniversalString_t;  -- ../../c/x509/X520OrganizationalUnitName.h:41
         when 3 =>
            utf8String : aliased UTF8String_h.UTF8String_t;  -- ../../c/x509/X520OrganizationalUnitName.h:42
         when others =>
            bmpString : aliased BMPString_h.BMPString_t;  -- ../../c/x509/X520OrganizationalUnitName.h:43
      end case;
   end record;
   pragma Convention (C_Pass_By_Copy, X520OrganizationalUnitName_u);
   pragma Unchecked_Union (X520OrganizationalUnitName_u);
   type X520OrganizationalUnitName is record
      present : aliased X520OrganizationalUnitName_PR;  -- ../../c/x509/X520OrganizationalUnitName.h:37
      choice : X520OrganizationalUnitName_u;  -- ../../c/x509/X520OrganizationalUnitName.h:44
      u_asn_ctx : aliased constr_TYPE_h.asn_struct_ctx_t;  -- ../../c/x509/X520OrganizationalUnitName.h:47
   end record;
   pragma Convention (C_Pass_By_Copy, X520OrganizationalUnitName);  -- ../../c/x509/X520OrganizationalUnitName.h:36

   subtype X520OrganizationalUnitName_t is X520OrganizationalUnitName;

   asn_DEF_X520OrganizationalUnitName : aliased constr_TYPE_h.asn_TYPE_descriptor_t;  -- ../../c/x509/X520OrganizationalUnitName.h:51
   pragma Import (C, asn_DEF_X520OrganizationalUnitName, "asn_DEF_X520OrganizationalUnitName");

end X520OrganizationalUnitName_h;
