/*
 * Generated by asn1c-0.9.23 (http://lionet.info/asn1c)
 * From ASN.1 module "PKIX1Explicit88"
 * 	found in "../../../asn.1/rfc3280-PKIX1Explicit88.asn"
 */

#ifndef	_UniqueIdentifier_H_
#define	_UniqueIdentifier_H_


#include <asn_application.h>

/* Including external dependencies */
#include <BIT_STRING.h>

#ifdef __cplusplus
extern "C" {
#endif

/* UniqueIdentifier */
typedef BIT_STRING_t	 UniqueIdentifier_t;

/* Implementation */
extern asn_TYPE_descriptor_t asn_DEF_UniqueIdentifier;
asn_struct_free_f UniqueIdentifier_free;
asn_struct_print_f UniqueIdentifier_print;
asn_constr_check_f UniqueIdentifier_constraint;
ber_type_decoder_f UniqueIdentifier_decode_ber;
der_type_encoder_f UniqueIdentifier_encode_der;
xer_type_decoder_f UniqueIdentifier_decode_xer;
xer_type_encoder_f UniqueIdentifier_encode_xer;

#ifdef __cplusplus
}
#endif

#endif	/* _UniqueIdentifier_H_ */
#include <asn_internal.h>
