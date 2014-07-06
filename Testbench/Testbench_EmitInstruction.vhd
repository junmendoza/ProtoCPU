--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   22:27:21 07/06/2014
-- Design Name:   
-- Module Name:   D:/jun/Research/git/ProtoCPU/Testbench/Testbench_EmitInstruction.vhd
-- Project Name:  ProtoCPU
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: EmitInstruction
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
 
ENTITY Testbench_EmitInstruction IS
END Testbench_EmitInstruction;
 
ARCHITECTURE behavior OF Testbench_EmitInstruction IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT EmitInstruction
    PORT(
         clock : IN  std_logic;
         reset : IN  std_logic;
         instruction : IN  std_logic_vector(31 downto 0);
         LCDDataBus : OUT  std_logic_vector(7 downto 0);
         LCDControl : OUT  std_logic_vector(2 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clock : std_logic := '0';
   signal reset : std_logic := '1';
   signal instruction : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal LCDDataBus : std_logic_vector(7 downto 0);
   signal LCDControl : std_logic_vector(2 downto 0);

   -- Clock period definitions
   constant clock_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: EmitInstruction PORT MAP (
          clock => clock,
          reset => reset,
          instruction => instruction,
          LCDDataBus => LCDDataBus,
          LCDControl => LCDControl
        );

   -- Stimulus process
   stim_proc: process
   begin		
			
		-- cycle
		clock <= '1';
		wait for 10 ns;
		
		clock <= '0';
		wait for 10 ns;
		
		reset <= '0';
		wait for 10 ns;

		
		-- cycle
		clock <= '1';
		wait for 10 ns;
		clock <= '0';
		wait for 10 ns;
		
		-- cycle
		clock <= '1';
		wait for 10 ns;
		clock <= '0';
		wait for 10 ns;
		
		-- cycle
		clock <= '1';
		wait for 10 ns;
		clock <= '0';
		wait for 10 ns;
		
		-- cycle
		clock <= '1';
		wait for 10 ns;
		clock <= '0';
		wait for 10 ns;
		
		-- cycle
		clock <= '1';
		wait for 10 ns;
		clock <= '0';
		wait for 10 ns;
		
		-- cycle
		clock <= '1';
		wait for 10 ns;
		clock <= '0';
		wait for 10 ns;
      wait;
   end process;

END;
