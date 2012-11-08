--
--  Copyright (C) 2012 secunet Security Networks AG
--  Copyright (C) 2012 Reto Buerki <reet@codelabs.ch>
--
--  This program is free software; you can redistribute it and/or modify it
--  under the terms of the GNU General Public License as published by the
--  Free Software Foundation; either version 2 of the License, or (at your
--  option) any later version.  See <http://www.fsf.org/copyleft/gpl.txt>.
--
--  This program is distributed in the hope that it will be useful, but
--  WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
--  or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
--  for more details.
--
--  As a special exception, if other files instantiate generics from this
--  unit,  or  you  link  this  unit  with  other  files  to  produce  an
--  executable   this  unit  does  not  by  itself  cause  the  resulting
--  executable to  be  covered by the  GNU General  Public License.  This
--  exception does  not  however  invalidate  any  other reasons why  the
--  executable file might be covered by the GNU Public License.
--

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
      organizationName,
      subjectKeyIdentifier,
      keyUsage,
      subjectAltName,
      basicConstraints,
      cRLDistributionPoints,
      authorityKeyIdentifier);
   --  Object identifiers.

   function To_Ada
     (Asn_Oid : OBJECT_IDENTIFIER_h.OBJECT_IDENTIFIER_t)
      return Oid_Type;
   --  Convert given ASN.1 OID structure to Ada OID type.

end X509.Oids;
