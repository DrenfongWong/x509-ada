with Extensions_h;

package X509.Extensions
is

   function Is_Ca (Asn_Ext : access Extensions_h.Extensions) return Boolean;
   --  Returns True if given certificate extensions contain a X509v3 basic
   --  constraint (CA) which is set to True.

end X509.Extensions;
