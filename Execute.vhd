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

use work.cpu_types.ALL;

entity Execute is
	Port( 
			op_alu : in STD_LOGIC_VECTOR(7 downto 0);  
			op_datamove : in STD_LOGIC_VECTOR(7 downto 0); 
			ALU_op1 : in STD_LOGIC_VECTOR(31 downto 0); 
			ALU_op2 : in STD_LOGIC_VECTOR(31 downto 0);  
			memaddr_offset : in STD_LOGIC_VECTOR(31 downto 0); 
			Exec_out : out STD_LOGIC_VECTOR(31 downto 0);     
			effective_addr : out STD_LOGIC_VECTOR(31 downto 0)
		);
end Execute;

architecture Behavioral of Execute is
				
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
				 ALU_out : out STD_LOGIC_VECTOR(31 downto 0);
				 CMP_out : out STD_LOGIC_VECTOR(31 downto 0)
			 );
	end component;
	
	component Compare is
		Port( 
				ALU_out : in STD_LOGIC_VECTOR(31 downto 0);
				PSR : out STD_LOGIC_VECTOR(31 downto 0)
			 );
	end component Compare;
	
	component Mux_ExecOut is
		Port( 
				alu_sel : in STD_LOGIC_VECTOR(7 downto 0);			-- ALU operation
				ALU_out : in STD_LOGIC_VECTOR(31 downto 0);			-- ALU output
				PSR : in STD_LOGIC_VECTOR(31 downto 0);				-- PSR - CMP output
				Exec_Out : out STD_LOGIC_VECTOR(31 downto 0)			
			 );
	end component Mux_ExecOut;
	
	signal ALU_out : STD_LOGIC_VECTOR(31 downto 0);
	signal CMP_out : STD_LOGIC_VECTOR(31 downto 0);
	signal PSR : STD_LOGIC_VECTOR(31 downto 0);
	
begin
	
	-- ALU component map
	ALU_Exec : ALU port map
	(
		alu_sel => op_alu, 
		op1 => ALU_op1, 
		op2 => ALU_op2, 
		ALU_out => ALU_out,
		CMP_out => CMP_out
	);
	
	-- Comparison component map
	CMP : Compare port map
	(
		ALU_out => CMP_out,
		PSR => PSR
	);
	
	ExecOut : Mux_ExecOut port map
	(
		alu_sel => op_alu, 
		ALU_out => ALU_out,
		PSR => PSR,
		Exec_Out => Exec_out
	); 
	
	-- Branch component mapping
	-- Memory component mapping
	-- System component mapping
	
end Behavioral;

