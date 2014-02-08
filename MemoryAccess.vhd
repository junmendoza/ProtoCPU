----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    02:52:46 02/09/2014 
-- Design Name: 
-- Module Name:    MemoryAccess - Behavioral 
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

use work.cpu_types.all;

entity MemoryAccess is
	Port( 
			Rd : in STD_LOGIC_VECTOR(31 downto 0);
			effective_addr : in STD_LOGIC_VECTOR(31 downto 0);
			mem_word : out STD_LOGIC_VECTOR(31 downto 0)
		 );
end MemoryAccess;

architecture Behavioral of MemoryAccess is

begin


end Behavioral;

