--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   22:52:48 02/04/2014
-- Design Name:   
-- Module Name:   C:/jun/sourcecode/Research/ProtoCPU/Testbench/Testbench_MemRegion_Registers.vhd
-- Project Name:  ProtoCPU
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: MemRegion_Registers
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
 
ENTITY Testbench_MemRegion_Registers IS
END Testbench_MemRegion_Registers;
 
ARCHITECTURE behavior OF Testbench_MemRegion_Registers IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT MemRegion_Registers
    PORT(
         reg_addr : IN  std_logic_vector(3 downto 0);
         reg_word : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal reg_addr : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal reg_word : std_logic_vector(31 downto 0);
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: MemRegion_Registers PORT MAP (
          reg_addr => reg_addr,
          reg_word => reg_word
        );
 
   -- Stimulus process
   stim_proc: process
   begin		

		reg_addr <= "0000";
		wait for 10 ns;
		
		reg_addr <= "0001";
		wait for 10 ns;
		
		reg_addr <= "0010";
		wait for 10 ns;
		
		reg_addr <= "0011";
		wait for 10 ns;
		
		reg_addr <= "0100";
		wait for 10 ns;
		
		reg_addr <= "0101";
		wait for 10 ns;
		
		reg_addr <= "0110";
		wait for 10 ns;
		
		reg_addr <= "0111";
		wait for 10 ns;
		
		reg_addr <= "1000";
		wait for 10 ns;
		
		reg_addr <= "1001";
		wait for 10 ns;
		
		reg_addr <= "1010";
		wait for 10 ns;
		
		reg_addr <= "1011";
		wait for 10 ns;
		
		reg_addr <= "1100";
		wait for 10 ns;
		
		reg_addr <= "1101";
		wait for 10 ns;
		
		reg_addr <= "1110";
		wait for 10 ns;
		
		reg_addr <= "1111";
		wait for 10 ns;

      wait;
   end process;

END;
