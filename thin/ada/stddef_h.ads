with Interfaces.C; use Interfaces.C;

package stddef_h is

   --  unsupported macro: NULL __null
   --  arg-macro: procedure offsetof (TYPE, MEMBER)
   --    __builtin_offsetof (TYPE, MEMBER)
   subtype size_t is unsigned_long;  -- /usr/lib/gcc/x86_64-linux-gnu/4.7/include/stddef.h:213

   subtype ptrdiff_t is long;  -- /usr/lib/gcc/x86_64-linux-gnu/4.7/include/stddef.h:150

end stddef_h;
