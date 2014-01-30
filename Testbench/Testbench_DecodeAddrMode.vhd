--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   15:22:54 01/29/2014
-- Design Name:   
-- Module Name:   C:/jun/sourcecode/Research/ProtoCPU/Testbench/Testbench_DecodeAddrMode.vhd
-- Project Name:  ProtoCPU
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: DecodeAddrMode
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
 
ENTITY Testbench_DecodeAddrMode IS
END Testbench_DecodeAddrMode;
 
ARCHITECTURE behavior OF Testbench_DecodeAddrMode IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT DecodeAddrMode
    PORT(
         AddrMode : IN  std_logic_vector(11 downto 0);
         addrmode_immd : OUT  std_logic_vector(7 downto 0);
         addrmode_immd_addr : OUT  std_logic_vector(7 downto 0);
         addrmode_reg_addr : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal instruction : std_logic_vector(31 downto 0) := (others => '0');
   signal AddrMode : std_logic_vector(11 downto 0) := (others => '0');

 	--Outputs
   signal addrmode_immd : std_logic_vector(7 downto 0);
   signal addrmode_immd_addr : std_logic_vector(7 downto 0);
   signal addrmode_reg_addr : std_logic_vector(7 downto 0);
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: DecodeAddrMode PORT MAP (
          AddrMode => AddrMode,
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
		--instruction <= "00001110000001010000000000001010"; 
		AddrMode <= "000000001010";
		wait for 10 ns;
		

		-- [1] str R5, 0x0000000B
		-- str
		-- 31-24		23-20		19-16		15-12			11-0
		-- opcode	cond		Rd			Reserved 	address mode
		--instruction <= "00001111000001010000000100001011"; 
		AddrMode <= "000100001011";
		wait for 10 ns;
		
		
		-- [2] ldr R5, 0x0000000B
		-- ldr
		-- 31-24		23-20		19-16		15-12			11-0
		-- opcode	cond		Rd			Reserved 	address mode
		--instruction <= "00001110000001010000000100001011"; 
		AddrMode <= "000100001011";
		wait for 10 ns;
		
		
		-- [3] ldr R6, %2		
		-- ldr
		-- 31-24		23-20		19-16		15-12			11-0
		-- opcode	cond		Rd			Reserved 	address mode
		--instruction <= "00001110000001100000000000000010"; 
		AddrMode <= "000000000010";
		wait for 10 ns;
		
		-- [4] add R5, R5, R6
		-- add
		-- 31-24		23-20		19-16		15-12		11-0 		
		-- opcode	cond		Rd			Rn			Shifter
		--instruction <= "00000000000001010101001000000110"; 
		AddrMode <= "001000000110";
		wait for 10 ns;
		
		
		-- [5] str R5, 0x0000000F
		-- str
		-- 31-24		23-20		19-16		15-12			11-0
		-- opcode	cond		Rd			Reserved 	address mode
		--instruction <= "00001111000001010000000100001111"; 
		AddrMode <= "000100001111";
		wait for 10 ns;

      wait;
   end process;

END;
