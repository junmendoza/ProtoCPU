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
			Rn1_addr : in STD_LOGIC_VECTOR(3 downto 0);
			Rn2_addr : in STD_LOGIC_VECTOR(3 downto 0);
			Rn1 : out STD_LOGIC_VECTOR(31 downto 0);
			Rn2 : out STD_LOGIC_VECTOR(31 downto 0)
		 );
end DecodeALU;

architecture Behavioral of DecodeALU is

	component MemRegion_Registers is
		Port( 
				rw_sel : in STD_LOGIC;
				offset : in STD_LOGIC_VECTOR(3 downto 0);
				store_word : in STD_LOGIC_VECTOR(31 downto 0);
				load_word : out STD_LOGIC_VECTOR(31 downto 0)
			  );
	end component MemRegion_Registers;
	
	signal reg_offset : STD_LOGIC_VECTOR(3 downto 0) := (others => '0');
	signal load_word : STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
	signal store_word : STD_LOGIC_VECTOR(31 downto 0) := (others => '0'); -- This is an unnecessary wire, resolve this
	
begin

	memreg_registers : MemRegion_Registers port map
	(
		rw_sel => reg_read,
		offset => reg_offset,
		store_word => store_word,
		load_word => load_word
	);
	
	ProcDecodeALU : process(Rn1_addr, Rn2_addr)
	
	variable index : integer; 
	
	begin
		
		reg_offset <= Rn1_addr;
		Rn1 <= load_word;
		
		-- Is this wait necessary?
		--wait for 2 ns;
		
		reg_offset <= Rn2_addr;
		Rn2 <= load_word;
	
		
	end process ProcDecodeALU;
	
end Behavioral;

