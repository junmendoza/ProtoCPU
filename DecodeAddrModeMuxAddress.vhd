----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:58:30 04/03/2014 
-- Design Name: 
-- Module Name:    DecodeAddrModeMuxAddress - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

use work.cpu_types.all;

entity DecodeAddrModeMuxAddress is
	Port( 
			mode : in STD_LOGIC_VECTOR(3 downto 0);
			memaddr_offset : in STD_LOGIC_VECTOR(31 downto 0);				-- memory address offset that contains the word data
			memaddr_fromreg_offset : in STD_LOGIC_VECTOR(31 downto 0);	-- memory address offset retrieved from register that contains the word data
			mode_out : out STD_LOGIC_VECTOR(3 downto 0);
			mem_offset : out STD_LOGIC_VECTOR(31 downto 0)
		 );
end DecodeAddrModeMuxAddress;

architecture Behavioral of DecodeAddrModeMuxAddress is

begin

	ProcMuxAddr : process(memaddr_offset, memaddr_fromreg_offset)
	begin
	
		IfMuxAddr : if mode = addrmode_mode_memaddr then
			mem_offset <= memaddr_offset;
		elsif mode = addrmode_mode_regaddr then
			mem_offset <= memaddr_fromreg_offset;
		end if IfMuxAddr;	
	
		mode_out <= mode;
	
	end process ProcMuxAddr;

end Behavioral;

