/*
 * Generated by asn1c-0.9.23 (http://lionet.info/asn1c)
 * From ASN.1 module "PKIX1Implicit88"
 * 	found in "../../../asn.1/rfc5280-PKIX1Implicit88.asn"
 */

#ifndef	_SubjectDirectoryAttributes_H_
#define	_SubjectDirectoryAttributes_H_


#include <asn_application.h>

/* Including external dependencies */
#include <asn_SEQUENCE_OF.h>
#include <constr_SEQUENCE_OF.h>

#ifdef __cplusplus
extern "C" {
#endif

/* Forward declarations */
struct Attribute;

/* SubjectDirectoryAttributes */
typedef struct SubjectDirectoryAttributes {
	A_SEQUENCE_OF(struct Attribute) list;
	
	/* Context for parsing across buffer boundaries */
	asn_struct_ctx_t _asn_ctx;
} SubjectDirectoryAttributes_t;

/* Implementation */
extern asn_TYPE_descriptor_t asn_DEF_SubjectDirectoryAttributes;

#ifdef __cplusplus
}
#endif

/* Referred external types */
#include "Attribute.h"

#endif	/* _SubjectDirectoryAttributes_H_ */
#include <asn_internal.h>
