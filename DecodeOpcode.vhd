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
			ALU_Rd_addr : out STD_LOGIC_VECTOR(3 downto 0); 
			ALU_Rn_addr : out STD_LOGIC_VECTOR(3 downto 0); 
			ALU_Shifter : out STD_LOGIC_VECTOR(11 downto 0); 
			Branch_Target : out STD_LOGIC_VECTOR(19 downto 0); 
			DataMove_Rd_addr : out STD_LOGIC_VECTOR(3 downto 0); 
			DataMove_AddrMode : out STD_LOGIC_VECTOR(11 downto 0); 
			System_Data : out STD_LOGIC_VECTOR(23 downto 0)
		 );
end DecodeOpcode;

architecture Behavioral of DecodeOpcode is
	
begin

	ProcDecodeOpcode : process(instruction)
	
	variable opcode : STD_LOGIC_VECTOR(7 downto 0); 
	
	begin
		opcode := instruction(31 downto 24);
		
		if_opcode : 
			if opcode = alu_add 
					or opcode = alu_sub
					or opcode = alu_mul
					or opcode = alu_div
					or opcode = alu_and 
					or opcode = alu_nand
					or opcode = alu_or
					or opcode = alu_nor
					or opcode = alu_xor
					or opcode = alu_xnor
					or opcode = alu_not 
					or opcode = alu_shl
					or opcode = alu_shr then
		
				ALU_Rd_addr <= instruction(19 downto 16);
				ALU_Rn_addr <= instruction(15 downto 12);
				ALU_Shifter <= instruction(11 downto 0);
				
			elsif opcode = mem_mov
					or opcode = mem_ldr
					or opcode = mem_str
					or opcode = mem_push
					or opcode = mem_pop then
		
				DataMove_Rd_addr <= instruction(19 downto 16);
				DataMove_AddrMode <= instruction(11 downto 0);
				
			elsif opcode = br_jmp then
		
			elsif opcode = sys_int then
				
		end if if_opcode;
		
	end process ProcDecodeOpcode;
	
end Behavioral;

