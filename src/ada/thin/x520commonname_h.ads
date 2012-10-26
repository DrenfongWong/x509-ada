with Interfaces.C; use Interfaces.C;
with TeletexString_h;
with PrintableString_h;
with UniversalString_h;
with UTF8String_h;
with BMPString_h;
with constr_TYPE_h;

package X520CommonName_h is

   type X520CommonName_PR is 
     (X520CommonName_PR_NOTHING,
      X520CommonName_PR_teletexString,
      X520CommonName_PR_printableString,
      X520CommonName_PR_universalString,
      X520CommonName_PR_utf8String,
      X520CommonName_PR_bmpString);
   pragma Convention (C, X520CommonName_PR);  -- ../../c/x509/X520CommonName.h:26

   type X520CommonName_u (discr : unsigned := 0) is record
      case discr is
         when 0 =>
            teletexString : aliased TeletexString_h.TeletexString_t;  -- ../../c/x509/X520CommonName.h:39
         when 1 =>
            printableString : aliased PrintableString_h.PrintableString_t;  -- ../../c/x509/X520CommonName.h:40
         when 2 =>
            universalString : aliased UniversalString_h.UniversalString_t;  -- ../../c/x509/X520CommonName.h:41
         when 3 =>
            utf8String : aliased UTF8String_h.UTF8String_t;  -- ../../c/x509/X520CommonName.h:42
         when others =>
            bmpString : aliased BMPString_h.BMPString_t;  -- ../../c/x509/X520CommonName.h:43
      end case;
   end record;
   pragma Convention (C_Pass_By_Copy, X520CommonName_u);
   pragma Unchecked_Union (X520CommonName_u);
   type X520CommonName is record
      present : aliased X520CommonName_PR;  -- ../../c/x509/X520CommonName.h:37
      choice : X520CommonName_u;  -- ../../c/x509/X520CommonName.h:44
      u_asn_ctx : aliased constr_TYPE_h.asn_struct_ctx_t;  -- ../../c/x509/X520CommonName.h:47
   end record;
   pragma Convention (C_Pass_By_Copy, X520CommonName);  -- ../../c/x509/X520CommonName.h:36

   subtype X520CommonName_t is X520CommonName;

   asn_DEF_X520CommonName : aliased constr_TYPE_h.asn_TYPE_descriptor_t;  -- ../../c/x509/X520CommonName.h:51
   pragma Import (C, asn_DEF_X520CommonName, "asn_DEF_X520CommonName");

end X520CommonName_h;
