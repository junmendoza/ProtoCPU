--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   23:22:44 07/07/2014
-- Design Name:   
-- Module Name:   D:/jun/Research/git/ProtoCPU/Testbench/Testbench_ControlUnitSimulate.vhd
-- Project Name:  ProtoCPU
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: ControlUnitSimulateFetch
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
 
ENTITY Testbench_ControlUnitSimulate IS
END Testbench_ControlUnitSimulate;
 
ARCHITECTURE behavior OF Testbench_ControlUnitSimulate IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ControlUnitSimulateFetch
    PORT(
         clock 	: IN std_logic;
         reset 	: IN std_logic;
         LCD_E 	: OUT std_logic;
         LCD_RS 	: OUT std_logic;
         LCD_RW 	: OUT std_logic;
         LCD_DB 	: OUT std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clock : std_logic := '0';
   signal reset : std_logic := '1';

 	--Outputs
   signal result : std_logic;
   signal LCD_E : std_logic;
   signal LCD_RS : std_logic;
   signal LCD_RW : std_logic;
   signal LCD_DB : std_logic_vector(7 downto 0);
 
	constant clkCycles : integer := 10000000;
	
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ControlUnitSimulateFetch PORT MAP (
          clock => clock,
          reset => reset,
          LCD_E => LCD_E,
          LCD_RS => LCD_RS,
          LCD_RW => LCD_RW,
          LCD_DB => LCD_DB
        );

   -- Stimulus process
   stim_proc: process
	
   begin		
	
		clock <= '1';
		wait for 10 ns;
		clock <= '0';
		
		clock <= '1';
		reset <= '0';
		wait for 10 ns;
		clock <= '0';

		for i in 1 to clkCycles loop
			clock <= not clock;
			wait for 5 ns;
			clock <= not clock;
			wait for 5 ns;
		end loop;

      wait;
   end process;

END;
