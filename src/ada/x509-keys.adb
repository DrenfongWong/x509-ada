with Interfaces.C.Strings;

with stddef_h;
with ber_decoder_h;
with constraints_h;
with RSAPrivateKey_h;
with RSAPublicKey_h;

with X509.Utils;

package body X509.Keys
is

   use Ada.Strings.Unbounded;

   package C renames Interfaces.C;

   type Privkey_Access is access all RSAPrivateKey_h.RSAPrivateKey_t;
   type Pubkey_Access is access all RSAPublicKey_h.RSAPublicKey_t;

   -------------------------------------------------------------------------

   function Get_Coefficient (Key : RSA_Private_Key_Type) return String
   is
   begin
      return To_String (Key.Coe);
   end Get_Coefficient;

   -------------------------------------------------------------------------

   function Get_Exponent1 (Key : RSA_Private_Key_Type) return String
   is
   begin
      return To_String (Key.Exp1);
   end Get_Exponent1;

   -------------------------------------------------------------------------

   function Get_Exponent2 (Key : RSA_Private_Key_Type) return String
   is
   begin
      return To_String (Key.Exp2);
   end Get_Exponent2;

   -------------------------------------------------------------------------

   function Get_Modulus (Key : RSA_Private_Key_Type) return String
   is
   begin
      return To_String (Key.N);
   end Get_Modulus;

   -------------------------------------------------------------------------

   function Get_Modulus (Key : RSA_Public_Key_Type) return String
   is
   begin
      return To_String (Key.N);
   end Get_Modulus;

   -------------------------------------------------------------------------

   function Get_Prime_P (Key : RSA_Private_Key_Type) return String
   is
   begin
      return To_String (Key.P);
   end Get_Prime_P;

   -------------------------------------------------------------------------

   function Get_Prime_Q (Key : RSA_Private_Key_Type) return String
   is
   begin
      return To_String (Key.Q);
   end Get_Prime_Q;

   -------------------------------------------------------------------------

   function Get_Priv_Exponent (Key : RSA_Private_Key_Type) return String
   is
   begin
      return To_String (Key.D);
   end Get_Priv_Exponent;

   -------------------------------------------------------------------------

   function Get_Pub_Exponent (Key : RSA_Private_Key_Type) return String
   is
   begin
      return To_String (Key.E);
   end Get_Pub_Exponent;

   -------------------------------------------------------------------------

   function Get_Pub_Exponent (Key : RSA_Public_Key_Type) return String
   is
   begin
      return To_String (Key.E);
   end Get_Pub_Exponent;

   -------------------------------------------------------------------------

   function Get_Size (Key : RSA_Private_Key_Type) return Natural
   is
   begin
      return Key.Size;
   end Get_Size;

   -------------------------------------------------------------------------

   function Get_Size (Key : RSA_Public_Key_Type) return Natural
   is
   begin
      return Key.Size;
   end Get_Size;

   -------------------------------------------------------------------------

   procedure Load
     (Filename :     String;
      Key      : out RSA_Private_Key_Type)
   is
      use type C.int;
      use type asn_codecs_h.asn_dec_rval_code_e;

      Data   : Privkey_Access;
      Rval   : asn_codecs_h.asn_dec_rval_t;
      Buffer : Byte_Array := Utils.Read_File (Filename);
   begin
      Rval := ber_decoder_h.ber_decode
        (opt_codec_ctx   => null,
         type_descriptor => RSAPrivateKey_h.asn_DEF_RSAPrivateKey'Access,
         struct_ptr      => Data'Address,
         buffer          => Buffer'Address,
         size            => C.unsigned_long (Buffer'Length));

      if Rval.code /= asn_codecs_h.RC_OK then
         RSAPrivateKey_h.asn_DEF_RSAPrivateKey.free_struct
           (RSAPrivateKey_h.asn_DEF_RSAPrivateKey'Address,
            Data.all'Address, 0);
         raise Load_Error with "Unable to load private key '" & Filename
           & "' : Broken encoding at byte" & Rval.consumed'Img;
      end if;

      Check_Constraints :
      declare
         Null_Buffer : constant C.char_array (1 .. 128)
           := (others => C.nul);
         Err_Buffer  : aliased C.char_array := Null_Buffer;
         Err_Len     : aliased stddef_h.size_t
           := stddef_h.size_t (Err_Buffer'Length);
      begin
         if constraints_h.asn_check_constraints
           (type_descriptor => RSAPrivateKey_h.asn_DEF_RSAPrivateKey'Access,
            struct_ptr      => Data.all'Address,
            errbuf          => C.Strings.To_Chars_Ptr
              (Item => Err_Buffer'Unchecked_Access),
            errlen          => Err_Len'Access) = -1
         then
            raise Load_Error with "Constraint validation failed for '"
              & Filename & "' : " & C.To_Ada (Err_Buffer);
         end if;
      end Check_Constraints;

      Key.Size := Positive (Data.modulus.size - 1) * 8;
      Key.N    := To_Unbounded_String
        (Utils.To_Hex_String (Address => Data.modulus.buf.all'Address,
                              Size    => Data.modulus.size));
      Key.E    := To_Unbounded_String
        (Utils.To_Hex_String (Address => Data.publicExponent.buf.all'Address,
                              Size    => Data.publicExponent.size));
      Key.D    := To_Unbounded_String
        (Utils.To_Hex_String (Address => Data.privateExponent.buf.all'Address,
                              Size    => Data.privateExponent.size));
      Key.P    := To_Unbounded_String
        (Utils.To_Hex_String (Address => Data.prime1.buf.all'Address,
                              Size    => Data.prime1.size));
      Key.Q    := To_Unbounded_String
        (Utils.To_Hex_String (Address => Data.prime2.buf.all'Address,
                              Size    => Data.prime2.size));
      Key.Exp1 := To_Unbounded_String
        (Utils.To_Hex_String (Address => Data.exponent1.buf.all'Address,
                              Size    => Data.exponent1.size));
      Key.Exp2 := To_Unbounded_String
        (Utils.To_Hex_String (Address => Data.exponent2.buf.all'Address,
                              Size    => Data.exponent2.size));
      Key.Coe  := To_Unbounded_String
        (Utils.To_Hex_String (Address => Data.coefficient.buf.all'Address,
                              Size    => Data.coefficient.size));

      RSAPrivateKey_h.asn_DEF_RSAPrivateKey.free_struct
        (RSAPrivateKey_h.asn_DEF_RSAPrivateKey'Address,
         Data.all'Address, 0);
   end Load;

   -------------------------------------------------------------------------

   procedure Load
     (Address :     System.Address;
      Size    :     Positive;
      Key     : out RSA_Public_Key_Type)
   is
      use type C.int;
      use type asn_codecs_h.asn_dec_rval_code_e;

      Data : Pubkey_Access;
      Rval : asn_codecs_h.asn_dec_rval_t;
   begin
      Rval := ber_decoder_h.ber_decode
        (opt_codec_ctx   => null,
         type_descriptor => RSAPublicKey_h.asn_DEF_RSAPublicKey'Access,
         struct_ptr      => Data'Address,
         buffer          => Address,
         size            => C.unsigned_long (Size));

      if Rval.code /= asn_codecs_h.RC_OK then
         RSAPublicKey_h.asn_DEF_RSAPublicKey.free_struct
           (RSAPublicKey_h.asn_DEF_RSAPublicKey'Address,
            Data.all'Address, 0);
         raise Load_Error with "Unable to load public key from buffer"
           & ": Broken encoding at byte" & Rval.consumed'Img;
      end if;

      Check_Constraints :
      declare
         Null_Buffer : constant C.char_array (1 .. 128)
           := (others => C.nul);
         Err_Buffer  : aliased C.char_array := Null_Buffer;
         Err_Len     : aliased stddef_h.size_t
           := stddef_h.size_t (Err_Buffer'Length);
      begin
         if constraints_h.asn_check_constraints
           (type_descriptor => RSAPublicKey_h.asn_DEF_RSAPublicKey'Access,
            struct_ptr      => Data.all'Address,
            errbuf          => C.Strings.To_Chars_Ptr
              (Item => Err_Buffer'Unchecked_Access),
            errlen          => Err_Len'Access) = -1
         then
            raise Load_Error with "Public key constraint validation failed"
              & ": " & C.To_Ada (Err_Buffer);
         end if;
      end Check_Constraints;

      Key.Size := Positive (Data.modulus.size - 1) * 8;
      Key.N    := To_Unbounded_String
        (Utils.To_Hex_String (Address => Data.modulus.buf.all'Address,
                              Size    => Data.modulus.size));
      Key.E    := To_Unbounded_String
        (Utils.To_Hex_String (Address => Data.publicExponent.buf.all'Address,
                              Size    => Data.publicExponent.size));

      RSAPublicKey_h.asn_DEF_RSAPublicKey.free_struct
        (RSAPublicKey_h.asn_DEF_RSAPublicKey'Address,
         Data.all'Address, 0);
   end Load;

end X509.Keys;
