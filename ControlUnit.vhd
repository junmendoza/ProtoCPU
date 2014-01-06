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

use cpu_types.ALL;

entity ControlUnit is
    Port ( 
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
		Port( clock : in STD_LOGIC; 
				pc : in STD_LOGIC_VECTOR(31 downto 0);
				programdata : in t_MemProgramData_32_32;
				instr : out STD_LOGIC_VECTOR(31 downto 0)
			 );
	end component Fetch;
	
	component Decode is  
		Port( 
				clock : in STD_LOGIC;
				instruction : in STD_LOGIC_VECTOR(31 downto 0); 
				exec_alu : out STD_LOGIC; 
				exec_logical : out STD_LOGIC; 
				exec_branch : out STD_LOGIC; 
				exec_mem : out STD_LOGIC; 
				exec_system : out STD_LOGIC; 
				command : out STD_LOGIC_VECTOR(15 downto 0)
			 );
	end component Decode;
	
	component Execute is  
		Port( 
				clock : in STD_LOGIC;
				instruction : in STD_LOGIC_VECTOR(31 downto 0); 
				exec_alu : in STD_LOGIC; 
				exec_logical : in STD_LOGIC; 
				exec_branch : in STD_LOGIC; 
				exec_mem : in STD_LOGIC; 
				exec_system : in STD_LOGIC; 
				cmd_id : in STD_LOGIC_VECTOR(15 downto 0); 
				nextpc : out STD_LOGIC;
				endprogram : out STD_LOGIC;
				memregion_register : inout t_MemRegister_15_32
		    );
	end component Execute;
	
	component GetNextPC is 
		Port( clock : in STD_LOGIC;
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
	signal execute_alu  		: STD_LOGIC;
	signal execute_logical  : STD_LOGIC;
	signal execute_branch  	: STD_LOGIC;
	signal execute_mem  		: STD_LOGIC;
	signal execute_system  	: STD_LOGIC;
	signal cmd_id 				: STD_LOGIC_VECTOR(15 downto 0);

	
	------------------------------------
	-- Initialize program region (Instruction Stream)
	-- 32 * 16-bit
	------------------------------------
	signal memregion_program : t_MemProgramData_32_32 := 
	(
		X"00000000", X"00000000", X"00000000", X"00000000",
		X"00000000", X"00000000", X"00000000", X"00000000",
		X"00000000", X"00000000", X"00000000", X"00000000",
		X"00000000", X"00000000", X"00000000", X"00000000",
		X"00000000", X"00000000", X"00000000", X"00000000",
		X"00000000", X"00000000", X"00000000", X"00000000",
		X"00000000", X"00000000", X"00000000", X"00000000",
		X"00000000", X"00000000", X"00000000", X"00000000"	
	);
	 
begin
	
	-- Set start PC	
	--R1 <= X"00000000";
	
	
	FetchInstruction : Fetch port map(clock, R1, memregion_program, R2);

	DecodeInstruction : Decode port map 
	(
		clock,
		R2,
		execute_alu,
		execute_logical,
		execute_branch,
		execute_mem,
		execute_system,
		cmd_id
	);
	
	ExecuteCommand: Execute port map
	(
		clock,
		R2,
		execute_alu,
		execute_logical,
		execute_branch,
		execute_mem,
		execute_system,
		cmd_id,
		endexecution, 
		exec_getpc,
		
		memregion_register(R1_addr) => R1, 
		memregion_register(R2_addr) => R2, 
		memregion_register(R3_addr) => R3, 
		memregion_register(R4_addr) => R4, 
		memregion_register(R5_addr) => R5, 
		memregion_register(R6_addr) => R6, 
		memregion_register(R7_addr) => R7, 
		memregion_register(R8_addr) => R8, 
		memregion_register(R9_addr) => R9, 
		memregion_register(R10_addr) => R10, 
		memregion_register(R11_addr) => R11, 
		memregion_register(R12_addr) => R12, 
		memregion_register(R13_addr) => R13, 
		memregion_register(R14_addr) => R14, 
		memregion_register(R15_addr) => R15
	);
	
	GetPC : GetNextPC port map(clock, exec_getpc, R1);	
	
end architecture Behavioral;

