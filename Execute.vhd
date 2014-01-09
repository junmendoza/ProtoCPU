----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:30:09 01/02/2014 
-- Design Name: 
-- Module Name:    Execute - Behavioral 
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

entity Execute is
	Port( 
			clock : in STD_LOGIC;
			op_alu : in STD_LOGIC_VECTOR(7 downto 0);  
			op_branch : in STD_LOGIC_VECTOR(7 downto 0); 
			op_mem : in STD_LOGIC_VECTOR(7 downto 0); 
			op_system : in STD_LOGIC_VECTOR(7 downto 0);
			operand1 : in STD_LOGIC_VECTOR(31 downto 0); 
			operand2 : in STD_LOGIC_VECTOR(31 downto 0); 
			operand3 : out STD_LOGIC_VECTOR(31 downto 0); 
			nextpc : out STD_LOGIC;
			endprogram : out STD_LOGIC;
			mem_regs : inout t_MemRegister_15_32
	 );
end Execute;

architecture Behavioral of Execute is
				
--	-- ALU execution signals
--	signal alu_sel : STD_LOGIC_VECTOR(15 downto 0);
--	signal add : STD_LOGIC;
--	signal sub : STD_LOGIC;
--	signal mul : STD_LOGIC;
--	signal div : STD_LOGIC;
--	
	component alu_adder32 is
		Port( 
				exec_add : in STD_LOGIC;
				vA : in STD_LOGIC_VECTOR (31 downto 0);
				vB : in STD_LOGIC_VECTOR (31 downto 0);
				vS : out STD_LOGIC_VECTOR (31 downto 0)
			 );
	end component alu_adder32;
	
	component ALU is
		Port( 
				alu_sel : in STD_LOGIC_VECTOR(7 downto 0);
				op1 : in STD_LOGIC_VECTOR(31 downto 0);
				op2 : in STD_LOGIC_VECTOR(31 downto 0);
				dest : out STD_LOGIC_VECTOR(31 downto 0)
			 );
	end component;
	
begin

	-- ALU component mapping
	ALU_Exec : ALU port map(op_alu, operand1, operand2, operand3);
	
	-- Branch component mapping
	-- Memory component mapping
	-- System component mapping
	
end Behavioral;

