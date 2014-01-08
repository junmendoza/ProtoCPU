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
			memregion_register : in t_MemRegister_15_32;
--			exec_alu : out STD_LOGIC_VECTOR(15 downto 0); 
--			exec_logical : out STD_LOGIC_VECTOR(15 downto 0); 
--			exec_branch : out STD_LOGIC_VECTOR(15 downto 0); 
--			exec_mem : out STD_LOGIC_VECTOR(15 downto 0); 
--			exec_system : out STD_LOGIC_VECTOR(15 downto 0);
			alu_add  : out STD_LOGIC;
			alu_sub  : out STD_LOGIC;
			alu_mul  : out STD_LOGIC;
			alu_div  :out STD_LOGIC;
			alu_shl  : out STD_LOGIC;
			alu_shr  : out STD_LOGIC;
			logic_and  : out STD_LOGIC;
			logic_nand : out STD_LOGIC;
			logic_or   : out STD_LOGIC;
			logic_nor  : out STD_LOGIC;
			logic_xor  : out STD_LOGIC;
			logic_xnor : out STD_LOGIC;
			logic_not  : out STD_LOGIC;
			mem_mov  : out STD_LOGIC;
			mem_ldr  : out STD_LOGIC;
			mem_str  : out STD_LOGIC;
			mem_push : out STD_LOGIC;
			mem_pop  : out STD_LOGIC;
			br_jmp   : out STD_LOGIC;
			sys_int  : out STD_LOGIC;
			operand1 : out STD_LOGIC_VECTOR(31 downto 0);
			operand2 : out STD_LOGIC_VECTOR(31 downto 0);
			operand3 : out STD_LOGIC_VECTOR(31 downto 0)
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
				alu_add <= '1';
				
			when op_sub =>
				alu_sub <= '1';
				
			when op_mul =>
				alu_mul <= '1';
				
			when op_div =>
				alu_div <= '1';
				
			when op_shl =>
				alu_shl <= '1';
				
			when op_shr =>
				alu_shr <= '1';
				
			when op_and =>
				logic_and <= '1';
				
			when op_nand =>
				logic_nand <= '1';
				
			when op_or =>
				logic_or <= '1';
				
			when op_nor =>
				logic_nor <= '1';
				
			when op_xor =>
				logic_xor <= '1';
				
			when op_xnor =>
				logic_xnor <= '1';
				
			when op_not =>
				logic_not <= '1';
			
			when op_mov =>
				mem_mov <= '1';
				
			when op_ldr =>
				mem_ldr <= '1';
				
			when op_str =>
				mem_str <= '1';
				
			when op_push =>
				mem_push <= '1';
				
			when op_pop =>
				mem_pop <= '1';
			
			when op_jmp =>
				br_jmp <= '1';
			
			when op_int =>
				sys_int <= '1';
			
			when others =>
				
		end case case_opcode;
		
	end process DecodeInstr;
	
end Behavioral;

