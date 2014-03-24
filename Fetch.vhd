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
			getnextpc : in STD_LOGIC;
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
	signal pcaddr : STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
	
begin

	memreg_program : MemRegion_Program port map
	(
		offset => memaddr_pc,
		mem_word => instr
	);

	FetchInstr : process(clock, getnextpc, pc)
	
	variable pc_instr_address : integer;
	
	begin
	
		ClockSync : if rising_edge(clock) then
		
			pcaddr <= pc;
			
			ifComputeNextPC : if getnextpc = '1' then
				-- compute the next pc by offsetting the current pc
				pc_instr_address := to_integer(unsigned(pcaddr));
				pc_instr_address := pc_instr_address + 1;
				pcaddr <= std_logic_vector(to_signed(pc_instr_address, 32));
			end if ifComputeNextPC;
			
			memaddr_pc <= pcaddr;
			
		end if ClockSync;
	end process FetchInstr;

end Behavioral;

