--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   23:10:54 07/02/2014
-- Design Name:   
-- Module Name:   D:/jun/Research/git/ProtoCPU/Testbench/Testbench_InitializeCPU.vhd
-- Project Name:  ProtoCPU
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: InitializeCPU
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
 
ENTITY Testbench_InitializeCPU IS
END Testbench_InitializeCPU;
 
ARCHITECTURE behavior OF Testbench_InitializeCPU IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT InitializeCPU
    PORT(
         clock : IN  std_logic;
         reset : IN  std_logic;
         cpu_init : OUT  std_logic;
         firstPC : OUT  std_logic_vector(31 downto 0);
         LCDDataBus : OUT  std_logic_vector(7 downto 0);
         LCDControl : OUT  std_logic_vector(2 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clock : std_logic := '0';
   signal reset : std_logic := '1';

 	--Outputs
   signal cpu_init : std_logic;
   signal firstPC : std_logic_vector(31 downto 0);
   signal LCDDataBus : std_logic_vector(7 downto 0);
   signal LCDControl : std_logic_vector(2 downto 0);

   -- Clock period definitions
   constant clock_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: InitializeCPU PORT MAP (
          clock => clock,
          reset => reset,
          cpu_init => cpu_init,
          firstPC => firstPC,
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
