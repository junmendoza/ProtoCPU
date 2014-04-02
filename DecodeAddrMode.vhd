----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    00:14:43 01/28/2014 
-- Design Name: 
-- Module Name:    DecodeAddrMode - Behavioral 
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

use work.cpu_types.all;

entity DecodeAddrMode is
	Port( 
			AddrMode : in STD_LOGIC_VECTOR(11 downto 0); 
			addrmode_mode : out STD_LOGIC_VECTOR(3 downto 0);
			immd_word : out STD_LOGIC_VECTOR(31 downto 0);
			memaddr_offset : out STD_LOGIC_VECTOR(31 downto 0)
		 );
end DecodeAddrMode;

architecture Behavioral of DecodeAddrMode is

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

	-- register containing the memory address
	signal regaddr_offset : STD_LOGIC_VECTOR(3 downto 0) := (others => '0');
	
	-- Word output from register memory region
	signal memaddr_reg_word : STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
begin
	
	ReadReg : RegisterFile port map
	(
		rw_sel			=> reg_read1,
		Read_Rn1_addr 	=> regaddr_offset,
		Read_Rn2_addr 	=> open,
		Write_Rn_addr 	=> open,
		write_word 		=> open,
		Rn1_word 		=> memaddr_reg_word,	
		Rn2_word 		=> open	
	);
	
	ProcAddrMode : process(AddrMode)
	
	variable mode : STD_LOGIC_VECTOR(3 downto 0) := (others => '0');
	variable address : STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
	
	begin
		
		mode := AddrMode(11 downto 8); 
		addrmode_mode <= mode;
		address := AddrMode(7 downto 0);
	
		if_mode : if mode = addrmode_mode_immd then
			-- address is the immediate data 
			immd_word(7 downto 0) <= address;
		elsif mode = addrmode_mode_memaddr then
			-- address is the memory address offset where the immediate data is located
			memaddr_offset(7 downto 0) <= address;
		elsif mode = addrmode_mode_regaddr then
			-- address is the register address that contains the memory address offset where the immediate data is located
			regaddr_offset <= address(3 downto 0);
			memaddr_offset <= memaddr_reg_word;
		end if if_mode;
		
	end process ProcAddrMode;

end Behavioral;
