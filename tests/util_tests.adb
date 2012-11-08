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

with X509.Utils;

package body Util_Tests
is

   use Ahven;
   use X509;

   -------------------------------------------------------------------------

   procedure Initialize (T : in out Testcase)
   is
   begin
      T.Set_Name (Name => "Util tests");
      T.Add_Test_Routine
        (Routine => Read_Files'Access,
         Name    => "Read files");
   end Initialize;

   -------------------------------------------------------------------------

   procedure Read_Files
   is
   begin
      declare
         Content : constant Byte_Array := Utils.Read_File
           (Filename => "data/file");
      begin
         Assert (Condition => Content = (97, 98, 99, 10),
                 Message   => "Content mismatch");
      end;

      begin
         declare
            Dummy : constant Byte_Array := Utils.Read_File
              (Filename => "/invalid/key/test");
            pragma Unreferenced (Dummy);
         begin
            Fail (Message => "Exception expected");
         end;

      exception
         when Utils.IO_Error => null;
      end;
   end Read_Files;

end Util_Tests;
