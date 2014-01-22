----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:18:31 12/09/2013 
-- Design Name: 
-- Module Name:    Decode - Behavioral 
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

entity DecodeOpcode is
	Port( 
			instruction : in STD_LOGIC_VECTOR(31 downto 0); 
			op_alu : out STD_LOGIC_VECTOR(7 downto 0);  
			op_branch : out STD_LOGIC_VECTOR(7 downto 0); 
			op_datamove : out STD_LOGIC_VECTOR(7 downto 0); 
			op_system : out STD_LOGIC_VECTOR(7 downto 0)
		 );
end DecodeOpcode;

architecture Behavioral of DecodeOpcode is
	
begin

	ProcDecodeOpcode : process(instruction)
	
	variable opcode : STD_LOGIC_VECTOR(7 downto 0); 
	
	begin
		opcode := instruction(31 downto 24);
		case_opcode : case opcode is
		
			when alu_add =>
				op_alu <= alu_add;
				
			when alu_sub =>
				op_alu <= alu_sub;
				
			when alu_mul =>
				op_alu <= alu_mul;
				
			when alu_div =>
				op_alu <= alu_div;
				
			when alu_and =>
				op_alu <= alu_and;
				
			when alu_nand =>
				op_alu <= alu_nand;
				
			when alu_or =>
				op_alu <= alu_or;
				
			when alu_nor =>
				op_alu <= alu_nor;
				
			when alu_xor =>
				op_alu <= alu_xor;
				
			when alu_xnor =>
				op_alu <= alu_xnor;
				
			when alu_not =>
				op_alu <= alu_not;
			
			when alu_shl =>
				op_alu <= alu_shl;
				
			when alu_shr =>
				op_alu <= alu_shr;
				
			when mem_mov =>
				op_datamove <= mem_mov;
				
			when mem_ldr =>
				op_datamove <= mem_ldr;
				
			when mem_str =>
				op_datamove <= mem_str;
				
			when mem_push =>
				op_datamove <= mem_push;
				
			when mem_pop =>
				op_datamove <= mem_pop;
			
			when br_jmp =>
				op_branch <= br_jmp;
			
			when sys_int =>
				op_system <= sys_int;
			
			when others =>
				
		end case case_opcode;
		
	end process ProcDecodeOpcode;
	
end Behavioral;

