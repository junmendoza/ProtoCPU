--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   23:04:48 04/29/2014
-- Design Name:   
-- Module Name:   C:/jun/sourcecode/Research/ProtoCPU/Testbench/Testbench_MemRegion_Main_ReadWrite.vhd
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
 
use work.cpu_types.all;
 
ENTITY Testbench_MemRegion_Main_ReadWrite IS
END Testbench_MemRegion_Main_ReadWrite;
 
ARCHITECTURE behavior OF Testbench_MemRegion_Main_ReadWrite IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT MemRegion_Main
    PORT(
         rw_sel : IN  std_logic;
         offset : IN  std_logic_vector(31 downto 0);
         store_word : IN  std_logic_vector(31 downto 0);
         load_word : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal rw_sel : std_logic := mem_write;
   signal offset : std_logic_vector(31 downto 0) := (others => '0');
   signal store_word : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal load_word : std_logic_vector(31 downto 0);
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: MemRegion_Main PORT MAP (
          rw_sel => rw_sel,
          offset => offset,
          store_word => store_word,
          load_word => load_word
        );

   -- Stimulus process
   stim_proc: process
   begin		
		
		------------------------------
		-- Test Write
		------------------------------
		rw_sel <= mem_write;
	
		store_word <= X"F0000000";
		offset <= X"00000000";
		wait for 10 ns;
		
		store_word <= X"0F000000";
		offset <= X"00000001";
		wait for 10 ns;
		
		store_word <= X"00F00000";
		offset <= X"00000002";
		wait for 10 ns;
		
		store_word <= X"000F0000";
		offset <= X"00000003";
		wait for 10 ns;
		
		store_word <= X"0000F000";
		offset <= X"00000004";
		wait for 10 ns;
		
		store_word <= X"00000F00";
		offset <= X"00000005";
		wait for 10 ns;
		
		store_word <= X"000000F0";
		offset <= X"00000006";
		wait for 10 ns;
		
		store_word <= X"0000000F";
		offset <= X"00000007";
		wait for 10 ns;
		
		------------------------------
		-- Test Read
		------------------------------
		rw_sel <= mem_read;
	
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
		
      wait;
   end process;

END;
