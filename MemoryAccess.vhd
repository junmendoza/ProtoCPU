----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    02:52:46 02/09/2014 
-- Design Name: 
-- Module Name:    MemoryAccess - Behavioral 
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

entity MemoryAccess is
	Port( 
			opcode : in STD_LOGIC_VECTOR(7 downto 0);						
			Rd : in STD_LOGIC_VECTOR(31 downto 0);							-- Word input from Decode (str)
			effective_addr : in STD_LOGIC_VECTOR(31 downto 0);			-- ldr word memory addr location/str dest memory addr
			mem_word : out STD_LOGIC_VECTOR(31 downto 0)					-- word retrieved from mem to load (ldr)
		 );
end MemoryAccess;

architecture Behavioral of MemoryAccess is

	component Load is
		Port( 
				effective_address : in STD_LOGIC_VECTOR(31 downto 0);
				load_word : out STD_LOGIC_VECTOR(31 downto 0)
			 );
	end component Load;
	
	component Store is
		Port( 
				effective_address : in STD_LOGIC_VECTOR(31 downto 0);
				store_word : in STD_LOGIC_VECTOR(31 downto 0)
			 );
	end component Store;
	
	signal ldr_effective_addr : STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
	signal str_effective_addr : STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
	
begin

	ldr : Load port map
	(
		effective_address => ldr_effective_addr,
		load_word => mem_word
	);
	
	str : Store port map
	(
		effective_address => str_effective_addr,
		store_word => Rd
	);

	ProcMemAccess : process(effective_addr)
	
	begin
	
		ifOpcode : if opcode = mem_ldr then
			ldr_effective_addr <= effective_addr;
		elsif opcode = mem_str then
			str_effective_addr <= effective_addr;
		end if ifOpcode;
	
	end process ProcMemAccess;

end Behavioral;

