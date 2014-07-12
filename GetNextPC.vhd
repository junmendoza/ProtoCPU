----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:57:30 11/17/2013 
-- Design Name: 
-- Module Name:    GetNextPC - Behavioral 
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

entity GetNextPC is
	Port( 
			clock : in STD_LOGIC; 
			enable : in STD_LOGIC; 
			sel_getnextpc : in STD_LOGIC;
			pc : in STD_LOGIC_VECTOR(31 downto 0);
			nextpc : out STD_LOGIC_VECTOR(31 downto 0)
		 );
end GetNextPC;

architecture Behavioral of GetNextPC is
	
begin

	ProcGetNextPC : process(sel_getnextpc, pc)
	
	variable pc_instr_address : integer;
	
	begin
		ResetState : if enable = '1' then
			ifComputeNextPC : if sel_getnextpc = '1' then
			
				-- compute the next pc by offsetting the current pc
				pc_instr_address := to_integer(unsigned(pc));
				pc_instr_address := pc_instr_address + 1;
				nextpc <= std_logic_vector(to_signed(pc_instr_address, 32));
				
			else
		
				nextpc <= pc;
			
			end if ifComputeNextPC;
		end if ResetState;
		
	end process ProcGetNextPC;

end Behavioral;
