with OBJECT_IDENTIFIER_h;

package X509.Oids
is
   type Oid_Type is
     (Undefined,

      --  RFC 3447

      rsaEncryption,

      --  RFC 4055

      sha1WithRSAEncryption,
      sha256WithRSAEncryption);
   --  Object identifiers.

   type Asn_Oid_Handle is not null access
     all OBJECT_IDENTIFIER_h.OBJECT_IDENTIFIER_t;

   function To_Ada (Asn_Oid : Asn_Oid_Handle) return Oid_Type;
   --  Convert given ASN.1 OID structure to Ada OID type.

   Conversion_Error : exception;

end X509.Oids;
