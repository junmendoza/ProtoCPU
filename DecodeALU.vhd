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
			Rd : out STD_LOGIC_VECTOR(31 downto 0);
			Rn : out STD_LOGIC_VECTOR(31 downto 0)
		 );
end DecodeALU;

architecture Behavioral of DecodeALU is
	
begin

	ProcDecodeALU : process(ALU_Rd, ALU_Rn)
	
	variable opcode : STD_LOGIC_VECTOR(7 downto 0); 
	variable index : integer; 
	
	begin
	
		index := to_integer(unsigned(ALU_Rd));
		Rd <= mem_regs(index);
		
		index := to_integer(unsigned(ALU_Rn));
		Rn <= mem_regs(index);
	
		
	end process ProcDecodeALU;
	
end Behavioral;

