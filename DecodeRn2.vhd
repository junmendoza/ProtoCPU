----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    02:36:56 03/31/2014 
-- Design Name: 
-- Module Name:    DecodeRn2 - Behavioral 
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
use work.cpu_types.ALL;

entity DecodeRn2 is	
	Port( 
			Rn_addr : in STD_LOGIC_VECTOR(3 downto 0);
			Rn : out STD_LOGIC_VECTOR(31 downto 0)
		 );
end DecodeRn2;

architecture Behavioral of DecodeRn2 is

	component MemRegion_Registers is
		Port( 
				rw_sel : in STD_LOGIC;
				offset : in STD_LOGIC_VECTOR(3 downto 0);
				write_word : in STD_LOGIC_VECTOR(31 downto 0);	-- Write this word to register offset
				read_word : out STD_LOGIC_VECTOR(31 downto 0)	-- Read this word from register offset
			  );
	end component MemRegion_Registers;

	signal store_word : STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
	
begin

	memreg_registers : MemRegion_Registers port map
	(
		rw_sel => reg_read,
		offset => Rn_addr,
		write_word => store_word,
		read_word => Rn
	);

end Behavioral;

