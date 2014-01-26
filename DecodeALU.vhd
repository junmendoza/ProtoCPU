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

entity DecodeALU is
	Port( 
			mem_regs : in t_MemRegister_15_32;
			ALU_Rd : in STD_LOGIC_VECTOR(3 downto 0); 
			ALU_Rn : in STD_LOGIC_VECTOR(3 downto 0); 
			ALU_Shifter : in STD_LOGIC_VECTOR(11 downto 0); 
			Rd : out STD_LOGIC_VECTOR(31 downto 0);
			Rn : out STD_LOGIC_VECTOR(31 downto 0);
			op3 : out STD_LOGIC_VECTOR(31 downto 0)
		 );
end DecodeALU;

architecture Behavioral of DecodeALU is
	
begin

	ProcDecodeALU : process(ALU_Rd, ALU_Rn, ALU_Shifter)
	
	variable opcode : STD_LOGIC_VECTOR(7 downto 0); 
	variable index : integer; 
	
	begin
	
--		index := to_integer(unsigned(instruction(19 downto 16)));
--		Rd <= mem_regs(index);
--		
--		index := to_integer(unsigned(instruction(15 downto 12)));
--		Rn <= mem_regs(index);
--	
--		case_opcode : case op_alu is
--		
--			when alu_add =>
--			
--				index := to_integer(unsigned(instruction(19 downto 16)));
--				Rd <= mem_regs(index);
--				
--				index := to_integer(unsigned(instruction(15 downto 12)));
--				Rn <= mem_regs(index);
--				
--			when alu_sub =>
--				
--			when alu_mul =>
--				
--			when alu_div =>
--				
--			when alu_and =>
--				
--			when alu_nand =>
--				
--			when alu_or =>
--				
--			when alu_nor =>
--				
--			when alu_xor =>
--				
--			when alu_xnor =>
--				
--			when alu_not =>
--			
--			when alu_shl =>
--				
--			when alu_shr =>
--			
--			when others =>
--				
--		end case case_opcode;
		
	end process ProcDecodeALU;
	
end Behavioral;

