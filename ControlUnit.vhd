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
				programdata : in t_MemProgramData_32_32;
				instr : out STD_LOGIC_VECTOR(31 downto 0)
			 );
	end component Fetch;
	
	component Decode is  
		Port( 
				instruction : in STD_LOGIC_VECTOR(31 downto 0); 
				mem_regs : in t_MemRegister_15_32;
				op_alu : out STD_LOGIC_VECTOR(7 downto 0);  
				op_branch : out STD_LOGIC_VECTOR(7 downto 0); 
				op_mem : out STD_LOGIC_VECTOR(7 downto 0); 
				op_system : out STD_LOGIC_VECTOR(7 downto 0);
				Rd_addr : out STD_LOGIC_VECTOR(3 downto 0);
				Rd : out STD_LOGIC_VECTOR(31 downto 0);
				Rn : out STD_LOGIC_VECTOR(31 downto 0);
				op3 : out STD_LOGIC_VECTOR(31 downto 0);
				shifter : out STD_LOGIC_VECTOR(11 downto 0);
				addr_mode : out STD_LOGIC_VECTOR(11 downto 0)
			 );
	end component Decode;
	
	component Execute is  
		Port( 
				clock : in STD_LOGIC;
				op_alu : in STD_LOGIC_VECTOR(7 downto 0);  
				op_branch : in STD_LOGIC_VECTOR(7 downto 0); 
				op_mem : in STD_LOGIC_VECTOR(7 downto 0); 
				op_system : in STD_LOGIC_VECTOR(7 downto 0);
				Rd_addr : in STD_LOGIC_VECTOR(3 downto 0); 
				operand1 : in STD_LOGIC_VECTOR(31 downto 0); 
				operand2 : in STD_LOGIC_VECTOR(31 downto 0); 
				operand3 : in STD_LOGIC_VECTOR(31 downto 0); 
				nextpc : out STD_LOGIC;
				endprogram : out STD_LOGIC;
				mem_regs : inout t_MemRegister_15_32
			);
	end component Execute;
	
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
	
	
	signal RegD_Addr : STD_LOGIC_VECTOR(3 downto 0);
	signal RegD : STD_LOGIC_VECTOR(31 downto 0);
	signal RegN : STD_LOGIC_VECTOR(31 downto 0);
	signal Op3 : STD_LOGIC_VECTOR(31 downto 0);
	signal Shift : STD_LOGIC_VECTOR(11 downto 0);
	signal AddrMode : STD_LOGIC_VECTOR(11 downto 0);
	
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
	
	signal memregion_register : t_MemRegister_15_32 := 
	(
		X"00000000", X"00000000", X"00000000", X"00000000",
		X"00000000", X"00000000", X"00000000", X"00000000",
		X"00000000", X"00000000", X"00000000", X"00000000",
		X"00000000", X"00000000", X"00000000"
	);
	 
begin
	
	-- Set start PC	
	--R1 <= X"00000000";
	
	
	FetchInstruction : Fetch port map(clock, R1, memregion_program, R2);

	DecodeInstruction : Decode port map 
	(
		R2,
		memregion_register,
		exec_alu,  	
		exec_mem,
		exec_branch,
		exec_system,
		RegD_Addr,
		RegD,
		RegN,
		Op3,
		Shift,
		AddrMode
	);
	
	ExecuteCommand: Execute port map
	(
		clock,
		
		exec_alu,  	
		exec_mem,
		exec_branch,
		exec_system,	
		
		RegD_Addr,
		RegD,
		RegN,
		Op3,
		
		exec_getpc,
		endexecution, 
		mem_regs(R1_addr) => R1, 
		mem_regs(R2_addr) => R2, 
		mem_regs(R3_addr) => R3, 
		mem_regs(R4_addr) => R4, 
		mem_regs(R5_addr) => R5, 
		mem_regs(R6_addr) => R6, 
		mem_regs(R7_addr) => R7, 
		mem_regs(R8_addr) => R8, 
		mem_regs(R9_addr) => R9, 
		mem_regs(R10_addr) => R10, 
		mem_regs(R11_addr) => R11, 
		mem_regs(R12_addr) => R12, 
		mem_regs(R13_addr) => R13, 
		mem_regs(R14_addr) => R14, 
		mem_regs(R15_addr) => R15
	);
	
	GetPC : GetNextPC port map(clock, exec_getpc, R1);	
	
end architecture Behavioral;

