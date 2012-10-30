/*
 * Generated by asn1c-0.9.23 (http://lionet.info/asn1c)
 * From ASN.1 module "PKIX1Explicit88"
 * 	found in "../../../asn.1/rfc5280-PKIX1Explicit88.asn"
 */

#ifndef	_RDNSequence_H_
#define	_RDNSequence_H_


#include <asn_application.h>

/* Including external dependencies */
#include <asn_SEQUENCE_OF.h>
#include <constr_SEQUENCE_OF.h>

#ifdef __cplusplus
extern "C" {
#endif

/* Forward declarations */
struct RelativeDistinguishedName;

/* RDNSequence */
typedef struct RDNSequence {
	A_SEQUENCE_OF(struct RelativeDistinguishedName) list;
	
	/* Context for parsing across buffer boundaries */
	asn_struct_ctx_t _asn_ctx;
} RDNSequence_t;

/* Implementation */
extern asn_TYPE_descriptor_t asn_DEF_RDNSequence;

#ifdef __cplusplus
}
#endif

/* Referred external types */
#include "RelativeDistinguishedName.h"

#endif	/* _RDNSequence_H_ */
#include <asn_internal.h>