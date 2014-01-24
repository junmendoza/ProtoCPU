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
			op_system : out STD_LOGIC_VECTOR(7 downto 0);
			optype : out STD_LOGIC_VECTOR(3 downto 0)
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
				optype <= optype_alu;
				
			when alu_sub =>
				op_alu <= alu_sub;
				optype <= optype_alu;
				
			when alu_mul =>
				op_alu <= alu_mul;
				optype <= optype_alu;
				
			when alu_div =>
				op_alu <= alu_div;
				optype <= optype_alu;
				
			when alu_and =>
				op_alu <= alu_and;
				optype <= optype_alu;
				
			when alu_nand =>
				op_alu <= alu_nand;
				optype <= optype_alu;
				
			when alu_or =>
				op_alu <= alu_or;
				optype <= optype_alu;
				
			when alu_nor =>
				op_alu <= alu_nor;
				optype <= optype_alu;
				
			when alu_xor =>
				op_alu <= alu_xor;
				optype <= optype_alu;
				
			when alu_xnor =>
				op_alu <= alu_xnor;
				optype <= optype_alu;
				
			when alu_not =>
				op_alu <= alu_not;
				optype <= optype_alu;
			
			when alu_shl =>
				op_alu <= alu_shl;
				optype <= optype_alu;
				
			when alu_shr =>
				op_alu <= alu_shr;
				optype <= optype_alu;
				
			when mem_mov =>
				op_datamove <= mem_mov;
				optype <= optype_datamove;
				
			when mem_ldr =>
				op_datamove <= mem_ldr;
				optype <= optype_datamove;
				
			when mem_str =>
				op_datamove <= mem_str;
				optype <= optype_datamove;
				
			when mem_push =>
				op_datamove <= mem_push;
				optype <= optype_datamove;
				
			when mem_pop =>
				op_datamove <= mem_pop;
				optype <= optype_datamove;
			
			when br_jmp =>
				op_branch <= br_jmp;
				optype <= optype_branch;
			
			when sys_int =>
				op_system <= sys_int;
				optype <= optype_system;
			
			when others =>
				
		end case case_opcode;
		
	end process ProcDecodeOpcode;
	
end Behavioral;

