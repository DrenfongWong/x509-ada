/*
 * Generated by asn1c-0.9.23 (http://lionet.info/asn1c)
 * From ASN.1 module "PKIX1Explicit88"
 * 	found in "../../../asn.1/rfc3280-PKIX1Explicit88.asn"
 */

#ifndef	_AttributeType_H_
#define	_AttributeType_H_


#include <asn_application.h>

/* Including external dependencies */
#include <OBJECT_IDENTIFIER.h>

#ifdef __cplusplus
extern "C" {
#endif

/* AttributeType */
typedef OBJECT_IDENTIFIER_t	 AttributeType_t;

/* Implementation */
extern asn_TYPE_descriptor_t asn_DEF_AttributeType;
asn_struct_free_f AttributeType_free;
asn_struct_print_f AttributeType_print;
asn_constr_check_f AttributeType_constraint;
ber_type_decoder_f AttributeType_decode_ber;
der_type_encoder_f AttributeType_encode_der;
xer_type_decoder_f AttributeType_decode_xer;
xer_type_encoder_f AttributeType_encode_xer;

#ifdef __cplusplus
}
#endif

#endif	/* _AttributeType_H_ */
#include <asn_internal.h>
