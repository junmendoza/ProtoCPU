----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    01:01:23 02/17/2014 
-- Design Name: 
-- Module Name:    Mux_LoadWord - Behavioral 
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

entity Mux_LoadWord is
	Port( 
			sel_src : in STD_LOGIC_VECTOR(3 downto 0);
			load_word_ID : in STD_LOGIC_VECTOR(31 downto 0);		-- Load word - immediate word from decode
			load_word_MEM : in STD_LOGIC_VECTOR(31 downto 0);		-- Load word - loaded from memory access
			load_word : out STD_LOGIC_VECTOR(31 downto 0)			
		 );
end Mux_LoadWord;

architecture Behavioral of Mux_LoadWord is

begin

	ProcMuxWord : process(sel_src)
	begin
	
		if_sel : if sel_src = addrmode_mode_immd then
			load_word <= load_word_ID;
		elsif sel_src = addrmode_mode_memaddr then
			load_word <= load_word_MEM;
		end if if_sel;
	
	end process ProcMuxWord;

end Behavioral;

