with Name_h;

package X509.Names
is

   type Asn_Name_Handle is not null access all Name_h.Name_t;

   function To_Ada (Asn_Name : Asn_Name_Handle) return String;
   --  Convert given ASN.1 name structure to string.

end X509.Names;
