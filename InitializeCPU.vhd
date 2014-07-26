----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:54:23 06/29/2014 
-- Design Name: 
-- Module Name:    InitializeCPU - Behavioral 
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

use work.cpu_types.ALL;
 
entity InitializeCPU is   
	Port( 
			clock 		: in  STD_LOGIC; 
			reset 		: in  STD_LOGIC; 
			enable_lcd	: out STD_LOGIC; 
			firstPC 		: out STD_LOGIC_VECTOR(31 downto 0)
		 );
end InitializeCPU; 

architecture Behavioral of InitializeCPU is

type CPU_INIT_STATE is ( CPU_INIT_STATE_DISABLED, 
								 CPU_INIT_STATE_ENABLED
							  );
						
signal cpuState : CPU_INIT_STATE;
						
begin

	process(clock)
	begin
		ClockSync : if rising_edge(clock) then
			ResetState : if reset = '1' then
				cpuState <= CPU_INIT_STATE_DISABLED;
			elsif reset = '0' then
				if cpuState = CPU_INIT_STATE_DISABLED then
					enable_lcd <= '1';
					firstPC <= "00000000000000000000000000000001";
					cpuState <= CPU_INIT_STATE_ENABLED;
				end if;
			end if ResetState; 
		end if ClockSync;
	end process;

end Behavioral;

