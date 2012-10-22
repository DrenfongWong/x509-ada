/*
 * Generated by asn1c-0.9.23 (http://lionet.info/asn1c)
 * From ASN.1 module "PKIX1Explicit88"
 * 	found in "../../../asn.1/rfc3280-PKIX1Explicit88.asn"
 */

#include "TBSCertList.h"

static asn_TYPE_member_t asn_MBR_Member_8[] = {
	{ ATF_NOFLAGS, 0, offsetof(struct Member, userCertificate),
		(ASN_TAG_CLASS_UNIVERSAL | (2 << 2)),
		0,
		&asn_DEF_CertificateSerialNumber,
		0,	/* Defer constraints checking to the member type */
		0,	/* PER is not compiled, use -gen-PER */
		0,
		"userCertificate"
		},
	{ ATF_NOFLAGS, 0, offsetof(struct Member, revocationDate),
		-1 /* Ambiguous tag (CHOICE?) */,
		0,
		&asn_DEF_XTime,
		0,	/* Defer constraints checking to the member type */
		0,	/* PER is not compiled, use -gen-PER */
		0,
		"revocationDate"
		},
	{ ATF_POINTER, 1, offsetof(struct Member, crlEntryExtensions),
		(ASN_TAG_CLASS_UNIVERSAL | (16 << 2)),
		0,
		&asn_DEF_Extensions,
		0,	/* Defer constraints checking to the member type */
		0,	/* PER is not compiled, use -gen-PER */
		0,
		"crlEntryExtensions"
		},
};
static ber_tlv_tag_t asn_DEF_Member_tags_8[] = {
	(ASN_TAG_CLASS_UNIVERSAL | (16 << 2))
};
static asn_TYPE_tag2member_t asn_MAP_Member_tag2el_8[] = {
    { (ASN_TAG_CLASS_UNIVERSAL | (2 << 2)), 0, 0, 0 }, /* userCertificate at 338 */
    { (ASN_TAG_CLASS_UNIVERSAL | (16 << 2)), 2, 0, 0 }, /* crlEntryExtensions at 340 */
    { (ASN_TAG_CLASS_UNIVERSAL | (23 << 2)), 1, 0, 0 }, /* utcTime at 302 */
    { (ASN_TAG_CLASS_UNIVERSAL | (24 << 2)), 1, 0, 0 } /* generalTime at 303 */
};
static asn_SEQUENCE_specifics_t asn_SPC_Member_specs_8 = {
	sizeof(struct Member),
	offsetof(struct Member, _asn_ctx),
	asn_MAP_Member_tag2el_8,
	4,	/* Count of tags in the map */
	0, 0, 0,	/* Optional elements (not needed) */
	-1,	/* Start extensions */
	-1	/* Stop extensions */
};
static /* Use -fall-defs-global to expose */
asn_TYPE_descriptor_t asn_DEF_Member_8 = {
	"SEQUENCE",
	"SEQUENCE",
	SEQUENCE_free,
	SEQUENCE_print,
	SEQUENCE_constraint,
	SEQUENCE_decode_ber,
	SEQUENCE_encode_der,
	SEQUENCE_decode_xer,
	SEQUENCE_encode_xer,
	0, 0,	/* No PER support, use "-gen-PER" to enable */
	0,	/* Use generic outmost tag fetcher */
	asn_DEF_Member_tags_8,
	sizeof(asn_DEF_Member_tags_8)
		/sizeof(asn_DEF_Member_tags_8[0]), /* 1 */
	asn_DEF_Member_tags_8,	/* Same as above */
	sizeof(asn_DEF_Member_tags_8)
		/sizeof(asn_DEF_Member_tags_8[0]), /* 1 */
	0,	/* No PER visible constraints */
	asn_MBR_Member_8,
	3,	/* Elements count */
	&asn_SPC_Member_specs_8	/* Additional specs */
};

