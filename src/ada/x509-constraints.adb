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
         raise Constraints_Error with Error_Prefix & ": "
           & C.To_Ada (Err_Buffer);
      end if;
   end Check;

end X509.Constraints;
