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

entity DecodeALU is
	Port( 
			Rn1_addr : in STD_LOGIC_VECTOR(3 downto 0);
			Rn2_addr : in STD_LOGIC_VECTOR(3 downto 0);
			Rn1 : out STD_LOGIC_VECTOR(31 downto 0);
			Rn2 : out STD_LOGIC_VECTOR(31 downto 0)
		 );
end DecodeALU;

architecture Behavioral of DecodeALU is

	component DecodeRn1 is	
		Port( 
				Rn_addr : in STD_LOGIC_VECTOR(3 downto 0);
				Rn : out STD_LOGIC_VECTOR(31 downto 0)
			 );	 
	end component DecodeRn1;
	
	component DecodeRn2 is	
		Port( 
				Rn_addr : in STD_LOGIC_VECTOR(3 downto 0);
				Rn : out STD_LOGIC_VECTOR(31 downto 0)
			 );	 
	end component DecodeRn2;
	
begin

	DecodeRn1Addr : DecodeRn1 port map
	(
		Rn_addr => Rn1_addr,
		Rn => Rn1
	);
		
	DecodeRn2Addr : DecodeRn1 port map
	(
		Rn_addr => Rn2_addr,
		Rn => Rn2
	);
	
	
end Behavioral;

