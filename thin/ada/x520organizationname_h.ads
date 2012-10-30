with Interfaces.C; use Interfaces.C;
with TeletexString_h;
with PrintableString_h;
with UniversalString_h;
with UTF8String_h;
with BMPString_h;
with constr_TYPE_h;

package X520OrganizationName_h is

   type X520OrganizationName_PR is 
     (X520OrganizationName_PR_NOTHING,
      X520OrganizationName_PR_teletexString,
      X520OrganizationName_PR_printableString,
      X520OrganizationName_PR_universalString,
      X520OrganizationName_PR_utf8String,
      X520OrganizationName_PR_bmpString);
   pragma Convention (C, X520OrganizationName_PR);  -- ../../c/x509/X520OrganizationName.h:26

   type X520OrganizationName_u (discr : unsigned := 0) is record
      case discr is
         when 0 =>
            teletexString : aliased TeletexString_h.TeletexString_t;  -- ../../c/x509/X520OrganizationName.h:39
         when 1 =>
            printableString : aliased PrintableString_h.PrintableString_t;  -- ../../c/x509/X520OrganizationName.h:40
         when 2 =>
            universalString : aliased UniversalString_h.UniversalString_t;  -- ../../c/x509/X520OrganizationName.h:41
         when 3 =>
            utf8String : aliased UTF8String_h.UTF8String_t;  -- ../../c/x509/X520OrganizationName.h:42
         when others =>
            bmpString : aliased BMPString_h.BMPString_t;  -- ../../c/x509/X520OrganizationName.h:43
      end case;
   end record;
   pragma Convention (C_Pass_By_Copy, X520OrganizationName_u);
   pragma Unchecked_Union (X520OrganizationName_u);
   type X520OrganizationName is record
      present : aliased X520OrganizationName_PR;  -- ../../c/x509/X520OrganizationName.h:37
      choice : X520OrganizationName_u;  -- ../../c/x509/X520OrganizationName.h:44
      u_asn_ctx : aliased constr_TYPE_h.asn_struct_ctx_t;  -- ../../c/x509/X520OrganizationName.h:47
   end record;
   pragma Convention (C_Pass_By_Copy, X520OrganizationName);  -- ../../c/x509/X520OrganizationName.h:36

   subtype X520OrganizationName_t is X520OrganizationName;

   asn_DEF_X520OrganizationName : aliased constr_TYPE_h.asn_TYPE_descriptor_t;  -- ../../c/x509/X520OrganizationName.h:51
   pragma Import (C, asn_DEF_X520OrganizationName, "asn_DEF_X520OrganizationName");

end X520OrganizationName_h;
