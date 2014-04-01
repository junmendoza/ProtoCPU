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

	component RegisterFile is
		Port( 
				rw_sel : in STD_LOGIC;
				Read_Rn1_addr : in STD_LOGIC_VECTOR(3 downto 0);
				Read_Rn2_addr : in STD_LOGIC_VECTOR(3 downto 0);
				Write_Rn_addr : in STD_LOGIC_VECTOR(3 downto 0);
				write_word : in STD_LOGIC_VECTOR(31 downto 0);		-- Write this word to Write_Rn_addr
				Rn1_word : out STD_LOGIC_VECTOR(31 downto 0);		-- Read this word from Read_Rn1_addr
				Rn2_word : out STD_LOGIC_VECTOR(31 downto 0)			-- Read this word from Read_Rn2_addr
			  );
	end component RegisterFile;
	
	signal store_word : STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
	
begin

	ReadReg : RegisterFile port map
	(
		rw_sel			=> reg_read,
		Read_Rn1_addr 	=> Read_Rn1_addr,
		Read_Rn2_addr 	=> Read_Rn2_addr,
		Write_Rn_addr 	=> "0000",
		write_word 		=> store_word,
		Rn1_word 		=> Rn1_word,	
		Rn2_word 		=> Rn2_word	
	);
	
	
end Behavioral;

