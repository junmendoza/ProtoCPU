----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    00:04:19 02/11/2014 
-- Design Name: 
-- Module Name:    Store - Behavioral 
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

entity Store is		
	Port( 
			effective_address : in STD_LOGIC_VECTOR(31 downto 0);
			store_word : in STD_LOGIC_VECTOR(31 downto 0)
		 );
end Store;

architecture Behavioral of Store is

	-- Memory region component
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
		rw_sel => mem_write,
		offset => effective_address,
		store_word => store_word
	);

end Behavioral;

