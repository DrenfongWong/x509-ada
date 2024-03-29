/*
 * Generated by asn1c-0.9.23 (http://lionet.info/asn1c)
 * From ASN.1 module "PKIX1Explicit88"
 * 	found in "../../../asn.1/rfc5280-PKIX1Explicit88.asn"
 */

#ifndef	_ExtensionAttributes_H_
#define	_ExtensionAttributes_H_


#include <asn_application.h>

/* Including external dependencies */
#include <asn_SET_OF.h>
#include <constr_SET_OF.h>

#ifdef __cplusplus
extern "C" {
#endif

/* Forward declarations */
struct ExtensionAttribute;

/* ExtensionAttributes */
typedef struct ExtensionAttributes {
	A_SET_OF(struct ExtensionAttribute) list;
	
	/* Context for parsing across buffer boundaries */
	asn_struct_ctx_t _asn_ctx;
} ExtensionAttributes_t;

/* Implementation */
extern asn_TYPE_descriptor_t asn_DEF_ExtensionAttributes;

#ifdef __cplusplus
}
#endif

/* Referred external types */
#include "ExtensionAttribute.h"

#endif	/* _ExtensionAttributes_H_ */
#include <asn_internal.h>
