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

entity DecodeDataMove is
	Port( 
			mem_regs : in t_MemRegister_15_32;
			DataMove_Rd : in STD_LOGIC_VECTOR(3 downto 0); 
			DataMove_AddrMode : in STD_LOGIC_VECTOR(11 downto 0); 
			Rd : out STD_LOGIC_VECTOR(31 downto 0);
			addr_mode : out STD_LOGIC_VECTOR(11 downto 0)	
		 );
end DecodeDataMove;

architecture Behavioral of DecodeDataMove is
	
begin

	ProcDecodeDataMove : process(DataMove_Rd, DataMove_AddrMode)
	
	begin

	end process ProcDecodeDataMove;
	
end Behavioral;