static asn_TYPE_member_t asn_MBR_revokedCertificates_7[] = {
	{ ATF_POINTER, 0, 0,
		(ASN_TAG_CLASS_UNIVERSAL | (16 << 2)),
		0,
		&asn_DEF_Member_8,
		0,	/* Defer constraints checking to the member type */
		0,	/* PER is not compiled, use -gen-PER */
		0,
		""
		},
};
static ber_tlv_tag_t asn_DEF_revokedCertificates_tags_7[] = {
	(ASN_TAG_CLASS_UNIVERSAL | (16 << 2))
};
static asn_SET_OF_specifics_t asn_SPC_revokedCertificates_specs_7 = {
	sizeof(struct revokedCertificates),
	offsetof(struct revokedCertificates, _asn_ctx),
	0,	/* XER encoding is XMLDelimitedItemList */
};
static /* Use -fall-defs-global to expose */
asn_TYPE_descriptor_t asn_DEF_revokedCertificates_7 = {
	"revokedCertificates",
	"revokedCertificates",
	SEQUENCE_OF_free,
	SEQUENCE_OF_print,
	SEQUENCE_OF_constraint,
	SEQUENCE_OF_decode_ber,
	SEQUENCE_OF_encode_der,
	SEQUENCE_OF_decode_xer,
	SEQUENCE_OF_encode_xer,
	0, 0,	/* No PER support, use "-gen-PER" to enable */
	0,	/* Use generic outmost tag fetcher */
	asn_DEF_revokedCertificates_tags_7,
	sizeof(asn_DEF_revokedCertificates_tags_7)
		/sizeof(asn_DEF_revokedCertificates_tags_7[0]), /* 1 */
	asn_DEF_revokedCertificates_tags_7,	/* Same as above */
	sizeof(asn_DEF_revokedCertificates_tags_7)
		/sizeof(asn_DEF_revokedCertificates_tags_7[0]), /* 1 */
	0,	/* No PER visible constraints */
	asn_MBR_revokedCertificates_7,
	1,	/* Single element */
	&asn_SPC_revokedCertificates_specs_7	/* Additional specs */
};

