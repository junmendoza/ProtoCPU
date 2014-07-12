----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:05:34 12/09/2013 
-- Design Name: 
-- Module Name:    Fetch - Behavioral 
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

entity Fetch is
	Port( 
			clock : in STD_LOGIC; 
			enable : in STD_LOGIC;
			sel_getnextpc : in STD_LOGIC;
			pc : in STD_LOGIC_VECTOR(31 downto 0);
			instr : out STD_LOGIC_VECTOR(31 downto 0)
		 );
end Fetch;

architecture Behavioral of Fetch is
	
	component GetNextPC is
	Port( 
			clock : in STD_LOGIC; 
			enable : in STD_LOGIC;
			sel_getnextpc : in STD_LOGIC;
			pc : in STD_LOGIC_VECTOR(31 downto 0);
			nextpc : out STD_LOGIC_VECTOR(31 downto 0)
		 );
	end component GetNextPC;
	
	component MemRegion_Program is
		Port( 
				enable : in STD_LOGIC;
				offset : in STD_LOGIC_VECTOR(31 downto 0);
				mem_word : out STD_LOGIC_VECTOR(31 downto 0)
			  );
	end component MemRegion_Program;
	
	signal memaddr_pc : STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
	signal nextpc : STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
	
begin

	GetNext : GetNextPC port map
	(
		clock 			=> clock,
		enable 			=> enable,
		sel_getnextpc 	=> sel_getnextpc,
		pc 				=> pc,
		nextpc 			=> nextpc
	);

	InstructionMemory : MemRegion_Program port map
	(
		enable => enable,
		offset => nextpc,
		mem_word => instr
	);

end Behavioral;

