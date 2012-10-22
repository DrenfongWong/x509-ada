/*
 * Generated by asn1c-0.9.23 (http://lionet.info/asn1c)
 * From ASN.1 module "PKIX1Explicit88"
 * 	found in "../../../asn.1/rfc3280-PKIX1Explicit88.asn"
 */

#ifndef	_TeletexDomainDefinedAttribute_H_
#define	_TeletexDomainDefinedAttribute_H_


#include <asn_application.h>

/* Including external dependencies */
#include <TeletexString.h>
#include <constr_SEQUENCE.h>

#ifdef __cplusplus
extern "C" {
#endif

/* TeletexDomainDefinedAttribute */
typedef struct TeletexDomainDefinedAttribute {
	TeletexString_t	 type;
	TeletexString_t	 value;
	
	/* Context for parsing across buffer boundaries */
	asn_struct_ctx_t _asn_ctx;
} TeletexDomainDefinedAttribute_t;

/* Implementation */
extern asn_TYPE_descriptor_t asn_DEF_TeletexDomainDefinedAttribute;

#ifdef __cplusplus
}
#endif

#endif	/* _TeletexDomainDefinedAttribute_H_ */
#include <asn_internal.h>
