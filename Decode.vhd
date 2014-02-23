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

entity Decode is
	Port( 
			instruction : in STD_LOGIC_VECTOR(31 downto 0); 
			op_type : out STD_LOGIC_VECTOR(3 downto 0);  
			op_alu : out STD_LOGIC_VECTOR(7 downto 0);  
			op_branch : out STD_LOGIC_VECTOR(7 downto 0); 
			op_datamove : out STD_LOGIC_VECTOR(7 downto 0); 
			op_system : out STD_LOGIC_VECTOR(7 downto 0);
			ALU_Rd_addr : out STD_LOGIC_VECTOR(3 downto 0);
			ALU_Rn1 : out STD_LOGIC_VECTOR(31 downto 0);
			ALU_Rn2 : out STD_LOGIC_VECTOR(31 downto 0);
			DataMove_Rd_addr : out STD_LOGIC_VECTOR(3 downto 0);
			DataMove_Rd : out STD_LOGIC_VECTOR(31 downto 0);
			addrmode : out STD_LOGIC_VECTOR(3 downto 0); 
			immd_word : out STD_LOGIC_VECTOR(31 downto 0);
			memaddr_offset : out STD_LOGIC_VECTOR(31 downto 0);
			NextPC : out STD_LOGIC_VECTOR(31 downto 0)
		 );
end Decode;

architecture Behavioral of Decode is

	signal ALU_Rn1_addr : STD_LOGIC_VECTOR(3 downto 0); 
	signal ALU_Rn2_addr : STD_LOGIC_VECTOR(3 downto 0); 
	signal DM_Rd_addr : STD_LOGIC_VECTOR(3 downto 0); 
	signal DataMove_AddrMode : STD_LOGIC_VECTOR(11 downto 0); 
	signal System_Data : STD_LOGIC_VECTOR(23 downto 0);
	signal JumpCondition : STD_LOGIC_VECTOR(3 downto 0);		
	
	component DecodeOpcode is  
		Port(
				instruction : in STD_LOGIC_VECTOR(31 downto 0); 
				op_type : out STD_LOGIC_VECTOR(3 downto 0);  
				ALU_Rd_addr : out STD_LOGIC_VECTOR(3 downto 0); 
				ALU_Rn1_addr : out STD_LOGIC_VECTOR(3 downto 0); 
				ALU_Rn2_addr : out STD_LOGIC_VECTOR(3 downto 0); 
				JumpCondition : out STD_LOGIC_VECTOR(3 downto 0); 
				DataMove_Rd_addr : out STD_LOGIC_VECTOR(3 downto 0); 
				DataMove_AddrMode : out STD_LOGIC_VECTOR(11 downto 0); 
				System_Data : out STD_LOGIC_VECTOR(23 downto 0)
			 );
	end component DecodeOpcode;
	
	component DecodeALU is  
		Port( 			
				Rn1_addr : in STD_LOGIC_VECTOR(3 downto 0);
				Rn2_addr : in STD_LOGIC_VECTOR(3 downto 0);
				Rn1 : out STD_LOGIC_VECTOR(31 downto 0);
				Rn2 : out STD_LOGIC_VECTOR(31 downto 0)
			);
	end component DecodeALU;
	
	component DecodeDataMove is
		Port( 
				Rd_addr : in STD_LOGIC_VECTOR(3 downto 0);
				Rd : out STD_LOGIC_VECTOR(31 downto 0)
			 );
	end component DecodeDataMove;
	
	component DecodeAddrMode is
		Port( 
				AddrMode : in STD_LOGIC_VECTOR(11 downto 0); 
				addrmode_mode : out STD_LOGIC_VECTOR(3 downto 0);
				immd_word : out STD_LOGIC_VECTOR(31 downto 0);
				memaddr_offset : out STD_LOGIC_VECTOR(31 downto 0)
			 );
	end component DecodeAddrMode;
	
	component DecodeJump is
		Port( 
				cond : in STD_LOGIC_VECTOR(3 downto 0);
				NextPC : out STD_LOGIC_VECTOR(31 downto 0)
			 );
	end component DecodeJump;
		
begin

	Decode : DecodeOpcode port map
	(
		instruction, 
		op_type => op_type,
		ALU_Rd_addr => ALU_Rd_addr, 
		ALU_Rn1_addr => ALU_Rn1_addr, 
		ALU_Rn2_addr => ALU_Rn2_addr,
		JumpCondition => JumpCondition, 
		DataMove_Rd_addr => DM_Rd_addr, 
		DataMove_AddrMode => DataMove_AddrMode, 
		System_Data => System_Data
	);
	
	Decode_ALU : DecodeALU port map
	(
		Rn1_addr => ALU_Rn1_addr, 
		Rn2_addr => ALU_Rn2_addr, 
		Rn1 => ALU_Rn1,
		Rn2 => ALU_Rn2
	);
	
	Decode_DataMove : DecodeDataMove port map
	(
		Rd_addr => DM_Rd_addr, 
		Rd => DataMove_Rd
	);
	
	Decode_AddrMode : DecodeAddrMode port map
	(
		AddrMode => DataMove_AddrMode, 
		addrmode_mode => addrmode,
		immd_word => immd_word,
		memaddr_offset => memaddr_offset
	);
	
	Decode_Jump : DecodeJump port map
	(
		cond => JumpCondition,
		NextPC => NextPC
	);
	
end Behavioral;


