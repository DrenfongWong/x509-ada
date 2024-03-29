/*
 * Generated by asn1c-0.9.23 (http://lionet.info/asn1c)
 * From ASN.1 module "PKCS-1"
 * 	found in "../../../asn.1/pkcs-1v2-1.asn"
 */

#ifndef	_RSAPrivateKey_H_
#define	_RSAPrivateKey_H_


#include <asn_application.h>

/* Including external dependencies */
#include "Version.h"
#include <INTEGER.h>
#include <constr_SEQUENCE.h>

#ifdef __cplusplus
extern "C" {
#endif

/* Forward declarations */
struct OtherPrimeInfos;

/* RSAPrivateKey */
typedef struct RSAPrivateKey {
	Version_t	 version;
	INTEGER_t	 modulus;
	INTEGER_t	 publicExponent;
	INTEGER_t	 privateExponent;
	INTEGER_t	 prime1;
	INTEGER_t	 prime2;
	INTEGER_t	 exponent1;
	INTEGER_t	 exponent2;
	INTEGER_t	 coefficient;
	struct OtherPrimeInfos	*otherPrimeInfos	/* OPTIONAL */;
	
	/* Context for parsing across buffer boundaries */
	asn_struct_ctx_t _asn_ctx;
} RSAPrivateKey_t;

/* Implementation */
extern asn_TYPE_descriptor_t asn_DEF_RSAPrivateKey;

#ifdef __cplusplus
}
#endif

/* Referred external types */
#include "OtherPrimeInfos.h"

#endif	/* _RSAPrivateKey_H_ */
#include <asn_internal.h>
