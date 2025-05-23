--
--  File Name:         MessagePkg.vhd
--  Design Unit Name:  MessagePkg
--  Revision:          STANDARD VERSION,  revision 2014.01
--
--  Maintainer:        Jim Lewis      email:  jim@synthworks.com
--  Contributor(s):
--     Jim Lewis          SynthWorks
--
--
--  Package Defines
--      Data structure for multi-line name/message to be associated with a data structure. 
--
--  Developed for:
--        SynthWorks Design Inc.
--        VHDL Training Classes
--        11898 SW 128th Ave.  Tigard, Or  97223
--        http://www.SynthWorks.com
--
--  Latest standard version available at:
--        http://www.SynthWorks.com/downloads
--
--  Revision History:
--    Date      Version    Description
--    06/2010:  0.1        Initial revision
--    07/2014:  2014.07    Moved specialization required by CoveragePkg to CoveragePkg
--
--
--  Copyright (c) 2010 - 2014 by SynthWorks Design Inc.  All rights reserved.
--
--  Verbatim copies of this source file may be used and
--  distributed without restriction.
--
--  This source file is free software; you can redistribute it
--  and/or modify it under the terms of the ARTISTIC License
--  as published by The Perl Foundation; either version 2.0 of
--  the License, or (at your option) any later version.
--
--  This source is distributed in the hope that it will be
--  useful, but WITHOUT ANY WARRANTY; without even the implied
--  warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
--  PURPOSE. See the Artistic License for details.
--
--  You should have received a copy of the license with this source.
--  If not download it from,
--     http://www.perlfoundation.org/artistic_license_2_0
--

library ieee ;
use ieee.std_logic_1164.all ;
use ieee.numeric_std.all ;
use ieee.math_real.all ;
use std.textio.all ;

package MessagePkg is

  type MessagePType is protected

    procedure Set (MessageIn : String) ;
    impure function Get (ItemNumber : integer := 1) return string ; 
    impure function GetCount return integer ; 
    impure function IsSet return boolean ; 
    procedure Clear ; -- clear message
    procedure Deallocate ; -- clear message
        
  end protected MessagePType ;

end package MessagePkg ;
package body MessagePkg is

  -- Local Data Structure Types
  type LineArrayType is array (natural range <>) of line ; 
  type LineArrayPtrType is access LineArrayType ;

  type MessagePType is protected body
  
    variable MessageCount : integer := 0 ; 
    constant INITIAL_ITEM_COUNT : integer := 25 ; 
    variable MaxMessageCount : integer := INITIAL_ITEM_COUNT ; 
    variable MessagePtr : LineArrayPtrType := new LineArrayType(1 to INITIAL_ITEM_COUNT) ; 

    ------------------------------------------------------------
    procedure Set (MessageIn : String) is
    ------------------------------------------------------------
      variable NamePtr : line ;
      variable OldMaxMessageCount : integer ;
      variable OldMessagePtr : LineArrayPtrType ; 
    begin
      MessageCount := MessageCount + 1 ; 
      if MessageCount > MaxMessageCount then
        OldMaxMessageCount := MaxMessageCount ; 
        MaxMessageCount := OldMaxMessageCount * 2 ; 
        OldMessagePtr := MessagePtr ;
        MessagePtr := new LineArrayType(1 to MaxMessageCount) ; 
        for i in 1 to OldMaxMessageCount loop
          MessagePtr(i) := OldMessagePtr(i) ; 
        end loop ;
        Deallocate( OldMessagePtr ) ;
      end if ; 
      MessagePtr(MessageCount) := new string'(MessageIn) ;
    end procedure Set ; 

    ------------------------------------------------------------
    impure function Get (ItemNumber : integer := 1) return string is
    ------------------------------------------------------------
    begin
      if MessageCount > 0 then 
        if ItemNumber >= 1 and ItemNumber <= MessageCount then 
          return MessagePtr(ItemNumber).all ; 
        else
          report LF & "%% MessagePkg:MessagePType.GetMessage input value out of range" severity failure ; 
          return "" ; -- error if this happens 
        end if ; 
      else 
        report LF & "%% MessagePkg:MessagePType.GetMessage message is not set" severity failure ; 
        return "" ; -- error if this happens 
--       return NamePtr.all ; 
      end if ;
    end function Get ; 

    ------------------------------------------------------------
    impure function GetCount return integer is 
    ------------------------------------------------------------
    begin
      return MessageCount ; 
    end function GetCount ; 

    ------------------------------------------------------------
    impure function IsSet return boolean is 
    ------------------------------------------------------------
    begin
      return MessageCount > 0 ; 
    end function IsSet ;      

    ------------------------------------------------------------
    procedure Deallocate is  -- clear message
    ------------------------------------------------------------
      variable CurPtr : LineArrayPtrType ;
    begin
      for i in 1 to MessageCount loop 
        deallocate( MessagePtr(i) ) ; 
      end loop ; 
      MessageCount := 0 ; 
      -- Do NOT Do this: deallocate( MessagePtr ) ; 
    end procedure Deallocate ;

    ------------------------------------------------------------
    procedure Clear is  -- clear 
    ------------------------------------------------------------
    begin
      Deallocate ;
    end procedure Clear ;

  end protected body MessagePType ;

end package body MessagePkg ;


