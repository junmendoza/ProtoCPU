----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    00:14:43 01/28/2014 
-- Design Name: 
-- Module Name:    Decode_Shifter - Behavioral 
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

entity DecodeShifter is
	Port( 
			mem_regs : in t_MemRegister_15_32;
			ALU_Shifter : in STD_LOGIC_VECTOR(11 downto 0); 
			op3 : out STD_LOGIC_VECTOR(31 downto 0)
		 );
end DecodeShifter;

architecture Behavioral of DecodeShifter is

begin
	
	ProcALUShift : process(ALU_Shifter)
	
	variable mode : STD_LOGIC_VECTOR(3 downto 0) := ALU_Shifter(11 downto 8); 
	variable data : STD_LOGIC_VECTOR(7 downto 0) := ALU_Shifter(7 downto 0);
	
	begin
		
		if_mode : if mode = shft_mode_immd then
			op3(7 downto 0) <= data;
		elsif mode = shft_mode_memaddr then
			
		elsif mode = shft_mode_regaddr then
		
		end if if_mode;
		
	end process ProcALUShift;

end Behavioral;