/*
 * Generated by asn1c-0.9.23 (http://lionet.info/asn1c)
 * From ASN.1 module "PKIX1Implicit88"
 * 	found in "../../../asn.1/rfc5280-PKIX1Implicit88.asn"
 */

#include "UserNotice.h"

static asn_TYPE_member_t asn_MBR_UserNotice_1[] = {
	{ ATF_POINTER, 2, offsetof(struct UserNotice, noticeRef),
		(ASN_TAG_CLASS_UNIVERSAL | (16 << 2)),
		0,
		&asn_DEF_NoticeReference,
		0,	/* Defer constraints checking to the member type */
		0,	/* PER is not compiled, use -gen-PER */
		0,
		"noticeRef"
		},
	{ ATF_POINTER, 1, offsetof(struct UserNotice, explicitText),
		-1 /* Ambiguous tag (CHOICE?) */,
		0,
		&asn_DEF_DisplayText,
		0,	/* Defer constraints checking to the member type */
		0,	/* PER is not compiled, use -gen-PER */
		0,
		"explicitText"
		},
};
static ber_tlv_tag_t asn_DEF_UserNotice_tags_1[] = {
	(ASN_TAG_CLASS_UNIVERSAL | (16 << 2))
};
static asn_TYPE_tag2member_t asn_MAP_UserNotice_tag2el_1[] = {
    { (ASN_TAG_CLASS_UNIVERSAL | (12 << 2)), 1, 0, 0 }, /* utf8String at 134 */
    { (ASN_TAG_CLASS_UNIVERSAL | (16 << 2)), 0, 0, 0 }, /* noticeRef at 123 */
    { (ASN_TAG_CLASS_UNIVERSAL | (22 << 2)), 1, 0, 0 }, /* ia5String at 131 */
    { (ASN_TAG_CLASS_UNIVERSAL | (26 << 2)), 1, 0, 0 }, /* visibleString at 132 */
    { (ASN_TAG_CLASS_UNIVERSAL | (30 << 2)), 1, 0, 0 } /* bmpString at 133 */
};
static asn_SEQUENCE_specifics_t asn_SPC_UserNotice_specs_1 = {
	sizeof(struct UserNotice),
	offsetof(struct UserNotice, _asn_ctx),
	asn_MAP_UserNotice_tag2el_1,
	5,	/* Count of tags in the map */
	0, 0, 0,	/* Optional elements (not needed) */
	-1,	/* Start extensions */
	-1	/* Stop extensions */
};
asn_TYPE_descriptor_t asn_DEF_UserNotice = {
	"UserNotice",
	"UserNotice",
	SEQUENCE_free,
	SEQUENCE_print,
	SEQUENCE_constraint,
	SEQUENCE_decode_ber,
	SEQUENCE_encode_der,
	SEQUENCE_decode_xer,
	SEQUENCE_encode_xer,
	0, 0,	/* No PER support, use "-gen-PER" to enable */
	0,	/* Use generic outmost tag fetcher */
	asn_DEF_UserNotice_tags_1,
	sizeof(asn_DEF_UserNotice_tags_1)
		/sizeof(asn_DEF_UserNotice_tags_1[0]), /* 1 */
	asn_DEF_UserNotice_tags_1,	/* Same as above */
	sizeof(asn_DEF_UserNotice_tags_1)
		/sizeof(asn_DEF_UserNotice_tags_1[0]), /* 1 */
	0,	/* No PER visible constraints */
	asn_MBR_UserNotice_1,
	2,	/* Elements count */
	&asn_SPC_UserNotice_specs_1	/* Additional specs */
};

