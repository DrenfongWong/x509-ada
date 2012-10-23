with Interfaces.C; use Interfaces.C;
with stdint_h;
with constr_TYPE_h;
with System;
with stddef_h;
with asn_codecs_h;
with ber_tlv_tag_h;
with xer_encoder_h;

package ANY_h is

   --  arg-macro: procedure ANY_fromBuf (s, buf, size)
   --    OCTET_STRING_fromBuf((s), (buf), (size))
   --  arg-macro: procedure ANY_new_fromBuf (buf, size)
   --    OCTET_STRING_new_fromBuf( andasn_DEF_ANY, (buf), (size))
   type ANY is record
      buf : access stdint_h.uint8_t;  -- ../../c/common/ANY.h:15
      size : aliased int;  -- ../../c/common/ANY.h:16
      u_asn_ctx : aliased constr_TYPE_h.asn_struct_ctx_t;  -- ../../c/common/ANY.h:18
   end record;
   pragma Convention (C_Pass_By_Copy, ANY);  -- ../../c/common/ANY.h:14

   subtype ANY_t is ANY;

   asn_DEF_ANY : aliased constr_TYPE_h.asn_TYPE_descriptor_t;  -- ../../c/common/ANY.h:21
   pragma Import (C, asn_DEF_ANY, "asn_DEF_ANY");

   procedure ANY_free
     (arg1 : System.Address;
      arg2 : System.Address;
      arg3 : int);  -- ../../c/common/ANY.h:23
   pragma Import (C, ANY_free, "ANY_free");

   function ANY_print
     (arg1 : System.Address;
      arg2 : System.Address;
      arg3 : int;
      arg4 : access function
        (arg1 : System.Address;
         arg2 : stddef_h.size_t;
         arg3 : System.Address) return int;
      arg5 : System.Address) return int;  -- ../../c/common/ANY.h:24
   pragma Import (C, ANY_print, "ANY_print");

   function ANY_decode_ber
     (arg1 : access asn_codecs_h.asn_codec_ctx_s;
      arg2 : access constr_TYPE_h.asn_TYPE_descriptor_s;
      arg3 : System.Address;
      arg4 : System.Address;
      arg5 : stddef_h.size_t;
      arg6 : int) return asn_codecs_h.asn_dec_rval_t;  -- ../../c/common/ANY.h:25
   pragma Import (C, ANY_decode_ber, "ANY_decode_ber");

   function ANY_encode_der
     (arg1 : access constr_TYPE_h.asn_TYPE_descriptor_s;
      arg2 : System.Address;
      arg3 : int;
      arg4 : ber_tlv_tag_h.ber_tlv_tag_t;
      arg5 : access function
        (arg1 : System.Address;
         arg2 : stddef_h.size_t;
         arg3 : System.Address) return int;
      arg6 : System.Address) return asn_codecs_h.asn_enc_rval_t;  -- ../../c/common/ANY.h:26
   pragma Import (C, ANY_encode_der, "ANY_encode_der");

   function ANY_encode_xer
     (arg1 : access constr_TYPE_h.asn_TYPE_descriptor_s;
      arg2 : System.Address;
      arg3 : int;
      arg4 : xer_encoder_h.xer_encoder_flags_e;
      arg5 : access function
        (arg1 : System.Address;
         arg2 : stddef_h.size_t;
         arg3 : System.Address) return int;
      arg6 : System.Address) return asn_codecs_h.asn_enc_rval_t;  -- ../../c/common/ANY.h:27
   pragma Import (C, ANY_encode_xer, "ANY_encode_xer");

   function ANY_fromType
     (arg1 : access ANY_t;
      td : access constr_TYPE_h.asn_TYPE_descriptor_t;
      struct_ptr : System.Address) return int;  -- ../../c/common/ANY.h:34
   pragma Import (C, ANY_fromType, "ANY_fromType");

   function ANY_new_fromType (td : access constr_TYPE_h.asn_TYPE_descriptor_t; struct_ptr : System.Address) return access ANY_t;  -- ../../c/common/ANY.h:35
   pragma Import (C, ANY_new_fromType, "ANY_new_fromType");

   function ANY_to_type
     (arg1 : access ANY_t;
      td : access constr_TYPE_h.asn_TYPE_descriptor_t;
      struct_ptr : System.Address) return int;  -- ../../c/common/ANY.h:38
   pragma Import (C, ANY_to_type, "ANY_to_type");

end ANY_h;
