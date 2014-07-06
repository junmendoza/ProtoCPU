--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   00:42:43 07/07/2014
-- Design Name:   
-- Module Name:   D:/jun/Research/git/ProtoCPU/Testbench/Testbench_LCDInterface.vhd
-- Project Name:  ProtoCPU
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: LCDInterface
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
 
ENTITY Testbench_LCDInterface IS
END Testbench_LCDInterface;
 
ARCHITECTURE behavior OF Testbench_LCDInterface IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT LCDInterface
    PORT(
         sel : IN  std_logic;
         init_LCDDataBus : IN  std_logic_vector(7 downto 0);
         init_LCDControl : IN  std_logic_vector(2 downto 0);
         write_LCDDataBus : IN  std_logic_vector(7 downto 0);
         write_LCDControl : IN  std_logic_vector(2 downto 0);
         LCDDataBus : OUT  std_logic_vector(7 downto 0);
         LCDControl : OUT  std_logic_vector(2 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal sel : std_logic := '0';
   signal init_LCDDataBus : std_logic_vector(7 downto 0) := (others => '0');
   signal init_LCDControl : std_logic_vector(2 downto 0) := (others => '0');
   signal write_LCDDataBus : std_logic_vector(7 downto 0) := (others => '0');
   signal write_LCDControl : std_logic_vector(2 downto 0) := (others => '0');

 	--Outputs
   signal LCDDataBus : std_logic_vector(7 downto 0);
   signal LCDControl : std_logic_vector(2 downto 0);

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: LCDInterface PORT MAP (
          sel => sel,
          init_LCDDataBus => init_LCDDataBus,
          init_LCDControl => init_LCDControl,
          write_LCDDataBus => write_LCDDataBus,
          write_LCDControl => write_LCDControl,
          LCDDataBus => LCDDataBus,
          LCDControl => LCDControl
        );
 

   -- Stimulus process
   stim_proc: process
   begin		
		
		sel <= '0';
		init_LCDDataBus <= "11111111";
		init_LCDControl <= "111";
		wait for 10 ns;
		
		
		sel <= '1';
		write_LCDDataBus <= "10101010";
		write_LCDControl <= "101";
		wait for 10 ns;
		
		
		sel <= '1';
		write_LCDDataBus <= "01010101";
		write_LCDControl <= "010";
		wait for 10 ns;

      wait;
   end process;

END;
