--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   13:43:53 01/18/2014
-- Design Name:   
-- Module Name:   C:/jun/sourcecode/Research/ProtoCPU/Testbench/Testbench_Decode.vhd
-- Project Name:  ProtoCPU
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Decode
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
use work.cpu_types.all;
 
ENTITY Testbench_Decode IS
END Testbench_Decode;
 
ARCHITECTURE behavior OF Testbench_Decode IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Decode
    PORT(
			instruction : in STD_LOGIC_VECTOR(31 downto 0); 
			mem_regs : in t_MemRegister_15_32;
			op_alu : out STD_LOGIC_VECTOR(7 downto 0);  
			op_branch : out STD_LOGIC_VECTOR(7 downto 0); 
			op_datamove : out STD_LOGIC_VECTOR(7 downto 0); 
			op_system : out STD_LOGIC_VECTOR(7 downto 0);
			Rd_addr : out STD_LOGIC_VECTOR(3 downto 0);
			Rd : out STD_LOGIC_VECTOR(31 downto 0);
			Rn : out STD_LOGIC_VECTOR(31 downto 0);
			shifter_immd : out STD_LOGIC_VECTOR(7 downto 0);
			shifter_immd_addr : out STD_LOGIC_VECTOR(7 downto 0);
			shifter_reg_addr : out STD_LOGIC_VECTOR(7 downto 0);
			addrmode_immd : out STD_LOGIC_VECTOR(7 downto 0);
			addrmode_immd_addr : out STD_LOGIC_VECTOR(7 downto 0);
			addrmode_reg_addr : out STD_LOGIC_VECTOR(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal instruction : std_logic_vector(31 downto 0) := (others => '0');
	
	signal memregion_register : t_MemRegister_15_32 := 
	(
		X"00000000", 
		X"00000000", 
		X"00000000", 
		X"00000000",
		X"00000000", 
		X"00000000", 
		X"00000000", 
		X"00000000",
		X"00000000", 
		X"00000000", 
		X"00000000", 
		X"00000000",
		X"00000000", 
		X"00000000", 
		X"00000000"
	);

 	--Outputs
   signal op_alu : std_logic_vector(7 downto 0);
   signal op_branch : std_logic_vector(7 downto 0);
   signal op_datamove : std_logic_vector(7 downto 0);
   signal op_system : std_logic_vector(7 downto 0);
   signal Rd_addr : std_logic_vector(3 downto 0);
   signal Rd : std_logic_vector(31 downto 0);
   signal Rn : std_logic_vector(31 downto 0);
	signal shifter_immd : STD_LOGIC_VECTOR(7 downto 0);
	signal shifter_immd_addr : STD_LOGIC_VECTOR(7 downto 0);
	signal shifter_reg_addr : STD_LOGIC_VECTOR(7 downto 0);
	signal addrmode_immd : STD_LOGIC_VECTOR(7 downto 0);
	signal addrmode_immd_addr : STD_LOGIC_VECTOR(7 downto 0);
	signal addrmode_reg_addr : STD_LOGIC_VECTOR(7 downto 0);
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Decode PORT MAP (
          instruction => instruction,
          mem_regs => memregion_register,
          op_alu => op_alu,
          op_branch => op_branch,
          op_datamove => op_datamove,
          op_system => op_system,
          Rd_addr => Rd_addr,
          Rn => Rn,
          shifter_immd => shifter_immd,
          shifter_immd_addr => shifter_immd_addr,
          shifter_reg_addr => shifter_reg_addr,
          addrmode_immd => addrmode_immd,
          addrmode_immd_addr => addrmode_immd_addr,
          addrmode_reg_addr => addrmode_reg_addr
        );

   -- Stimulus process
   stim_proc: process
   begin		
	
	
		-- [0] ldr R5, %10	
		-- [1] str R5, 0x0000000B
		-- [2] ldr R5, 0x0000000B
		-- [3] ldr R6, %2	
		-- [4] add R5, R5, R6
		-- [5] str R5, 0x0000000F
		
		
		-- [0] ldr R5, %10		
		-- ldr
		-- 31-24		23-20		19-16		15-12			11-0
		-- opcode	cond		Rd			Reserved 	address mode
		instruction <= "00001110000001010000000000001010"; 
		wait for 10 ns;
		

		-- [1] str R5, 0x0000000B
		-- str
		-- 31-24		23-20		19-16		15-12			11-0
		-- opcode	cond		Rd			Reserved 	address mode
		--instruction <= "00001111000001010000000100001011"; 
		--wait for 10 ns;
		
		
		-- [2] ldr R5, 0x0000000B
		-- ldr
		-- 31-24		23-20		19-16		15-12			11-0
		-- opcode	cond		Rd			Reserved 	address mode
		--instruction <= "00001110000001010000000100001011"; 
		--wait for 10 ns;
		
		
		-- [3] ldr R6, %2		
		-- ldr
		-- 31-24		23-20		19-16		15-12			11-0
		-- opcode	cond		Rd			Reserved 	address mode
		--instruction <= "00001110000001100000000000000010"; 
		--wait for 10 ns;
		
		-- [4] add R5, R5, R6
		-- add
		-- 31-24		23-20		19-16		15-12		11-0 		
		-- opcode	cond		Rd			Rn			Shifter
		--instruction <= "00000000000001010101001000000110"; 
		--wait for 10 ns;
		
		
		-- [5] str R5, 0x0000000F
		-- str
		-- 31-24		23-20		19-16		15-12			11-0
		-- opcode	cond		Rd			Reserved 	address mode
		--instruction <= "00001111000001010000000100001111"; 
		--wait for 10 ns;
		
      wait;
   end process;

END;
