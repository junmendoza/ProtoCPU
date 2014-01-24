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

-- type <new_type> is
--  record
--    <type_name>        : std_logic_vector( 7 downto 0);
--    <type_name>        : std_logic;
-- end record;
--
-- Declare constants
--
-- constant <constant_name>		: time := <time_unit> ns;
-- constant <constant_name>		: integer := <value;
--
-- Declare functions and procedure
--
-- function <function_name>  (signal <signal_name> : in <type_declaration>) return <type_declaration>;
-- procedure <procedure_name> (<type_declaration> <constant_name>	: in <type_declaration>);
--
	
	-- Declare the constant max size of the program data
	type t_MemProgramData_32_32 is array (0 to 31) of STD_LOGIC_VECTOR(31 downto 0);
	
	-- Declare the constant max size of the register region
	type t_MemRegister_15_32 is array (0 to 14) of STD_LOGIC_VECTOR(31 downto 0);
	
	-- CPU Registers address
	constant R1_addr  : integer := 0; 	-- PC
	constant R2_addr  : integer := 1; 	-- IR
	constant R3_addr  : integer := 2; 	-- SP
	constant R4_addr  : integer := 3; 	-- PSR
	constant R5_addr  : integer := 4; 	-- GPR
	constant R6_addr  : integer := 5; 	-- GPR
	constant R7_addr  : integer := 6; 	-- GPR
	constant R8_addr  : integer := 7; 	-- GPR
	constant R9_addr  : integer := 8; 	-- GPR
	constant R10_addr : integer := 9; 	-- GPR
	constant R11_addr : integer := 10;  -- GPR
	constant R12_addr : integer := 11;  -- GPR
	constant R13_addr : integer := 12;  -- GPR
	constant R14_addr : integer := 13;  -- GPR
	constant R15_addr : integer := 14;  -- GPR
	
	
--	-- command types
--	subtype cmd_type_size is STD_LOGIC_VECTOR(15 downto 0);
--	constant cmd_type_alu : cmd_type_size := X"0000";
--	constant cmd_type_br  : cmd_type_size := X"0001";
--	constant cmd_type_mem : cmd_type_size := X"0002";
--	constant cmd_type_sys : cmd_type_size := X"0003";
--	
--	
	-- command id
	subtype cmd_id_size is STD_LOGIC_VECTOR(7 downto 0);
	constant alu_add  : cmd_id_size := X"00";
	constant alu_sub  : cmd_id_size := X"01";
	constant alu_mul  : cmd_id_size := X"02";
	constant alu_div  : cmd_id_size := X"03";
	constant alu_and  : cmd_id_size := X"04";
	constant alu_nand : cmd_id_size := X"05";
	constant alu_or   : cmd_id_size := X"06";
	constant alu_nor  : cmd_id_size := X"07";
	constant alu_xor  : cmd_id_size := X"08";
	constant alu_xnor : cmd_id_size := X"09";
	constant alu_not  : cmd_id_size := X"0A";
	constant alu_shl  : cmd_id_size := X"0B";
	constant alu_shr  : cmd_id_size := X"0C";
	
	constant mem_mov  : cmd_id_size := X"0D";
	constant mem_ldr  : cmd_id_size := X"0E";
	constant mem_str  : cmd_id_size := X"0F";
	constant mem_push : cmd_id_size := X"10";
	constant mem_pop  : cmd_id_size := X"11";
	
	constant br_jmp   : cmd_id_size := X"12";
	
	constant sys_int  : cmd_id_size := X"13";
	
	constant cmd_none : cmd_id_size := X"14";
	
	
	-- Instruction operation type
	constant optype_alu  : STD_LOGIC_VECTOR(3 downto 0) := "0000";
	constant optype_datamove  : STD_LOGIC_VECTOR(3 downto 0) := "0001";
	constant optype_branch  : STD_LOGIC_VECTOR(3 downto 0) := "0010";
	constant optype_compare  : STD_LOGIC_VECTOR(3 downto 0) := "0011";
	constant optype_system  : STD_LOGIC_VECTOR(3 downto 0) := "0100";

end cpu_types;

package body cpu_types is

---- Example 1
--  function <function_name>  (signal <signal_name> : in <type_declaration>  ) return <type_declaration> is
--    variable <variable_name>     : <type_declaration>;
--  begin
--    <variable_name> := <signal_name> xor <signal_name>;
--    return <variable_name>; 
--  end <function_name>;

---- Example 2
--  function <function_name>  (signal <signal_name> : in <type_declaration>;
--                         signal <signal_name>   : in <type_declaration>  ) return <type_declaration> is
--  begin
--    if (<signal_name> = '1') then
--      return <signal_name>;
--    else
--      return 'Z';
--    end if;
--  end <function_name>;

---- Procedure Example
--  procedure <procedure_name>  (<type_declaration> <constant_name>  : in <type_declaration>) is
--    
--  begin
--    
--  end <procedure_name>;
 
end cpu_types;
