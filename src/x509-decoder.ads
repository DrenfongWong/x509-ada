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

with System;

package X509.Decoder
is

   procedure Decode
     (Type_Descriptor  : TD_Handle;
      Type_Handle_Addr : System.Address;
      Buffer           : System.Address;
      Buffer_Size      : Positive;
      Error_Prefix     : String);
   --  Decode ASN.1 type identified by type descriptor and buffer address. The
   --  type will be decoded to the address given by Type_Handle_Addr (which
   --  must be the address of an access type pointing to the concrete ASN.1
   --  type). The procedure raises an exception starting with Error_Prefix if
   --  the type cannot be decoded.

end X509.Decoder;
