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
			data_word: out STD_LOGIC_VECTOR(31 downto 0)
		 );
end DecodeAddrMode;

architecture Behavioral of DecodeAddrMode is

	-- Memory region components
	component MemRegion_Main is
		Port( 
				offset : in STD_LOGIC_VECTOR(31 downto 0);
				mem_word : out STD_LOGIC_VECTOR(31 downto 0)
			  );
	end component MemRegion_Main;
	
	component MemRegion_Registers is
		Port( 
				reg_addr : in STD_LOGIC_VECTOR(3 downto 0);
				reg_word : out STD_LOGIC_VECTOR(31 downto 0)
			  );
	end component MemRegion_Registers;

	-- register containing the memory address
	signal regaddr_offset : STD_LOGIC_VECTOR(3 downto 0) := (others => '0');
	
	-- memory address
	signal memaddr_offset : STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
	
	-- Word output from main memory region
	signal mem_word : STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
	
	-- Word output from register memory region
	signal memaddr_reg_word : STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
	
begin
	
	memreg_main : MemRegion_Main port map
	(
		offset => memaddr_offset,
		mem_word => mem_word
	);
	
	memreg_registers : MemRegion_Registers port map
	(
		reg_addr => regaddr_offset,
		reg_word => memaddr_reg_word
	);
	
	
	ProcAddrMode : process(AddrMode)
	
	variable mode : STD_LOGIC_VECTOR(3 downto 0) := (others => '0');
	variable address : STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
	
	begin
		
		mode := AddrMode(11 downto 8); 
		address := AddrMode(7 downto 0);
	
		if_mode : if mode = shft_mode_immd then
			-- data is the immediate data 
			data_word(7 downto 0) <= address;
		elsif mode = shft_mode_memaddr then
			-- data is the memory address offset where the immediate data is located
			memaddr_offset(7 downto 0) <= address;
			data_word <= mem_word;
		elsif mode = shft_mode_regaddr then
			-- data is the register address that contains the memory address offset where the immediate data is located
			regaddr_offset <= address(3 downto 0);
			memaddr_offset <= memaddr_reg_word;
			data_word <= mem_word;
		end if if_mode;
		
	end process ProcAddrMode;

end Behavioral;
