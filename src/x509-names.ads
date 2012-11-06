with Name_h;

package X509.Names
is

   function To_Ada (Asn_Name : Name_h.Name_t) return String;
   --  Convert given ASN.1 name structure to string.

end X509.Names;
