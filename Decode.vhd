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
use cpu_types.ALL;

entity Decode is
	Port( 
			clock : in STD_LOGIC;
			instruction : in STD_LOGIC_VECTOR(31 downto 0); 
			mem_regs : in t_MemRegister_15_32;
			op_alu : out STD_LOGIC_VECTOR(7 downto 0);  
			op_branch : out STD_LOGIC_VECTOR(7 downto 0); 
			op_mem : out STD_LOGIC_VECTOR(7 downto 0); 
			op_system : out STD_LOGIC_VECTOR(7 downto 0)
		 );
end Decode;

architecture Behavioral of Decode is

	-- Instruction set constants
	subtype opcode_size is STD_LOGIC_VECTOR(7 downto 0);
	
	-- Data processing
	constant op_add  : opcode_size := X"00"; 
	constant op_sub  : opcode_size := X"01"; 
	constant op_mul  : opcode_size := X"02"; 
	constant op_div  : opcode_size := X"03"; 
	constant op_and  : opcode_size := X"04"; 
	constant op_nand : opcode_size := X"05"; 
	constant op_or   : opcode_size := X"06"; 
	constant op_nor  : opcode_size := X"07"; 
	constant op_xor  : opcode_size := X"08"; 
	constant op_xnor : opcode_size := X"09"; 
	constant op_not  : opcode_size := X"0A"; 
	constant op_shl  : opcode_size := X"0B"; 
	constant op_shr  : opcode_size := X"0C"; 
	
	-- Data movement
	constant op_mov  : opcode_size := X"0D"; 
	constant op_ldr  : opcode_size := X"0E"; 
	constant op_str  : opcode_size := X"0F"; 
	constant op_push : opcode_size := X"1A"; 
	constant op_pop  : opcode_size := X"1B"; 
	
	-- Branching
	constant op_jmp  : opcode_size := X"1C"; 
	
	-- System
	constant op_int  : opcode_size := X"1D"; 
	
	
	-- Condition code
	subtype cond_size is STD_LOGIC_VECTOR(3 downto 0);
	constant cond_eq : cond_size := X"0"; 
	constant cond_nq : cond_size := X"1"; 
	constant cond_g  : cond_size := X"2"; 
	constant cond_ge : cond_size := X"3"; 
	constant cond_l  : cond_size := X"4"; 
	constant cond_le : cond_size := X"5"; 

	
	------------------------------------
	signal opcode : STD_LOGIC_VECTOR(7 downto 0);
	
begin

	DecodeInstr : process(instruction)
	begin
		opcode <= instruction(31 downto 24);
		 
		case_opcode : case opcode is
		
			when op_add =>
				op_alu <= op_add;
				
			when op_sub =>
				op_alu <= op_sub;
				
			when op_mul =>
				op_alu <= op_mul;
				
			when op_div =>
				op_alu <= op_div;
				
			when op_shl =>
				op_alu <= op_shl;
				
			when op_shr =>
				op_alu <= op_shr;
				
			when op_and =>
				op_alu <= op_and;
				
			when op_nand =>
				op_alu <= op_nand;
				
			when op_or =>
				op_alu <= op_or;
				
			when op_nor =>
				op_alu <= op_nor;
				
			when op_xor =>
				op_alu <= op_xor;
				
			when op_xnor =>
				op_alu <= op_xnor;
				
			when op_not =>
				op_alu <= op_not;
			
			when op_mov =>
				op_mem <= op_mov;
				
			when op_ldr =>
				op_mem <= op_ldr;
				
			when op_str =>
				op_mem <= op_str;
				
			when op_push =>
				op_mem <= op_push;
				
			when op_pop =>
				op_mem <= op_pop;
			
			when op_jmp =>
				op_branch <= op_jmp;
			
			when op_int =>
				op_system <= op_int;
			
			when others =>
				
		end case case_opcode;
		
	end process DecodeInstr;
	
end Behavioral;

