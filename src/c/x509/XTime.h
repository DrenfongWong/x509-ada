/*
 * Generated by asn1c-0.9.23 (http://lionet.info/asn1c)
 * From ASN.1 module "PKIX1Explicit88"
 * 	found in "../../../asn.1/rfc5280-PKIX1Explicit88.asn"
 */

#ifndef	_XTime_H_
#define	_XTime_H_


#include <asn_application.h>

/* Including external dependencies */
#include <UTCTime.h>
#include <GeneralizedTime.h>
#include <constr_CHOICE.h>

#ifdef __cplusplus
extern "C" {
#endif

/* Dependencies */
typedef enum XTime_PR {
	XTime_PR_NOTHING,	/* No components present */
	XTime_PR_utcTime,
	XTime_PR_generalTime
} XTime_PR;

/* XTime */
typedef struct XTime {
	XTime_PR present;
	union XTime_u {
		UTCTime_t	 utcTime;
		GeneralizedTime_t	 generalTime;
	} choice;
	
	/* Context for parsing across buffer boundaries */
	asn_struct_ctx_t _asn_ctx;
} XTime_t;

/* Implementation */
extern asn_TYPE_descriptor_t asn_DEF_XTime;

#ifdef __cplusplus
}
#endif

#endif	/* _XTime_H_ */
#include <asn_internal.h>
