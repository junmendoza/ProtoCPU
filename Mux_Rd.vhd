----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:24:00 01/24/2014 
-- Design Name: 
-- Module Name:    Mux_Rd - Behavioral 
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

use work.cpu_types.ALL;

entity Mux_Rd is
	Port( 
			optype : in STD_LOGIC_VECTOR(3 downto 0);
         Rd_alu : in STD_LOGIC_VECTOR(31 downto 0);
         Rd_datamove : in STD_LOGIC_VECTOR(31 downto 0);
         Rd : out STD_LOGIC_VECTOR(31 downto 0)
		 );
end Mux_Rd;

architecture Behavioral of Mux_Rd is

begin

	ProcMuxRd : process(Rd_alu, Rd_datamove)
	begin
	
		case_opcode : case optype is
			when optype_alu =>
				Rd <= Rd_alu;
				
			when optype_datamove =>
				Rd <= Rd_datamove;
				
			when others =>
				
		end case case_opcode;
	
	end process ProcMuxRd;
end Behavioral;

