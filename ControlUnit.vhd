----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:06:01 11/17/2013 
-- Design Name: 
-- Module Name:    ControlUnit - Behavioral 
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

entity ControlUnit is
    Port( 
			clock : in STD_LOGIC;
			reset : in STD_LOGIC;
			result : out STD_LOGIC
		  );
			
end ControlUnit;


-------------------------------------
-- component ControlUnit()
--		MemoryInit()
--		LoadInstructions()
--		SetFirstPC()
--		Fetch(in pc, out instr)
--		Decode(in instr, out pc)
--		GetNextPC(out pc)
-- end component
-------------------------------------
	
architecture Behavioral of ControlUnit is

	------------------------------------
	-- Component definitions 
	------------------------------------
	component Fetch is 
		Port( 
				clock : in STD_LOGIC; 
				pc : in STD_LOGIC_VECTOR(31 downto 0);
				instr : out STD_LOGIC_VECTOR(31 downto 0)
			 );
	end component Fetch;
	
	component Decode is  
		Port( 
				instruction : in STD_LOGIC_VECTOR(31 downto 0); 
				op_alu : out STD_LOGIC_VECTOR(7 downto 0);  
				op_branch : out STD_LOGIC_VECTOR(7 downto 0); 
				op_datamove : out STD_LOGIC_VECTOR(7 downto 0); 
				op_system : out STD_LOGIC_VECTOR(7 downto 0);
				ALU_Rd_addr : out STD_LOGIC_VECTOR(3 downto 0);
				ALU_Rn1 : out STD_LOGIC_VECTOR(31 downto 0);
				ALU_Rn2 : out STD_LOGIC_VECTOR(31 downto 0);
				DataMove_Rd_addr : out STD_LOGIC_VECTOR(3 downto 0);
				DataMove_Rd : out STD_LOGIC_VECTOR(31 downto 0);
				immd_word : out STD_LOGIC_VECTOR(31 downto 0);
				memaddr_offset : out STD_LOGIC_VECTOR(31 downto 0)
			 );
	end component Decode;
	
	component Execute is  
		Port( 
				op_alu : in STD_LOGIC_VECTOR(7 downto 0);  
				op_branch : in STD_LOGIC_VECTOR(7 downto 0); 
				op_datamove : in STD_LOGIC_VECTOR(7 downto 0); 
				op_system : in STD_LOGIC_VECTOR(7 downto 0);
				ALU_op1 : in STD_LOGIC_VECTOR(31 downto 0); 
				ALU_op2 : in STD_LOGIC_VECTOR(31 downto 0);  
				memaddr_offset : in STD_LOGIC_VECTOR(31 downto 0); 
				ALU_out : out STD_LOGIC_VECTOR(31 downto 0);   
				effective_addr : out STD_LOGIC_VECTOR(31 downto 0);  
				nextpc : out STD_LOGIC;
				endprogram : out STD_LOGIC
			);
	end component Execute;
	
	component MemoryAccess is
		Port( 
				Rd : in STD_LOGIC_VECTOR(31 downto 0);							-- Word input from Decode (str)
				effective_addr : in STD_LOGIC_VECTOR(31 downto 0);			-- ldr word memory addr location/str dest memory addr
				mem_word : out STD_LOGIC_VECTOR(31 downto 0)					-- word retrieved from mem to load (ldr)
			 );
	end component MemoryAccess;
	
	component GetNextPC is 
		Port( 
				clock : in STD_LOGIC;
				nextpc : in STD_LOGIC;	
			   pc : out STD_LOGIC_VECTOR(31 downto 0)
			 );
	end component GetNextPC;
	
	
	------------------------------------
	-- ControlUnit signals
	------------------------------------
	
	signal endexecution : STD_LOGIC;
	signal exec_getpc : STD_LOGIC;
	
	-- Registers
	signal R1  : STD_LOGIC_VECTOR(31 downto 0);
	signal R2  : STD_LOGIC_VECTOR(31 downto 0);
	signal R3  : STD_LOGIC_VECTOR(31 downto 0);
	signal R4  : STD_LOGIC_VECTOR(31 downto 0);
	signal R5  : STD_LOGIC_VECTOR(31 downto 0);
	signal R6  : STD_LOGIC_VECTOR(31 downto 0);
	signal R7  : STD_LOGIC_VECTOR(31 downto 0);
	signal R8  : STD_LOGIC_VECTOR(31 downto 0);
	signal R9  : STD_LOGIC_VECTOR(31 downto 0);
	signal R10 : STD_LOGIC_VECTOR(31 downto 0);
	signal R11 : STD_LOGIC_VECTOR(31 downto 0);
	signal R12 : STD_LOGIC_VECTOR(31 downto 0);
	signal R13 : STD_LOGIC_VECTOR(31 downto 0);
	signal R14 : STD_LOGIC_VECTOR(31 downto 0);
	signal R15 : STD_LOGIC_VECTOR(31 downto 0);
	
	-- Command signals
	signal exec_alu  	 : STD_LOGIC_VECTOR(7 downto 0);
	signal exec_mem  	 : STD_LOGIC_VECTOR(7 downto 0);
	signal exec_branch : STD_LOGIC_VECTOR(7 downto 0);
	signal exec_system : STD_LOGIC_VECTOR(7 downto 0);
	
	
	signal Rd_addr : STD_LOGIC_VECTOR(3 downto 0);
	signal ALU_Rn1 : STD_LOGIC_VECTOR(31 downto 0);
	signal ALU_Rn2 : STD_LOGIC_VECTOR(31 downto 0);
	signal ALU_out : STD_LOGIC_VECTOR(31 downto 0);
	
	signal DataMove_Rd_Addr : STD_LOGIC_VECTOR(3 downto 0);
	signal DataMove_Rd : STD_LOGIC_VECTOR(31 downto 0);
	signal immd_word : STD_LOGIC_VECTOR(31 downto 0);
	signal memaddr_offset : STD_LOGIC_VECTOR(31 downto 0);
	signal effective_address : STD_LOGIC_VECTOR(31 downto 0);
	
	signal load_mem_word : STD_LOGIC_VECTOR(31 downto 0);
	 
begin
	
	FetchInstruction : Fetch port map
	(
		clock, 
		R1, 
		R2
	);

	DecodeInstruction : Decode port map 
	(
		instruction => R2,
		op_alu => exec_alu,  
		op_branch => exec_branch,	
		op_datamove => exec_mem,
		op_system => exec_system,
		ALU_Rd_addr => Rd_addr,
		ALU_Rn1 => ALU_Rn1,
		ALU_Rn2 => ALU_Rn2,
		DataMove_Rd_Addr => DataMove_Rd_Addr,
		DataMove_Rd => DataMove_Rd,
		immd_word => immd_word,
		memaddr_offset => memaddr_offset
	);
	
	
	ExecuteCommand : Execute port map
	(
		op_alu => exec_alu,  	
		op_branch => exec_branch,
		op_datamove => exec_mem,
		op_system => exec_system,	
		ALU_op1 => ALU_Rn1,
		ALU_op2 => ALU_Rn2,
		memaddr_offset => memaddr_offset,
		ALU_out => ALU_out,
		effective_addr => effective_address,
		nextpc => exec_getpc,
		endprogram => endexecution
	);
	
	MemAccess : MemoryAccess port map
	(
		Rd => DataMove_Rd,
		effective_addr => effective_address,
		mem_word => load_mem_word
	);
	
	GetPC : GetNextPC port map(clock, exec_getpc, R1);	
	
end architecture Behavioral;

