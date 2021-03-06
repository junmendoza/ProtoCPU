----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    00:40:15 02/10/2014 
-- Design Name: 
-- Module Name:    Load - Behavioral 
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

entity Load is
	Port( 
			effective_address : in STD_LOGIC_VECTOR(31 downto 0);
			load_word : out STD_LOGIC_VECTOR(31 downto 0)
		 );
end Load;

architecture Behavioral of Load is

	component MemRegion_Main is
		Port( 
				rw_sel : in STD_LOGIC;
				offset : in STD_LOGIC_VECTOR(31 downto 0);
				store_word : in STD_LOGIC_VECTOR(31 downto 0);
				load_word : out STD_LOGIC_VECTOR(31 downto 0)
			  );
	end component MemRegion_Main;
	
begin

	mem_access : MemRegion_Main port map
	(
		rw_sel => mem_read,
		offset => effective_address,
		store_word => X"00000000", 
		load_word => load_word
	);

end Behavioral;

