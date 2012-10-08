/*
 * Generated by asn1c-0.9.23 (http://lionet.info/asn1c)
 * From ASN.1 module "PKCS-1"
 * 	found in "../../../asn.1/pkcs-1v2-1.asn"
 */

#include "RSAPublicKey.h"

static asn_TYPE_member_t asn_MBR_RSAPublicKey_1[] = {
	{ ATF_NOFLAGS, 0, offsetof(struct RSAPublicKey, modulus),
		(ASN_TAG_CLASS_UNIVERSAL | (2 << 2)),
		0,
		&asn_DEF_INTEGER,
		0,	/* Defer constraints checking to the member type */
		0,	/* PER is not compiled, use -gen-PER */
		0,
		"modulus"
		},
	{ ATF_NOFLAGS, 0, offsetof(struct RSAPublicKey, publicExponent),
		(ASN_TAG_CLASS_UNIVERSAL | (2 << 2)),
		0,
		&asn_DEF_INTEGER,
		0,	/* Defer constraints checking to the member type */
		0,	/* PER is not compiled, use -gen-PER */
		0,
		"publicExponent"
		},
};
static ber_tlv_tag_t asn_DEF_RSAPublicKey_tags_1[] = {
	(ASN_TAG_CLASS_UNIVERSAL | (16 << 2))
};
static asn_TYPE_tag2member_t asn_MAP_RSAPublicKey_tag2el_1[] = {
    { (ASN_TAG_CLASS_UNIVERSAL | (2 << 2)), 0, 0, 1 }, /* modulus at 168 */
    { (ASN_TAG_CLASS_UNIVERSAL | (2 << 2)), 1, -1, 0 } /* publicExponent at 170 */
};
static asn_SEQUENCE_specifics_t asn_SPC_RSAPublicKey_specs_1 = {
	sizeof(struct RSAPublicKey),
	offsetof(struct RSAPublicKey, _asn_ctx),
	asn_MAP_RSAPublicKey_tag2el_1,
	2,	/* Count of tags in the map */
	0, 0, 0,	/* Optional elements (not needed) */
	-1,	/* Start extensions */
	-1	/* Stop extensions */
};
asn_TYPE_descriptor_t asn_DEF_RSAPublicKey = {
	"RSAPublicKey",
	"RSAPublicKey",
	SEQUENCE_free,
	SEQUENCE_print,
	SEQUENCE_constraint,
	SEQUENCE_decode_ber,
	SEQUENCE_encode_der,
	SEQUENCE_decode_xer,
	SEQUENCE_encode_xer,
	0, 0,	/* No PER support, use "-gen-PER" to enable */
	0,	/* Use generic outmost tag fetcher */
	asn_DEF_RSAPublicKey_tags_1,
	sizeof(asn_DEF_RSAPublicKey_tags_1)
		/sizeof(asn_DEF_RSAPublicKey_tags_1[0]), /* 1 */
	asn_DEF_RSAPublicKey_tags_1,	/* Same as above */
	sizeof(asn_DEF_RSAPublicKey_tags_1)
		/sizeof(asn_DEF_RSAPublicKey_tags_1[0]), /* 1 */
	0,	/* No PER visible constraints */
	asn_MBR_RSAPublicKey_1,
	2,	/* Elements count */
	&asn_SPC_RSAPublicKey_specs_1	/* Additional specs */
};

