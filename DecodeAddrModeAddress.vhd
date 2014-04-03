----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:56:57 04/03/2014 
-- Design Name: 
-- Module Name:    DecodeAddrModeAddress - Behavioral 
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

entity DecodeAddrModeAddress is
	Port( 
			AddrMode : in STD_LOGIC_VECTOR(11 downto 0); 
			addrmode_mode : out STD_LOGIC_VECTOR(3 downto 0);
			immd_word : out STD_LOGIC_VECTOR(31 downto 0);			-- immediate word data
			memaddr_offset : out STD_LOGIC_VECTOR(31 downto 0);	-- memory address offset that contains the word data
			regaddr : out STD_LOGIC_VECTOR(3 downto 0)				-- register addrss that contains the memory address offset
		 );
end DecodeAddrModeAddress;

architecture Behavioral of DecodeAddrModeAddress is

	signal mode : STD_LOGIC_VECTOR(3 downto 0) := (others => '0');
	signal address : STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
	
begin
	
		-----------------------------------------------------------
		-- Instruction
		-- 	31-24		23-20		19-16		15-12			11-0
		-- 	opcode	cond		Rd			Reserved 	address mode
		--
		-- Address mode
		--		11-8	7-0
		--		mode	address
		-----------------------------------------------------------
			
	ProcAddrMode : process(AddrMode)
	begin
	
		mode <= AddrMode(11 downto 8); 
		addrmode_mode <= mode;
		address <= AddrMode(7 downto 0);
	
		if_mode : if mode = addrmode_mode_immd then
			-- address is the immediate data 
			-- Fix memory alignment - remove zero bit padding
			immd_word(31 downto 8) <= "000000000000000000000000";
			immd_word(7 downto 0) <= address;
		elsif mode = addrmode_mode_memaddr then
			-- address is the memory address offset where the immediate data is located
			-- Fix memory alignment - remove zero bit padding
			memaddr_offset(31 downto 8) <= "000000000000000000000000";
			memaddr_offset(7 downto 0) <= address;
		elsif mode = addrmode_mode_regaddr then
			-- address is the register address that contains the memory address offset where the immediate data is located
			-- Fix memory alignment - remove zero bit padding
			memaddr_offset(31 downto 8) <= "000000000000000000000000";
			regaddr <= address(3 downto 0);
		end if if_mode;
		
	end process ProcAddrMode;

end Behavioral;

