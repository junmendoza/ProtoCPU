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

entity Mux_ExecOut is
	Port( 
			alu_sel : in STD_LOGIC_VECTOR(7 downto 0);			-- ALU operation
			ALU_out : in STD_LOGIC_VECTOR(31 downto 0);			-- ALU output
			PSR : in STD_LOGIC_VECTOR(31 downto 0);				-- PSR - CMP output
			Exec_Out : out STD_LOGIC_VECTOR(31 downto 0)			
		 );
end Mux_ExecOut;

architecture Behavioral of Mux_ExecOut is

begin

	ProcMuxExecOut : process(ALU_out, PSR)
	begin
	
		if_sel : if alu_sel = alu_cmp then
			Exec_Out <= PSR;
		else
			Exec_Out <= ALU_out;
		end if if_sel;
	
	end process ProcMuxExecOut;

end Behavioral;

