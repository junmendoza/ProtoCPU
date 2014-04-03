----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:57:36 04/03/2014 
-- Design Name: 
-- Module Name:    DecodeAddrModeRegRead - Behavioral 
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


entity DecodeAddrModeRegRead is
	Port( 
			regaddr : in STD_LOGIC_VECTOR(3 downto 0);			-- register addrss that contains the memory address offset
			memaddr_offset : out STD_LOGIC_VECTOR(31 downto 0)	-- memory address offset that contains the word data
		 );
end DecodeAddrModeRegRead;

architecture Behavioral of DecodeAddrModeRegRead is

	component RegisterFile is
		Port( 
				rw_sel : in STD_LOGIC_VECTOR(1 downto 0);
				Read_Rn1_addr : in STD_LOGIC_VECTOR(3 downto 0);
				Read_Rn2_addr : in STD_LOGIC_VECTOR(3 downto 0) := (others => '0');
				Write_Rn_addr : in STD_LOGIC_VECTOR(3 downto 0) := (others => '0');
				write_word : in STD_LOGIC_VECTOR(31 downto 0) := (others => '0');		
				Rn1_word : out STD_LOGIC_VECTOR(31 downto 0);		
				Rn2_word : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0')			
			  );
	end component RegisterFile;
	
begin

	ReadReg : RegisterFile port map
	(
		rw_sel			=> reg_rw_read1,
		Read_Rn1_addr 	=> regaddr,
		Read_Rn2_addr 	=> open,
		Write_Rn_addr 	=> open,
		write_word 		=> open,
		Rn1_word 		=> memaddr_offset,	
		Rn2_word 		=> open	
	);
	
end Behavioral;

