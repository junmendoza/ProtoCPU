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
			Rd_addr : in STD_LOGIC_VECTOR(3 downto 0);
			Rd : out STD_LOGIC_VECTOR(31 downto 0)
		 );
end DecodeDataMove;

architecture Behavioral of DecodeDataMove is

	component RegisterFile is
		Port( 
				rw_sel : in STD_LOGIC_VECTOR(1 downto 0);
				Read_Rn1_addr : in STD_LOGIC_VECTOR(3 downto 0);
				Read_Rn2_addr : in STD_LOGIC_VECTOR(3 downto 0) := (others => '0');
				Write_Rn_addr : in STD_LOGIC_VECTOR(3 downto 0) := (others => '0');
				write_word : in STD_LOGIC_VECTOR(31 downto 0) := (others => '0');		
				Rn1_word : out STD_LOGIC_VECTOR(31 downto 0);		
				Rn2_word : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0')			
			  );
	end component RegisterFile;

	-- register containing the memory address
	signal address : STD_LOGIC_VECTOR(3 downto 0) := (others => '0');
	signal load_word : STD_LOGIC_VECTOR(31 downto 0) := (others => '0'); 
	
begin

	ReadReg : RegisterFile port map
	(
		rw_sel			=> reg_rw_read1,
		Read_Rn1_addr 	=> address,
		Read_Rn2_addr 	=> open,
		Write_Rn_addr 	=> open,
		write_word 		=> open,
		Rn1_word 		=> load_word,	
		Rn2_word 		=> open	
	);
	
	ProcDecodeDataMove : process(Rd_addr)

	begin
	
		address <= Rd_addr;
		Rd <= load_word;
		
	end process ProcDecodeDataMove;
	
end Behavioral;

