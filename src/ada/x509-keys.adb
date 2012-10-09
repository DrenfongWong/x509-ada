with Ada.Direct_IO;
with Ada.Exceptions;

with Interfaces.C.Strings;

with stddef_h;
with ber_decoder_h;
with constraints_h;
with RSAPrivateKey_h;

with X509.Utils;

package body X509.Keys
is

   use Ada.Strings.Unbounded;

   package C renames Interfaces.C;
   package D_IO is new Ada.Direct_IO (Element_Type => Byte);

   type Key_Access is access all RSAPrivateKey_h.RSAPrivateKey_t;

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

   procedure Load
     (Filename :     String;
      Key      : out RSA_Private_Key_Type)
   is
      Data : Key_Access;
      File : D_IO.File_Type;
      Size : D_IO.Count;
   begin
      begin
         D_IO.Open (File => File,
                    Mode => D_IO.In_File,
                    Name => Filename);
         Size := D_IO.Size (File => File);

      exception
         when E : others =>
            raise Load_Error with "Unable to load key '" & Filename & "' : "
              & Ada.Exceptions.Exception_Message (E);
      end;

      declare
         use type asn_codecs_h.asn_dec_rval_code_e;

         Rval   : asn_codecs_h.asn_dec_rval_t;
         Buffer : Byte_Array (1 .. Integer (Size)) := (others => 0);
      begin
         for I in Buffer'Range loop
            D_IO.Read (File => File,
                       Item => Buffer (I));
         end loop;
         D_IO.Close (File => File);

         Rval := ber_decoder_h.ber_decode
           (opt_codec_ctx   => null,
            type_descriptor => RSAPrivateKey_h.asn_DEF_RSAPrivateKey'Access,
            struct_ptr      => Data'Address,
            buffer          => Buffer'Address,
            size            => C.unsigned_long (Size));

         if Rval.code /= asn_codecs_h.RC_OK then
            RSAPrivateKey_h.asn_DEF_RSAPrivateKey.free_struct
              (RSAPrivateKey_h.asn_DEF_RSAPrivateKey'Address,
               Data.all'Address, 0);
            raise Load_Error with "Unable to load key '" & Filename
              & "' : Broken key encoding at byte" & Rval.consumed'Img;
         end if;

         Check_Constraints :
         declare
            use type C.int;

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

         Key.N    := To_Unbounded_String
           (Utils.To_Hex_String (Num => Data.modulus));
         Key.E    := To_Unbounded_String
           (Utils.To_Hex_String (Num => Data.publicExponent));
         Key.D    := To_Unbounded_String
           (Utils.To_Hex_String (Num => Data.privateExponent));
         Key.P    := To_Unbounded_String
           (Utils.To_Hex_String (Num => Data.prime1));
         Key.Q    := To_Unbounded_String
           (Utils.To_Hex_String (Num => Data.prime2));
         Key.Exp1 := To_Unbounded_String
           (Utils.To_Hex_String (Num => Data.exponent1));
         Key.Exp2 := To_Unbounded_String
           (Utils.To_Hex_String (Num => Data.exponent2));
         Key.Coe  := To_Unbounded_String
           (Utils.To_Hex_String (Num => Data.coefficient));

         RSAPrivateKey_h.asn_DEF_RSAPrivateKey.free_struct
           (RSAPrivateKey_h.asn_DEF_RSAPrivateKey'Address,
            Data.all'Address, 0);
      end;
   end Load;

end X509.Keys;
