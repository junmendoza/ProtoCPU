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

entity Decode is
	Port( 
			instruction : in STD_LOGIC_VECTOR(31 downto 0); 
			mem_regs : in t_MemRegister_15_32;
			op_alu : out STD_LOGIC_VECTOR(7 downto 0);  
			op_branch : out STD_LOGIC_VECTOR(7 downto 0); 
			op_datamove : out STD_LOGIC_VECTOR(7 downto 0); 
			op_system : out STD_LOGIC_VECTOR(7 downto 0);
			Rd_addr : out STD_LOGIC_VECTOR(3 downto 0);
			Rd : out STD_LOGIC_VECTOR(31 downto 0);
			Rn : out STD_LOGIC_VECTOR(31 downto 0);
			op3 : out STD_LOGIC_VECTOR(31 downto 0);
			shifter : out STD_LOGIC_VECTOR(11 downto 0);
			addr_mode : out STD_LOGIC_VECTOR(11 downto 0)
		 );
end Decode;

architecture Behavioral of Decode is

	signal opcode_alu : STD_LOGIC_VECTOR(7 downto 0);  
	signal opcode_branch : STD_LOGIC_VECTOR(7 downto 0); 
	signal opcode_datamove : STD_LOGIC_VECTOR(7 downto 0); 
	signal opcode_system : STD_LOGIC_VECTOR(7 downto 0) ;

	component DecodeOpcode is  
		Port( 
				instruction : in STD_LOGIC_VECTOR(31 downto 0); 
				op_alu : out STD_LOGIC_VECTOR(7 downto 0);  
				op_branch : out STD_LOGIC_VECTOR(7 downto 0); 
				op_datamove : out STD_LOGIC_VECTOR(7 downto 0); 
				op_system : out STD_LOGIC_VECTOR(7 downto 0)
			 );
	end component DecodeOpcode;
	
	component DecodeALU is  
		Port( 			
				instruction : in STD_LOGIC_VECTOR(31 downto 0); 
				op_alu : in STD_LOGIC_VECTOR(7 downto 0);
				mem_regs : in t_MemRegister_15_32;
				Rd : out STD_LOGIC_VECTOR(31 downto 0);
				Rn : out STD_LOGIC_VECTOR(31 downto 0);
				op3 : out STD_LOGIC_VECTOR(31 downto 0);
				shifter : out STD_LOGIC_VECTOR(11 downto 0);
				addr_mode : out STD_LOGIC_VECTOR(11 downto 0)		
			);
	end component DecodeALU;
	
	component DecodeBranch is
		Port( 
				instruction : in STD_LOGIC_VECTOR(31 downto 0); 
				op_branch : in STD_LOGIC_VECTOR(7 downto 0);
				mem_regs : in t_MemRegister_15_32
			 );
		end component DecodeBranch;
	
	component DecodeDataMove is
		Port( 
				instruction : in STD_LOGIC_VECTOR(31 downto 0); 
				op_branch : in STD_LOGIC_VECTOR(7 downto 0);
				mem_regs : in t_MemRegister_15_32;
				Rd : out STD_LOGIC_VECTOR(31 downto 0);
				Rn : out STD_LOGIC_VECTOR(31 downto 0);
				op3 : out STD_LOGIC_VECTOR(31 downto 0);
				shifter : out STD_LOGIC_VECTOR(11 downto 0);
				addr_mode : out STD_LOGIC_VECTOR(11 downto 0)	
			 );
		end component DecodeDataMove;
	
begin

	Decode : DecodeOpcode port map
	(
		instruction, 
		op_alu => opcode_alu, 
		op_branch => opcode_branch, 
		op_datamove => opcode_datamove, 
		op_system => opcode_system
	);
	
	Decode_ALU : DecodeALU port map
	(
		instruction,
		opcode_alu,
		mem_regs,
		Rd,
		Rn,
		op3,
		shifter,
		addr_mode
	);
	
end Behavioral;


