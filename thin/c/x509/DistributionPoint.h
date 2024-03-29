/*
 * Generated by asn1c-0.9.23 (http://lionet.info/asn1c)
 * From ASN.1 module "PKIX1Implicit88"
 * 	found in "../../../asn.1/rfc5280-PKIX1Implicit88.asn"
 */

#ifndef	_DistributionPoint_H_
#define	_DistributionPoint_H_


#include <asn_application.h>

/* Including external dependencies */
#include "ReasonFlags.h"
#include <constr_SEQUENCE.h>

#ifdef __cplusplus
extern "C" {
#endif

/* Forward declarations */
struct DistributionPointName;
struct GeneralNames;

/* DistributionPoint */
typedef struct DistributionPoint {
	struct DistributionPointName	*distributionPoint	/* OPTIONAL */;
	ReasonFlags_t	*reasons	/* OPTIONAL */;
	struct GeneralNames	*cRLIssuer	/* OPTIONAL */;
	
	/* Context for parsing across buffer boundaries */
	asn_struct_ctx_t _asn_ctx;
} DistributionPoint_t;

/* Implementation */
extern asn_TYPE_descriptor_t asn_DEF_DistributionPoint;

#ifdef __cplusplus
}
#endif

/* Referred external types */
#include "DistributionPointName.h"
#include "GeneralNames.h"

#endif	/* _DistributionPoint_H_ */
#include <asn_internal.h>
