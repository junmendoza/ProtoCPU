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
			instruction : in STD_LOGIC_VECTOR(15 downto 0); 
			exec_alu : in STD_LOGIC_VECTOR(15 downto 0); 
			exec_logical : in STD_LOGIC_VECTOR(15 downto 0); 
			exec_branch : in STD_LOGIC_VECTOR(15 downto 0); 
			exec_mem : in STD_LOGIC_VECTOR(15 downto 0); 
			exec_system : in STD_LOGIC_VECTOR(15 downto 0); 
			nextpc : out STD_LOGIC;
			endprogram : out STD_LOGIC;
			memregion_register : inout t_MemRegister_15_32
		 );
end Execute;

architecture Behavioral of Execute is
				
	-- ALU execution signals
	signal add : STD_LOGIC;
	signal sub : STD_LOGIC;
	signal mul : STD_LOGIC;
	signal div : STD_LOGIC;
	
	-- ALU components
	component ALU_Select is
		Port( 
				clock : in STD_LOGIC;
				alu_exec_sel : in STD_LOGIC_VECTOR(15 downto 0);
				alu_exec_add : out STD_LOGIC;
				alu_exec_sub : out STD_LOGIC;
				alu_exec_mul : out STD_LOGIC;
				alu_exec_div : out STD_LOGIC
			 );
	end component ALU_Select;
	
	component alu_adder32 is
		Port( 
				clock : in STD_LOGIC;
				exec_add : in STD_LOGIC;
				vA : in STD_LOGIC_VECTOR (31 downto 0);
				vB : in STD_LOGIC_VECTOR (31 downto 0);
				vS : out STD_LOGIC_VECTOR (31 downto 0)
			 );
	end component alu_adder32;
	
begin

	-- ALU component mapping
	-- Select the ALU command, given the 
	ALU : ALU_Select port map(clock, cmd_id, add, sub, mul, div);
	--ALU_Add32 : alu_adder32 port map(clock, add, )
	
	-- Logical component mapping
	-- Branch component mapping
	-- Memory component mapping
	-- System component mapping
	
end Behavioral;

