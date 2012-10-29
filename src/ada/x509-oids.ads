with OBJECT_IDENTIFIER_h;

package X509.Oids
is
   type Oid_Type is
     (Undefined,

      --  RFC 3447

      rsaEncryption,

      --  RFC 4055

      sha1WithRSAEncryption,
      sha256WithRSAEncryption,

      --  RFC 5280

      commonName,
      countryName,
      organizationalUnitName,
      organizationName);
   --  Object identifiers.

   function To_Ada
     (Asn_Oid : access OBJECT_IDENTIFIER_h.OBJECT_IDENTIFIER_t)
      return Oid_Type;
   --  Convert given ASN.1 OID structure to Ada OID type.

end X509.Oids;
