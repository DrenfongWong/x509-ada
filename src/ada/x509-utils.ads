with INTEGER_h;

package X509.Utils
is

   function To_Hex_String (Num : INTEGER_h.INTEGER_t) return String;
   --  Return hexadecimal representation of given ASN.1 INTEGER type.

   function Read_File (Filename : String) return Byte_Array;
   --  Read file contents into byte array.

   IO_Error : exception;

end X509.Utils;
