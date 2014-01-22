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

entity DecodeBranch is
	Port( 
			instruction : in STD_LOGIC_VECTOR(31 downto 0); 
			op_branch : in STD_LOGIC_VECTOR(7 downto 0);
			mem_regs : in t_MemRegister_15_32
		 );
end DecodeBranch;

architecture Behavioral of DecodeBranch is
	
begin

	ProcDecodeBranch : process(op_branch)
	
	begin

	end process ProcDecodeBranch;
	
end Behavioral;

