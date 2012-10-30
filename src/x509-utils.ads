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

   function To_Bytes
     (Address : System.Address;
      Size    : Interfaces.C.int)
      return Byte_Array;
   --  Convert buffer given by address and size to byte array.

   function Read_File (Filename : String) return Byte_Array;
   --  Read file contents into byte array.

   IO_Error : exception;

end X509.Utils;
