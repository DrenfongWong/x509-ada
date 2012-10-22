/*
 * Generated by asn1c-0.9.23 (http://lionet.info/asn1c)
 * From ASN.1 module "PKIX1Explicit88"
 * 	found in "../../../asn.1/rfc3280-PKIX1Explicit88.asn"
 */

#ifndef	_PDSParameter_H_
#define	_PDSParameter_H_


#include <asn_application.h>

/* Including external dependencies */
#include <PrintableString.h>
#include <TeletexString.h>
#include <constr_SET.h>

#ifdef __cplusplus
extern "C" {
#endif

/* Dependencies */

/*
 * Method of determining the components presence
 */
typedef enum PDSParameter_PR {
	PDSParameter_PR_printable_string,	/* Member printable_string is present */
	PDSParameter_PR_teletex_string,	/* Member teletex_string is present */
} PDSParameter_PR;

/* PDSParameter */
typedef struct PDSParameter {
	PrintableString_t	*printable_string	/* OPTIONAL */;
	TeletexString_t	*teletex_string	/* OPTIONAL */;
	
	/* Presence bitmask: ASN_SET_ISPRESENT(pPDSParameter, PDSParameter_PR_x) */
	unsigned int _presence_map
		[((2+(8*sizeof(unsigned int))-1)/(8*sizeof(unsigned int)))];
	
	/* Context for parsing across buffer boundaries */
	asn_struct_ctx_t _asn_ctx;
} PDSParameter_t;

/* Implementation */
extern asn_TYPE_descriptor_t asn_DEF_PDSParameter;

#ifdef __cplusplus
}
#endif

#endif	/* _PDSParameter_H_ */
#include <asn_internal.h>
