--
--  Copyright (C) 2012 secunet Security Networks AG
--  Copyright (C) 2012 Reto Buerki <reet@codelabs.ch>
--
--  This program is free software; you can redistribute it and/or modify it
--  under the terms of the GNU General Public License as published by the
--  Free Software Foundation; either version 2 of the License, or (at your
--  option) any later version.  See <http://www.fsf.org/copyleft/gpl.txt>.
--
--  This program is distributed in the hope that it will be useful, but
--  WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
--  or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
--  for more details.
--
--  As a special exception, if other files instantiate generics from this
--  unit,  or  you  link  this  unit  with  other  files  to  produce  an
--  executable   this  unit  does  not  by  itself  cause  the  resulting
--  executable to  be  covered by the  GNU General  Public License.  This
--  exception does  not  however  invalidate  any  other reasons why  the
--  executable file might be covered by the GNU Public License.
--

with Interfaces.C;

with asn_codecs_h;
with ber_decoder_h;

package body X509.Decoder
is

   -------------------------------------------------------------------------

   procedure Decode
     (Type_Descriptor  : TD_Handle;
      Type_Handle_Addr : System.Address;
      Buffer           : System.Address;
      Buffer_Size      : Positive;
      Error_Prefix     : String)
   is
      use type asn_codecs_h.asn_dec_rval_code_e;

      Rval : asn_codecs_h.asn_dec_rval_t;
   begin
      Rval := ber_decoder_h.ber_decode
        (opt_codec_ctx   => null,
         type_descriptor => Type_Descriptor,
         struct_ptr      => Type_Handle_Addr,
         buffer          => Buffer,
         size            => Interfaces.C.unsigned_long (Buffer_Size));

      declare
         Type_Ptr : System.Address;
         for Type_Ptr'Address use Type_Handle_Addr;
      begin
         if Rval.code /= asn_codecs_h.RC_OK then
            Type_Descriptor.free_struct
              (Type_Descriptor.all'Address, Type_Ptr, 0);
            raise Load_Error with Error_Prefix & ": Broken encoding at byte"
              & Rval.consumed'Img;
         end if;
      end;
   end Decode;

end X509.Decoder;
