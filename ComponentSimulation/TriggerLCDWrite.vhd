----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:01:21 07/13/2014 
-- Design Name: 
-- Module Name:    TriggerLCDWrite - Behavioral 
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

entity TriggerLCDWrite is
	Port( 
			instruction : in STD_LOGIC_VECTOR(31 downto 0);
			emit	 		: out STD_LOGIC; 	-- 0 - idle, 1 - emits to lcd
			emit_done	: out STD_LOGIC 	
		 );
end TriggerLCDWrite;

architecture Behavioral of TriggerLCDWrite is

begin

	EmitData : process(instruction)
	begin
		emit <= '1';
		emit_done <= '0';
	end process;

end Behavioral;

