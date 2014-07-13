----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:26:44 07/13/2014 
-- Design Name: 
-- Module Name:    ResetLCDWrite - Behavioral 
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

entity ResetLCDWrite is
	Port( 
			emit_done 	: in STD_LOGIC;
			emitReset	: out STD_LOGIC 	-- 0 - idle, 1 - emits to lcd
		 );
end ResetLCDWrite;

architecture Behavioral of ResetLCDWrite is

begin

	EmitData : process(emit_done)
	begin
		emitReset <= '0';
	end process;


end Behavioral;

