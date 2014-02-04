----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:18:31 12/09/2013 
-- Design Name: 
-- Module Name:    Decode - Behavioral 
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;
use work.cpu_types.ALL;

entity DecodeALU is
	Port( 
			Rd_addr : in STD_LOGIC_VECTOR(3 downto 0); 
			Rn_addr : in STD_LOGIC_VECTOR(3 downto 0);
			Rd : out STD_LOGIC_VECTOR(31 downto 0);
			Rn : out STD_LOGIC_VECTOR(31 downto 0)
		 );
end DecodeALU;

architecture Behavioral of DecodeALU is

	component MemRegion_Registers is
		Port( 
				reg_addr : in STD_LOGIC_VECTOR(3 downto 0);
				reg_word : out STD_LOGIC_VECTOR(31 downto 0)
			  );
	end component MemRegion_Registers;
	
	signal reg_addr : STD_LOGIC_VECTOR(3 downto 0) := (others => '0');
	signal reg_word : STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
	
begin

	memreg_registers : MemRegion_Registers port map
	(
		reg_addr => reg_addr,
		reg_word => reg_word
	);
	
	ProcDecodeALU : process(Rd_addr, Rn_addr)
	
	variable index : integer; 
	
	begin
	
		reg_addr <= Rd_addr;
		-- Wait for ns so we get the word from the register component
		-- Is this wait necessary?
		--wait for 2 ns;
		Rd <= reg_word;
		
		
		
		reg_addr <= Rn_addr;
		-- Wait for ns so we get the word from the register component
		-- Is this wait necessary?
		--wait for 2 ns;
		Rn <= reg_word;
	
		
	end process ProcDecodeALU;
	
end Behavioral;

