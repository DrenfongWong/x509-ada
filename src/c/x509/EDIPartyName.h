/*
 * Generated by asn1c-0.9.23 (http://lionet.info/asn1c)
 * From ASN.1 module "PKIX1Implicit88"
 * 	found in "../../../asn.1/rfc3280-PKIX1Implicit88.asn"
 */

#ifndef	_EDIPartyName_H_
#define	_EDIPartyName_H_


#include <asn_application.h>

/* Including external dependencies */
#include "DirectoryString.h"
#include <constr_SEQUENCE.h>

#ifdef __cplusplus
extern "C" {
#endif

/* Forward declarations */
struct DirectoryString;

/* EDIPartyName */
typedef struct EDIPartyName {
	struct DirectoryString	*nameAssigner	/* OPTIONAL */;
	DirectoryString_t	 partyName;
	
	/* Context for parsing across buffer boundaries */
	asn_struct_ctx_t _asn_ctx;
} EDIPartyName_t;

/* Implementation */
extern asn_TYPE_descriptor_t asn_DEF_EDIPartyName;

#ifdef __cplusplus
}
#endif

/* Referred external types */
#include "DirectoryString.h"

#endif	/* _EDIPartyName_H_ */
#include <asn_internal.h>
