--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   17:19:46 01/26/2014
-- Design Name:   
-- Module Name:   C:/jun/sourcecode/Research/ProtoCPU/Testbench/Testbench_DecodeALU.vhd
-- Project Name:  ProtoCPU
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: DecodeALU
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
 
ENTITY Testbench_DecodeALU IS
END Testbench_DecodeALU;
 
ARCHITECTURE behavior OF Testbench_DecodeALU IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
	 COMPONENT DecodeALU
		PORT(
				mem_regs : in t_MemRegister_15_32;
				ALU_Rd_addr : in STD_LOGIC_VECTOR(3 downto 0); 
				ALU_Rn_addr : in STD_LOGIC_VECTOR(3 downto 0);
				Rd : out STD_LOGIC_VECTOR(31 downto 0);
				Rn : out STD_LOGIC_VECTOR(31 downto 0)
			 );
	 END COMPONENT;
   
 	--Outputs
	signal ALU_Rd_addr : STD_LOGIC_VECTOR(3 downto 0); 
	signal ALU_Rn_addr : STD_LOGIC_VECTOR(3 downto 0);
   signal Rd : std_logic_vector(31 downto 0);
   signal Rn : std_logic_vector(31 downto 0);
	
	signal memregion_register : t_MemRegister_15_32 := 
	(
		X"00000001", 
		X"00000002", 
		X"00000003",
		X"00000004", 
		X"00000005", 
		X"00000006", 
		X"00000007",
		X"00000008", 
		X"00000009", 
		X"0000000A", 
		X"0000000B",
		X"0000000C", 
		X"0000000D", 
		X"0000000E",
		X"0000000F"
	);
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: DecodeALU PORT MAP (
          mem_regs => memregion_register,
          ALU_Rd_addr => ALU_Rd_addr,
          ALU_Rn_addr => ALU_Rn_addr,
          Rd => Rd,
          Rn => Rn
        );
		  
   -- Stimulus process
   stim_proc: process
   begin		
		
		-- add R5, R5, R6
		-- add
		-- 31-24		23-20		19-16		15-12		11-0 		
		-- opcode	cond		Rd			Rn			Shifter
		--instruction <= "00000000000001010101001000000110"; 
		ALU_Rd_addr <= "0000";
		ALU_Rn_addr <= "0001";
		wait for 10 ns;
		
		ALU_Rd_addr <= "0010";
		ALU_Rn_addr <= "0011";
		wait for 10 ns;
		
		ALU_Rd_addr <= "0100";
		ALU_Rn_addr <= "0101";
		wait for 10 ns;
		
		ALU_Rd_addr <= "0110";
		ALU_Rn_addr <= "0111";
		wait for 10 ns;
		
		ALU_Rd_addr <= "1000";
		ALU_Rn_addr <= "1001";
		wait for 10 ns;
		
		ALU_Rd_addr <= "1010";
		ALU_Rn_addr <= "1011";
		wait for 10 ns;
		
		ALU_Rd_addr <= "1100";
		ALU_Rn_addr <= "1101";
		wait for 10 ns;
		
      wait;
   end process;

END;
