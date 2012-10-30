with Interfaces.C; use Interfaces.C;
with asn_codecs_prim_h;
with constr_TYPE_h;
with System;
with stddef_h;
with Interfaces.C.Strings;
with ber_tlv_tag_h;
with asn_codecs_h;
with xer_encoder_h;
with stdint_h;
with stdio_h;

package OBJECT_IDENTIFIER_h is

   subtype OBJECT_IDENTIFIER_t is asn_codecs_prim_h.ASN_u_PRIMITIVE_TYPE_s;

   asn_DEF_OBJECT_IDENTIFIER : aliased constr_TYPE_h.asn_TYPE_descriptor_t;  -- ../../c/common/OBJECT_IDENTIFIER.h:18
   pragma Import (C, asn_DEF_OBJECT_IDENTIFIER, "asn_DEF_OBJECT_IDENTIFIER");

   function OBJECT_IDENTIFIER_print
     (arg1 : System.Address;
      arg2 : System.Address;
      arg3 : int;
      arg4 : access function
        (arg1 : System.Address;
         arg2 : stddef_h.size_t;
         arg3 : System.Address) return int;
      arg5 : System.Address) return int;  -- ../../c/common/OBJECT_IDENTIFIER.h:20
   pragma Import (C, OBJECT_IDENTIFIER_print, "OBJECT_IDENTIFIER_print");

   function OBJECT_IDENTIFIER_constraint
     (arg1 : access constr_TYPE_h.asn_TYPE_descriptor_s;
      arg2 : System.Address;
      arg3 : access procedure
        (arg1 : System.Address;
         arg2 : access constr_TYPE_h.asn_TYPE_descriptor_s;
         arg3 : System.Address;
         arg4 : Interfaces.C.Strings.chars_ptr  -- , ...
         );
      arg4 : System.Address) return int;  -- ../../c/common/OBJECT_IDENTIFIER.h:21
   pragma Import (C, OBJECT_IDENTIFIER_constraint, "OBJECT_IDENTIFIER_constraint");

   function OBJECT_IDENTIFIER_encode_der
     (arg1 : access constr_TYPE_h.asn_TYPE_descriptor_s;
      arg2 : System.Address;
      arg3 : int;
      arg4 : ber_tlv_tag_h.ber_tlv_tag_t;
      arg5 : access function
        (arg1 : System.Address;
         arg2 : stddef_h.size_t;
         arg3 : System.Address) return int;
      arg6 : System.Address) return asn_codecs_h.asn_enc_rval_t;  -- ../../c/common/OBJECT_IDENTIFIER.h:22
   pragma Import (C, OBJECT_IDENTIFIER_encode_der, "OBJECT_IDENTIFIER_encode_der");

   function OBJECT_IDENTIFIER_decode_xer
     (arg1 : access asn_codecs_h.asn_codec_ctx_t;
      arg2 : access constr_TYPE_h.asn_TYPE_descriptor_s;
      arg3 : System.Address;
      arg4 : Interfaces.C.Strings.chars_ptr;
      arg5 : System.Address;
      arg6 : stddef_h.size_t) return asn_codecs_h.asn_dec_rval_t;  -- ../../c/common/OBJECT_IDENTIFIER.h:23
   pragma Import (C, OBJECT_IDENTIFIER_decode_xer, "OBJECT_IDENTIFIER_decode_xer");

   function OBJECT_IDENTIFIER_encode_xer
     (arg1 : access constr_TYPE_h.asn_TYPE_descriptor_s;
      arg2 : System.Address;
      arg3 : int;
      arg4 : xer_encoder_h.xer_encoder_flags_e;
      arg5 : access function
        (arg1 : System.Address;
         arg2 : stddef_h.size_t;
         arg3 : System.Address) return int;
      arg6 : System.Address) return asn_codecs_h.asn_enc_rval_t;  -- ../../c/common/OBJECT_IDENTIFIER.h:24
   pragma Import (C, OBJECT_IDENTIFIER_encode_xer, "OBJECT_IDENTIFIER_encode_xer");

   function OBJECT_IDENTIFIER_get_arcs
     (u_oid : access OBJECT_IDENTIFIER_t;
      u_arcs : System.Address;
      u_arc_type_size : unsigned;
      u_arc_slots : unsigned) return int;  -- ../../c/common/OBJECT_IDENTIFIER.h:71
   pragma Import (C, OBJECT_IDENTIFIER_get_arcs, "OBJECT_IDENTIFIER_get_arcs");

   function OBJECT_IDENTIFIER_set_arcs
     (u_oid : access OBJECT_IDENTIFIER_t;
      u_arcs : System.Address;
      u_arc_type_size : unsigned;
      u_arc_slots : unsigned) return int;  -- ../../c/common/OBJECT_IDENTIFIER.h:86
   pragma Import (C, OBJECT_IDENTIFIER_set_arcs, "OBJECT_IDENTIFIER_set_arcs");

   function OBJECT_IDENTIFIER_print_arc
     (arcbuf : access stdint_h.uint8_t;
      arclen : int;
      add : int;
      cb : access function
        (arg1 : System.Address;
         arg2 : stddef_h.size_t;
         arg3 : System.Address) return int;
      app_key : System.Address) return int;  -- ../../c/common/OBJECT_IDENTIFIER.h:94
   pragma Import (C, OBJECT_IDENTIFIER_print_arc, "OBJECT_IDENTIFIER_print_arc");

   function OBJECT_IDENTIFIER_u_dump_arc
     (arcbuf : access stdint_h.uint8_t;
      arclen : int;
      add : int;
      cb : access function
        (arg1 : System.Address;
         arg2 : stddef_h.size_t;
         arg3 : System.Address) return int;
      app_key : System.Address) return stdio_h.ssize_t;  -- ../../c/common/OBJECT_IDENTIFIER.h:99
   pragma Import (C, OBJECT_IDENTIFIER_u_dump_arc, "OBJECT_IDENTIFIER__dump_arc");

   function OBJECT_IDENTIFIER_parse_arcs
     (oid_text : Interfaces.C.Strings.chars_ptr;
      oid_txt_length : stdio_h.ssize_t;
      arcs : access long;
      arcs_slots : unsigned;
      opt_oid_text_end : System.Address) return int;  -- ../../c/common/OBJECT_IDENTIFIER.h:123
   pragma Import (C, OBJECT_IDENTIFIER_parse_arcs, "OBJECT_IDENTIFIER_parse_arcs");

   function OBJECT_IDENTIFIER_get_single_arc
     (arcbuf : access stdint_h.uint8_t;
      arclen : unsigned;
      add : int;
      value : System.Address;
      value_size : unsigned) return int;  -- ../../c/common/OBJECT_IDENTIFIER.h:130
   pragma Import (C, OBJECT_IDENTIFIER_get_single_arc, "OBJECT_IDENTIFIER_get_single_arc");

   function OBJECT_IDENTIFIER_set_single_arc
     (arcbuf : access stdint_h.uint8_t;
      arcval : System.Address;
      arcval_size : unsigned;
      u_prepared_order : int) return int;  -- ../../c/common/OBJECT_IDENTIFIER.h:132
   pragma Import (C, OBJECT_IDENTIFIER_set_single_arc, "OBJECT_IDENTIFIER_set_single_arc");

end OBJECT_IDENTIFIER_h;
