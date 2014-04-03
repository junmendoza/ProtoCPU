----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    00:14:43 01/28/2014 
-- Design Name: 
-- Module Name:    DecodeAddrMode - Behavioral 
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

use work.cpu_types.all;

entity DecodeAddrMode is
	Port( 
			AddrMode : in STD_LOGIC_VECTOR(11 downto 0); 
			addrmode_mode : out STD_LOGIC_VECTOR(3 downto 0);
			immd_word : out STD_LOGIC_VECTOR(31 downto 0);
			memaddr_offset : out STD_LOGIC_VECTOR(31 downto 0)
		 );
end DecodeAddrMode;

architecture Behavioral of DecodeAddrMode is

	component DecodeAddrModeAddress is
		Port( 
				AddrMode : in STD_LOGIC_VECTOR(11 downto 0); 
				addrmode_mode : out STD_LOGIC_VECTOR(3 downto 0);
				immd_word : out STD_LOGIC_VECTOR(31 downto 0);			-- immediate word data
				memaddr_offset : out STD_LOGIC_VECTOR(31 downto 0);	-- memory address offset that contains the word data
				regaddr : out STD_LOGIC_VECTOR(3 downto 0)				-- register addrss that contains the memory address offset
			 );
	end component DecodeAddrModeAddress;
	
	component DecodeAddrModeRegRead is
		Port( 
				regaddr : in STD_LOGIC_VECTOR(3 downto 0);			-- register addrss that contains the memory address offset
				memaddr_offset : out STD_LOGIC_VECTOR(31 downto 0)	-- memory address offset that contains the word data
			 );
	end component DecodeAddrModeRegRead;
	
	component DecodeAddrModeMuxAddress is
	Port( 
			mode : in STD_LOGIC_VECTOR(3 downto 0);
			memaddr_offset : in STD_LOGIC_VECTOR(31 downto 0);				-- memory address offset that contains the word data
			memaddr_fromreg_offset : in STD_LOGIC_VECTOR(31 downto 0);	-- memory address offset retrieved from register that contains the word data
			mode_out : out STD_LOGIC_VECTOR(3 downto 0);
			mem_offset : out STD_LOGIC_VECTOR(31 downto 0)
		 );
	end component DecodeAddrModeMuxAddress;
	
	--signal addrmode_mode : STD_LOGIC_VECTOR(3 downto 0);
	signal mode : STD_LOGIC_VECTOR(3 downto 0);
	signal register_addr : STD_LOGIC_VECTOR(3 downto 0);	
	signal memaddr : STD_LOGIC_VECTOR(31 downto 0);	
	signal memaddr_fromreg : STD_LOGIC_VECTOR(31 downto 0);

begin

	MemAddress : DecodeAddrModeAddress port map
	(
		AddrMode			=>	AddrMode,
		addrmode_mode	=>	mode,
		immd_word		=>	immd_word,
		memaddr_offset	=>	memaddr,
		regaddr			=> register_addr
	);
	
	RegRead : DecodeAddrModeRegRead port map
	(
		regaddr			=>	register_addr,
		memaddr_offset	=> memaddr_fromreg
	);
	
	MuxAddr : DecodeAddrModeMuxAddress port map
	(
		mode							=>	mode,
		memaddr_offset				=> memaddr,
		memaddr_fromreg_offset 	=> memaddr_fromreg,
		mode_out						=>	addrmode_mode,
		mem_offset 					=> memaddr_offset
	);

end Behavioral;
