----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:05:34 12/09/2013 
-- Design Name: 
-- Module Name:    Fetch - Behavioral 
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

entity Fetch is
	Port( 
			clock : in STD_LOGIC; 
			pc : in STD_LOGIC_VECTOR(31 downto 0);
			instr : out STD_LOGIC_VECTOR(31 downto 0)
		 );
end Fetch;

architecture Behavioral of Fetch is
	
	component MemRegion_Program is
		Port( 
				offset : in STD_LOGIC_VECTOR(31 downto 0);
				mem_word : out STD_LOGIC_VECTOR(31 downto 0)
			  );
	end component MemRegion_Program;
	
	signal memaddr_pc : STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
	
begin

	memreg_program : MemRegion_Program port map
	(
		offset => memaddr_pc,
		mem_word => instr
	);

	FetchInstr : process(clock, pc)
	
	variable pc_instr_address : integer;
	
	begin
		ClockSync : if rising_edge(clock) then
		
			memaddr_pc <= pc;
			
		end if ClockSync;
	end process FetchInstr;

end Behavioral;

