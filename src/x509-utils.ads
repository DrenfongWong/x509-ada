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

with Interfaces.C;

package X509.Utils
is

   function To_String
     (Address : System.Address;
      Size    : Interfaces.C.int)
      return String;
   --  Return string representation of buffer with given size starting at
   --  specified address.

   function To_Hex_String
     (Address : System.Address;
      Size    : Interfaces.C.int)
      return String;
   --  Return hexadecimal representation of buffer with given size starting at
   --  specified address.

   function To_Hex_String (Input : Byte_Array) return String;
   --  Return hex string representation of byte array.

   function To_Bytes
     (Address : System.Address;
      Size    : Interfaces.C.int)
      return Byte_Array;
   --  Convert buffer given by address and size to byte array.

   function Read_File (Filename : String) return Byte_Array;
   --  Read file contents into byte array.

   IO_Error : exception;

end X509.Utils;
