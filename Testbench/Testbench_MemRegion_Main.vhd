--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   22:45:13 02/04/2014
-- Design Name:   
-- Module Name:   C:/jun/sourcecode/Research/ProtoCPU/Testbench/Testbench_MemRegion_Main.vhd
-- Project Name:  ProtoCPU
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: MemRegion_Main
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
 
ENTITY Testbench_MemRegion_Main IS
END Testbench_MemRegion_Main;
 
ARCHITECTURE behavior OF Testbench_MemRegion_Main IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT MemRegion_Main
    PORT(
         offset : IN  std_logic_vector(31 downto 0);
         mem_word : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal offset : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal mem_word : std_logic_vector(31 downto 0);
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: MemRegion_Main PORT MAP (
          offset => offset,
          mem_word => mem_word
        );

   -- Stimulus process
   stim_proc: process
   begin		
	
		offset <= X"00000000";
		wait for 10 ns;
		
		offset <= X"00000001";
		wait for 10 ns;
		
		offset <= X"00000002";
		wait for 10 ns;
		
		offset <= X"00000003";
		wait for 10 ns;
		
		offset <= X"00000004";
		wait for 10 ns;
		
		offset <= X"00000005";
		wait for 10 ns;
		
		offset <= X"00000006";
		wait for 10 ns;
		
		offset <= X"00000007";
		wait for 10 ns;
		
		offset <= X"00000008";
		wait for 10 ns;
		
		offset <= X"00000009";
		wait for 10 ns;
		
		offset <= X"0000000A";
		wait for 10 ns;
		
		offset <= X"0000000B";
		wait for 10 ns;
		
		offset <= X"0000000C";
		wait for 10 ns;
		
		offset <= X"0000000D";
		wait for 10 ns;
		
		offset <= X"0000000E";
		wait for 10 ns;
		
		offset <= X"0000000F";
		wait for 10 ns;
		
      wait;
   end process;

END;
