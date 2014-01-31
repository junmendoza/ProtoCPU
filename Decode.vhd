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
			mem_regs : in t_MemRegister_15_32;
			op_alu : out STD_LOGIC_VECTOR(7 downto 0);  
			op_branch : out STD_LOGIC_VECTOR(7 downto 0); 
			op_datamove : out STD_LOGIC_VECTOR(7 downto 0); 
			op_system : out STD_LOGIC_VECTOR(7 downto 0);
			Rd_addr : out STD_LOGIC_VECTOR(3 downto 0);
			ALU_Rd : out STD_LOGIC_VECTOR(31 downto 0);
			ALU_Rn : out STD_LOGIC_VECTOR(31 downto 0);
			DataMove_Rd : out STD_LOGIC_VECTOR(31 downto 0);
			shifter_immd : out STD_LOGIC_VECTOR(7 downto 0);
			shifter_immd_addr : out STD_LOGIC_VECTOR(7 downto 0);
			shifter_reg_addr : out STD_LOGIC_VECTOR(7 downto 0);
			addrmode_immd : out STD_LOGIC_VECTOR(7 downto 0);
			addrmode_immd_addr : out STD_LOGIC_VECTOR(7 downto 0);
			addrmode_reg_addr : out STD_LOGIC_VECTOR(7 downto 0)
		 );
end Decode;

architecture Behavioral of Decode is

	signal ALU_Rd_addr : STD_LOGIC_VECTOR(3 downto 0); 
	signal ALU_Rn_addr : STD_LOGIC_VECTOR(3 downto 0); 
	signal ALU_Shifter : STD_LOGIC_VECTOR(11 downto 0); 
	signal Branch_Target : STD_LOGIC_VECTOR(19 downto 0); 
	signal DataMove_Rd_addr : STD_LOGIC_VECTOR(3 downto 0); 
	signal DataMove_AddrMode : STD_LOGIC_VECTOR(11 downto 0); 
	signal System_Data : STD_LOGIC_VECTOR(23 downto 0);
	
	component DecodeOpcode is  
		Port(
				instruction : in STD_LOGIC_VECTOR(31 downto 0); 
				ALU_Rd_addr : out STD_LOGIC_VECTOR(3 downto 0); 
				ALU_Rn_addr : out STD_LOGIC_VECTOR(3 downto 0); 
				ALU_Shifter : out STD_LOGIC_VECTOR(11 downto 0); 
				Branch_Target : out STD_LOGIC_VECTOR(19 downto 0); 
				DataMove_Rd_addr : out STD_LOGIC_VECTOR(3 downto 0); 
				DataMove_AddrMode : out STD_LOGIC_VECTOR(11 downto 0); 
				System_Data : out STD_LOGIC_VECTOR(23 downto 0)
			 );
	end component DecodeOpcode;
	
	component DecodeALU is  
		Port( 			
				mem_regs : in t_MemRegister_15_32;
				Rd_addr : in STD_LOGIC_VECTOR(3 downto 0); 
				Rn_addr : in STD_LOGIC_VECTOR(3 downto 0);
				Rd : out STD_LOGIC_VECTOR(31 downto 0);
				Rn : out STD_LOGIC_VECTOR(31 downto 0)
			);
	end component DecodeALU;
	
	component DecodeShifter is
		Port( 
				ALU_Shifter : in STD_LOGIC_VECTOR(11 downto 0); 
				shifter_immd: out STD_LOGIC_VECTOR(7 downto 0);
				shifter_immd_addr: out STD_LOGIC_VECTOR(7 downto 0);
				shifter_reg_addr: out STD_LOGIC_VECTOR(7 downto 0)
			 );
	end component DecodeShifter;
	
	component DecodeBranch is
		Port( 
				mem_regs : in t_MemRegister_15_32;
				Branch_Target : in STD_LOGIC_VECTOR(19 downto 0)
			 );
		end component DecodeBranch;
	
	component DecodeDataMove is
		Port( 
				mem_regs : in t_MemRegister_15_32;
				Rd_addr : in STD_LOGIC_VECTOR(3 downto 0);
				Rd : out STD_LOGIC_VECTOR(31 downto 0)
			 );
	end component DecodeDataMove;
	
	component DecodeAddrMode is
		Port( 
				AddrMode : in STD_LOGIC_VECTOR(11 downto 0); 
				addrmode_immd: out STD_LOGIC_VECTOR(7 downto 0);
				addrmode_immd_addr: out STD_LOGIC_VECTOR(7 downto 0);
				addrmode_reg_addr: out STD_LOGIC_VECTOR(7 downto 0)
			 );
	end component DecodeAddrMode;
		
begin

	Decode : DecodeOpcode port map
	(
		instruction, 
		ALU_Rd_addr => ALU_Rd_addr, 
		ALU_Rn_addr => ALU_Rn_addr, 
		ALU_Shifter => ALU_Shifter, 
		Branch_Target => Branch_Target, 
		DataMove_Rd_addr => DataMove_Rd_addr, 
		DataMove_AddrMode => DataMove_AddrMode, 
		System_Data => System_Data
	);
	
	Decode_ALU : DecodeALU port map
	(
		mem_regs,
		Rd_addr => ALU_Rd_addr, 
		Rn_addr => ALU_Rn_addr, 
		Rd => ALU_Rd,
		Rn => ALU_Rn
	);
	
	Decode_Shifter : DecodeShifter port map
	(
		ALU_Shifter => ALU_Shifter, 
		shifter_immd => shifter_immd,
		shifter_immd_addr => shifter_immd_addr,
		shifter_reg_addr => shifter_reg_addr
	);
		
	Decode_DataMove : DecodeDataMove port map
	(
		mem_regs,
		Rd_addr => DataMove_Rd_addr, 
		Rd => DataMove_Rd
	);
	
	Decode_AddrMode : DecodeAddrMode port map
	(
		AddrMode => DataMove_AddrMode, 
		addrmode_immd => addrmode_immd,
		addrmode_immd_addr => addrmode_immd_addr,
		addrmode_reg_addr => addrmode_reg_addr
	);
	
	Decode_Branch : DecodeBranch port map
	(
		mem_regs,
		Branch_Target => Branch_Target
	);
	
end Behavioral;


