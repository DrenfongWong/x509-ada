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

with stddef_h;
with constraints_h;

with Interfaces.C.Strings;

package body X509.Constraints
is

   package C renames Interfaces.C;

   -------------------------------------------------------------------------

   procedure Check
     (Type_Descriptor : TD_Handle;
      Address         : System.Address;
      Error_Prefix    : String)
   is
      use type C.int;

      Null_Buffer : constant C.char_array (1 .. 128) := (others => C.nul);
      Err_Buffer  : aliased C.char_array             := Null_Buffer;
      Err_Len     : aliased stddef_h.size_t          := stddef_h.size_t
        (Err_Buffer'Length);
   begin
      if constraints_h.asn_check_constraints
        (type_descriptor => Type_Descriptor,
         struct_ptr      => Address,
         errbuf          => C.Strings.To_Chars_Ptr
           (Item => Err_Buffer'Unchecked_Access),
         errlen          => Err_Len'Access) = -1
      then
         Type_Descriptor.free_struct
           (Type_Descriptor.all'Address, Address, 0);
         raise Validation_Error with Error_Prefix & ": "
           & C.To_Ada (Err_Buffer);
      end if;
   end Check;

end X509.Constraints;
