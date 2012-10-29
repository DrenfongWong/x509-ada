/*
 * Generated by asn1c-0.9.23 (http://lionet.info/asn1c)
 * From ASN.1 module "PKIX1Implicit88"
 * 	found in "../../../asn.1/rfc5280-PKIX1Implicit88.asn"
 */

#ifndef	_PrivateKeyUsagePeriod_H_
#define	_PrivateKeyUsagePeriod_H_


#include <asn_application.h>

/* Including external dependencies */
#include <GeneralizedTime.h>
#include <constr_SEQUENCE.h>

#ifdef __cplusplus
extern "C" {
#endif

/* PrivateKeyUsagePeriod */
typedef struct PrivateKeyUsagePeriod {
	GeneralizedTime_t	*notBefore	/* OPTIONAL */;
	GeneralizedTime_t	*notAfter	/* OPTIONAL */;
	
	/* Context for parsing across buffer boundaries */
	asn_struct_ctx_t _asn_ctx;
} PrivateKeyUsagePeriod_t;

/* Implementation */
extern asn_TYPE_descriptor_t asn_DEF_PrivateKeyUsagePeriod;

#ifdef __cplusplus
}
#endif

#endif	/* _PrivateKeyUsagePeriod_H_ */
#include <asn_internal.h>
