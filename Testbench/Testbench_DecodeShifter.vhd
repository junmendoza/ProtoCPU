--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   14:58:09 01/29/2014
-- Design Name:   
-- Module Name:   C:/jun/sourcecode/Research/ProtoCPU/Testbench/Testbench_DecodeShifter.vhd
-- Project Name:  ProtoCPU
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: DecodeShifter
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
 
use work.cpu_types.all;
 
ENTITY Testbench_DecodeShifter IS
END Testbench_DecodeShifter;
 
ARCHITECTURE behavior OF Testbench_DecodeShifter IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT DecodeShifter
    PORT(
         ALU_Shifter : IN  std_logic_vector(11 downto 0);
         shifter_immd : OUT  std_logic_vector(7 downto 0);
         shifter_immd_addr : OUT  std_logic_vector(7 downto 0);
         shifter_reg_addr : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal instruction : std_logic_vector(31 downto 0) := (others => '0');
   signal ALU_Shifter : std_logic_vector(11 downto 0) := (others => '0');

 	--Outputs
   signal shifter_immd : std_logic_vector(7 downto 0);
   signal shifter_immd_addr : std_logic_vector(7 downto 0);
   signal shifter_reg_addr : std_logic_vector(7 downto 0);
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: DecodeShifter PORT MAP (
          ALU_Shifter => ALU_Shifter,
          shifter_immd => shifter_immd,
          shifter_immd_addr => shifter_immd_addr,
          shifter_reg_addr => shifter_reg_addr
        );
		  
   -- Stimulus process
   stim_proc: process
   begin		
	
		wait for 10 ns;
		
		-- [0] ldr R5, %10	
		-- [1] str R5, 0x0000000B
		-- [2] ldr R5, 0x0000000B
		-- [3] ldr R6, %2	
		-- [4] add R5, R5, R6
		-- [5] str R5, 0x0000000F
	
		
		-- shifter - immediate
		-- add R5, R5, #12
		-- 31-24		23-20		19-16		15-12		11-0 		
		-- opcode	cond		Rd			Rn			Shifter
		--instruction <= "00000000000001010101000000001100"; 
		ALU_Shifter <= "000000001100";
		wait for 10 ns;
		
		-- shifter - mem address
		-- add R5, R5, 0x0A
		-- 31-24		23-20		19-16		15-12		11-0 		
		-- opcode	cond		Rd			Rn			Shifter
		--instruction <= "00000000000001010101000100001010"; 
		ALU_Shifter <= "000100001010";
		wait for 10 ns;
		
		-- shifter - register
		-- add R5, R5, R6
		-- 31-24		23-20		19-16		15-12		11-0 		
		-- opcode	cond		Rd			Rn			Shifter
		--instruction <= "00000000000001010101001000000110"; 
		ALU_Shifter <= "001000000110";
		wait for 10 ns;
		
      wait;
   end process;

END;
