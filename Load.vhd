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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Load is
	Port( 
			effective_address : in STD_LOGIC_VECTOR(31 downto 0);
			word : out STD_LOGIC_VECTOR(31 downto 0)
		 );
end Load;

architecture Behavioral of Load is

	-- Memory region components
	component MemRegion_Main is
		Port( 
				offset : in STD_LOGIC_VECTOR(31 downto 0);
				mem_word : out STD_LOGIC_VECTOR(31 downto 0)
			  );
	end component MemRegion_Main;

begin

	mem_access : MemRegion_Main port map
	(
		offset => effective_address,
		mem_word => word
	);

end Behavioral;

