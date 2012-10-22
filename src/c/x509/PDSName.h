/*
 * Generated by asn1c-0.9.23 (http://lionet.info/asn1c)
 * From ASN.1 module "PKIX1Explicit88"
 * 	found in "../../../asn.1/rfc3280-PKIX1Explicit88.asn"
 */

#ifndef	_PDSName_H_
#define	_PDSName_H_


#include <asn_application.h>

/* Including external dependencies */
#include <PrintableString.h>

#ifdef __cplusplus
extern "C" {
#endif

/* PDSName */
typedef PrintableString_t	 PDSName_t;

/* Implementation */
extern asn_TYPE_descriptor_t asn_DEF_PDSName;
asn_struct_free_f PDSName_free;
asn_struct_print_f PDSName_print;
asn_constr_check_f PDSName_constraint;
ber_type_decoder_f PDSName_decode_ber;
der_type_encoder_f PDSName_encode_der;
xer_type_decoder_f PDSName_decode_xer;
xer_type_encoder_f PDSName_encode_xer;

#ifdef __cplusplus
}
#endif

#endif	/* _PDSName_H_ */
#include <asn_internal.h>
