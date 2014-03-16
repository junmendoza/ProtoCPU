----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    01:04:29 03/17/2014 
-- Design Name: 
-- Module Name:    PipelineControl_IF_ID - Behavioral 
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

entity PipelineControl_IF_ID is
	Port( clock : in STD_LOGIC;
			in_REG_IF_ID_instr : in STD_LOGIC_VECTOR (31 downto 0);
			out_REG_IF_ID_instr : out STD_LOGIC_VECTOR (31 downto 0)
		 );
		 
end PipelineControl_IF_ID;

architecture Behavioral of PipelineControl_IF_ID is

begin

	PipelineProcess : process(clock, in_REG_IF_ID_instr)
	begin
		out_REG_IF_ID_instr <= in_REG_IF_ID_instr;
	end process PipelineProcess;

end Behavioral;

