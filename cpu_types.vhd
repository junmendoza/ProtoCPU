--
--	Package File Template
--
--	Purpose: This package defines supplemental types, subtypes, 
--		 constants, and functions 
--
--   To use any of the example code shown below, uncomment the lines and modify as necessary
--

library IEEE;
use IEEE.STD_LOGIC_1164.all;

package cpu_types is

	
	-- Declare the constant max size of the program data
	type t_MemProgramData_32_32 is array (0 to 31) of STD_LOGIC_VECTOR(31 downto 0);
	
	-- Declare the constant max size of the register region
	type t_MemRegister_15_32 is array (0 to 14) of STD_LOGIC_VECTOR(31 downto 0);
	
	type t_MemRegion_Main is array (0 to 63) of STD_LOGIC_VECTOR(31 downto 0);
	type t_MemRegion_Regs is array (0 to 14) of STD_LOGIC_VECTOR(31 downto 0);
	type t_MemRegion_Program is array (0 to 63) of STD_LOGIC_VECTOR(31 downto 0);
	
	-- CPU Registers address
	constant R1_addr  : STD_LOGIC_VECTOR(3 downto 0) := X"0";	-- PC
	constant R2_addr  : STD_LOGIC_VECTOR(3 downto 0) := X"1";	-- IR
	constant R3_addr  : STD_LOGIC_VECTOR(3 downto 0) := X"2";	-- SP
	constant R4_addr  : STD_LOGIC_VECTOR(3 downto 0) := X"3";	-- PSR
	constant R5_addr  : STD_LOGIC_VECTOR(3 downto 0) := X"4";	-- GPR
	constant R6_addr  : STD_LOGIC_VECTOR(3 downto 0) := X"5";	-- GPR
	constant R7_addr  : STD_LOGIC_VECTOR(3 downto 0) := X"6";	-- GPR
	constant R8_addr  : STD_LOGIC_VECTOR(3 downto 0) := X"7";	-- GPR
	constant R9_addr  : STD_LOGIC_VECTOR(3 downto 0) := X"8";	-- GPR
	constant R10_addr : STD_LOGIC_VECTOR(3 downto 0) := X"9";	-- GPR
	constant R11_addr : STD_LOGIC_VECTOR(3 downto 0) := X"A";  -- GPR
	constant R12_addr : STD_LOGIC_VECTOR(3 downto 0) := X"B";  -- GPR
	constant R13_addr : STD_LOGIC_VECTOR(3 downto 0) := X"C";  -- GPR
	constant R14_addr : STD_LOGIC_VECTOR(3 downto 0) := X"D";  -- GPR
	constant R15_addr : STD_LOGIC_VECTOR(3 downto 0) := X"E";  -- GPR
	
	
	-- command id
	subtype cmd_id_size is STD_LOGIC_VECTOR(7 downto 0);
	constant alu_add  : cmd_id_size := "00000000"; -- X"00";  0
	constant alu_sub  : cmd_id_size := "00000001"; -- X"01";  1
	constant alu_mul  : cmd_id_size := "00000010"; -- X"02";  2
	constant alu_div  : cmd_id_size := "00000011"; -- X"03";  3
	constant alu_and  : cmd_id_size := "00000100"; -- X"04";  4
	constant alu_nand : cmd_id_size := "00000101"; -- X"05";  5
	constant alu_or   : cmd_id_size := "00000110"; -- X"06";  6
	constant alu_nor  : cmd_id_size := "00000111"; -- X"07";  7
	constant alu_xor  : cmd_id_size := "00001000"; -- X"08";  8
	constant alu_xnor : cmd_id_size := "00001001"; -- X"09";  9
	constant alu_not  : cmd_id_size := "00001010"; -- X"0A"; 10
	constant alu_cmp  : cmd_id_size := "00001011"; -- X"0B"; 11
	constant alu_shl  : cmd_id_size := "00001100"; -- X"0C"; 12
	constant alu_shr  : cmd_id_size := "00001101"; -- X"0D"; 13
	                                            
	constant mem_mov  : cmd_id_size := "00001110"; -- X"0E"; 14
	constant mem_ldr  : cmd_id_size := "00001111"; -- X"0F"; 15
	constant mem_str  : cmd_id_size := "00010000"; -- X"10"; 16
	constant mem_push : cmd_id_size := "00010001"; -- X"11"; 17
	constant mem_pop  : cmd_id_size := "00010010"; -- X"12"; 18
	                                            
	constant br_jmp   : cmd_id_size := "00010011"; -- X"13"; 19
	
	constant sys_int  : cmd_id_size := "00010100"; -- X"14"; 20
	
	constant cmd_none : cmd_id_size := "00010101"; -- X"15"; 21
	
	
	-- comparison
	constant cond_true  : STD_LOGIC_VECTOR(3 downto 0) := X"0";
	constant cond_eq  : STD_LOGIC_VECTOR(3 downto 0) := X"1";
	constant cond_nq  : STD_LOGIC_VECTOR(3 downto 0) := X"2";
	constant cond_gt  : STD_LOGIC_VECTOR(3 downto 0) := X"3";
	constant cond_ge  : STD_LOGIC_VECTOR(3 downto 0) := X"4";
	constant cond_lt  : STD_LOGIC_VECTOR(3 downto 0) := X"5";
	constant cond_le  : STD_LOGIC_VECTOR(3 downto 0) := X"6";
	
	-- PSR flags
	--	31 30 29 28			27-24					23-0
	--	Flags					Flags					Reserved
	--	Z	N	C	V 			Unused				Unused	
	
	constant Z_Flag_BitPos : integer := 31;
	constant N_Flag_BitPos : integer := 30;
	constant C_Flag_BitPos : integer := 29;
	constant V_Flag_BitPos : integer := 28;
	
	
	-- Instruction operation type
	constant optype_alu  : STD_LOGIC_VECTOR(3 downto 0) := "0000";
	constant optype_datamove  : STD_LOGIC_VECTOR(3 downto 0) := "0001";
	constant optype_branch  : STD_LOGIC_VECTOR(3 downto 0) := "0010";
	constant optype_compare  : STD_LOGIC_VECTOR(3 downto 0) := "0011";
	constant optype_system  : STD_LOGIC_VECTOR(3 downto 0) := "0100";
	
	
	-- Decode contants
	constant shft_mode_immd  : STD_LOGIC_VECTOR(3 downto 0) := "0000";
	constant shft_mode_memaddr  : STD_LOGIC_VECTOR(3 downto 0) := "0001";
	constant shft_mode_regaddr  : STD_LOGIC_VECTOR(3 downto 0) := "0010";
	
	constant addrmode_mode_immd  : STD_LOGIC_VECTOR(3 downto 0) := "0000";
	constant addrmode_mode_memaddr  : STD_LOGIC_VECTOR(3 downto 0) := "0001";
	constant addrmode_mode_regaddr  : STD_LOGIC_VECTOR(3 downto 0) := "0010";
	
	-- Memory access
	constant mem_read : STD_LOGIC := '0';
	constant mem_write : STD_LOGIC := '1'; 
	
	constant reg_rw_reset : STD_LOGIC_VECTOR(1 downto 0) := "00";
	constant reg_rw_read1 : STD_LOGIC_VECTOR(1 downto 0) := "01";
	constant reg_rw_read2 : STD_LOGIC_VECTOR(1 downto 0) := "10"; 
	constant reg_rw_write : STD_LOGIC_VECTOR(1 downto 0) := "11"; 

end cpu_types;

package body cpu_types is

 
end cpu_types;