static asn_TYPE_member_t asn_MBR_TBSCertList_1[] = {
	{ ATF_POINTER, 1, offsetof(struct TBSCertList, version),
		(ASN_TAG_CLASS_UNIVERSAL | (2 << 2)),
		0,
		&asn_DEF_XVersion,
		0,	/* Defer constraints checking to the member type */
		0,	/* PER is not compiled, use -gen-PER */
		0,
		"version"
		},
	{ ATF_NOFLAGS, 0, offsetof(struct TBSCertList, signature),
		(ASN_TAG_CLASS_UNIVERSAL | (16 << 2)),
		0,
		&asn_DEF_XAlgorithmIdentifier,
		0,	/* Defer constraints checking to the member type */
		0,	/* PER is not compiled, use -gen-PER */
		0,
		"signature"
		},
	{ ATF_NOFLAGS, 0, offsetof(struct TBSCertList, issuer),
		-1 /* Ambiguous tag (CHOICE?) */,
		0,
		&asn_DEF_Name,
		0,	/* Defer constraints checking to the member type */
		0,	/* PER is not compiled, use -gen-PER */
		0,
		"issuer"
		},
	{ ATF_NOFLAGS, 0, offsetof(struct TBSCertList, thisUpdate),
		-1 /* Ambiguous tag (CHOICE?) */,
		0,
		&asn_DEF_XTime,
		0,	/* Defer constraints checking to the member type */
		0,	/* PER is not compiled, use -gen-PER */
		0,
		"thisUpdate"
		},
	{ ATF_POINTER, 3, offsetof(struct TBSCertList, nextUpdate),
		-1 /* Ambiguous tag (CHOICE?) */,
		0,
		&asn_DEF_XTime,
		0,	/* Defer constraints checking to the member type */
		0,	/* PER is not compiled, use -gen-PER */
		0,
		"nextUpdate"
		},
	{ ATF_POINTER, 2, offsetof(struct TBSCertList, revokedCertificates),
		(ASN_TAG_CLASS_UNIVERSAL | (16 << 2)),
		0,
		&asn_DEF_revokedCertificates_7,
		0,	/* Defer constraints checking to the member type */
		0,	/* PER is not compiled, use -gen-PER */
		0,
		"revokedCertificates"
		},
	{ ATF_POINTER, 1, offsetof(struct TBSCertList, crlExtensions),
		(ASN_TAG_CLASS_CONTEXT | (0 << 2)),
		+1,	/* EXPLICIT tag at current level */
		&asn_DEF_Extensions,
		0,	/* Defer constraints checking to the member type */
		0,	/* PER is not compiled, use -gen-PER */
		0,
		"crlExtensions"
		},
};
static ber_tlv_tag_t asn_DEF_TBSCertList_tags_1[] = {
	(ASN_TAG_CLASS_UNIVERSAL | (16 << 2))
};
static asn_TYPE_tag2member_t asn_MAP_TBSCertList_tag2el_1[] = {
    { (ASN_TAG_CLASS_UNIVERSAL | (2 << 2)), 0, 0, 0 }, /* version at 331 */
    { (ASN_TAG_CLASS_UNIVERSAL | (16 << 2)), 1, 0, 2 }, /* signature at 333 */
    { (ASN_TAG_CLASS_UNIVERSAL | (16 << 2)), 2, -1, 1 }, /* rdnSequence at 248 */
    { (ASN_TAG_CLASS_UNIVERSAL | (16 << 2)), 5, -2, 0 }, /* revokedCertificates at 342 */
    { (ASN_TAG_CLASS_UNIVERSAL | (23 << 2)), 3, 0, 1 }, /* utcTime at 302 */
    { (ASN_TAG_CLASS_UNIVERSAL | (23 << 2)), 4, -1, 0 }, /* utcTime at 302 */
    { (ASN_TAG_CLASS_UNIVERSAL | (24 << 2)), 3, 0, 1 }, /* generalTime at 303 */
    { (ASN_TAG_CLASS_UNIVERSAL | (24 << 2)), 4, -1, 0 }, /* generalTime at 303 */
    { (ASN_TAG_CLASS_CONTEXT | (0 << 2)), 6, 0, 0 } /* crlExtensions at 343 */
};
static asn_SEQUENCE_specifics_t asn_SPC_TBSCertList_specs_1 = {
	sizeof(struct TBSCertList),
	offsetof(struct TBSCertList, _asn_ctx),
	asn_MAP_TBSCertList_tag2el_1,
	9,	/* Count of tags in the map */
	0, 0, 0,	/* Optional elements (not needed) */
	-1,	/* Start extensions */
	-1	/* Stop extensions */
};
asn_TYPE_descriptor_t asn_DEF_TBSCertList = {
	"TBSCertList",
	"TBSCertList",
	SEQUENCE_free,
	SEQUENCE_print,
	SEQUENCE_constraint,
	SEQUENCE_decode_ber,
	SEQUENCE_encode_der,
	SEQUENCE_decode_xer,
	SEQUENCE_encode_xer,
	0, 0,	/* No PER support, use "-gen-PER" to enable */
	0,	/* Use generic outmost tag fetcher */
	asn_DEF_TBSCertList_tags_1,
	sizeof(asn_DEF_TBSCertList_tags_1)
		/sizeof(asn_DEF_TBSCertList_tags_1[0]), /* 1 */
	asn_DEF_TBSCertList_tags_1,	/* Same as above */
	sizeof(asn_DEF_TBSCertList_tags_1)
		/sizeof(asn_DEF_TBSCertList_tags_1[0]), /* 1 */
	0,	/* No PER visible constraints */
	asn_MBR_TBSCertList_1,
	7,	/* Elements count */
	&asn_SPC_TBSCertList_specs_1	/* Additional specs */
};

