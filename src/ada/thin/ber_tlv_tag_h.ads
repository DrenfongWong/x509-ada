with Interfaces.C; use Interfaces.C;
with Interfaces.C.Strings;
with stddef_h;
with stdio_h;
with System;

package ber_tlv_tag_h is

   --  arg-macro: function BER_TAG_CLASS (tag)
   --    return (tag) and 0x3;
   --  arg-macro: function BER_TAG_VALUE (tag)
   --    return (tag) >> 2;
   --  arg-macro: function BER_TLV_CONSTRUCTED (tagptr)
   --    return ((*(const uint8_t *)tagptr)and0x20)?1:0;
   --  arg-macro: function BER_TAGS_EQUAL (tag1, tag2)
   --    return (tag1) = (tag2);
   type asn_tag_class is
     (ASN_TAG_CLASS_UNIVERSAL,
      ASN_TAG_CLASS_APPLICATION,
      ASN_TAG_CLASS_CONTEXT,
      ASN_TAG_CLASS_PRIVATE);
   pragma Convention (C, asn_tag_class);  -- ../../c/pkcs1/ber_tlv_tag.h:12

   subtype ber_tlv_tag_t is unsigned;  -- ../../c/pkcs1/ber_tlv_tag.h:18

   function ber_tlv_tag_snprint
     (tag : ber_tlv_tag_t;
      buf : Interfaces.C.Strings.chars_ptr;
      buflen : stddef_h.size_t) return stdio_h.ssize_t;  -- ../../c/pkcs1/ber_tlv_tag.h:34
   pragma Import (C, ber_tlv_tag_snprint, "ber_tlv_tag_snprint");

   function ber_tlv_tag_fwrite (tag : ber_tlv_tag_t; arg2 : access stdio_h.FILE) return stdio_h.ssize_t;  -- ../../c/pkcs1/ber_tlv_tag.h:35
   pragma Import (C, ber_tlv_tag_fwrite, "ber_tlv_tag_fwrite");

   function ber_tlv_tag_string (tag : ber_tlv_tag_t) return Interfaces.C.Strings.chars_ptr;  -- ../../c/pkcs1/ber_tlv_tag.h:36
   pragma Import (C, ber_tlv_tag_string, "ber_tlv_tag_string");

   function ber_fetch_tag
     (bufptr : System.Address;
      size : stddef_h.size_t;
      tag_r : access ber_tlv_tag_t) return stdio_h.ssize_t;  -- ../../c/pkcs1/ber_tlv_tag.h:46
   pragma Import (C, ber_fetch_tag, "ber_fetch_tag");

   function ber_tlv_tag_serialize
     (tag : ber_tlv_tag_t;
      bufptr : System.Address;
      size : stddef_h.size_t) return stddef_h.size_t;  -- ../../c/pkcs1/ber_tlv_tag.h:54
   pragma Import (C, ber_tlv_tag_serialize, "ber_tlv_tag_serialize");

end ber_tlv_tag_h;
