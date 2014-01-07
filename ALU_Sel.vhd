----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:42:28 01/04/2014 
-- Design Name: 
-- Module Name:    ALU - Behavioral 
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
use cpu_types.ALL;

entity ALU_Select is
	Port( 
			clock : in STD_LOGIC;
			alu_exec_sel : in STD_LOGIC_VECTOR(15 downto 0);
			alu_exec_add : out STD_LOGIC;
			alu_exec_sub : out STD_LOGIC;
			alu_exec_mul : out STD_LOGIC;
			alu_exec_div : out STD_LOGIC
		 );
end ALU_Select;

architecture Behavioral of ALU_Select is

begin

	sel : process(alu_exec_sel)
	begin
	
		ClockSync : if rising_edge(clock) then

			case_sel : case alu_exec_sel is
			
				when alu_add =>
					alu_exec_add <= '1';
				when alu_sub =>
					alu_exec_sub <= '1';
				when alu_mul =>
					alu_exec_mul <= '1';
				when alu_div =>
					alu_exec_div <= '1';
				when others =>
					
			end case case_sel;
				
		end if ClockSync;
		
	end process sel;

end Behavioral;

