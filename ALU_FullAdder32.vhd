----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:31:47 11/03/2013 
-- Design Name: 
-- Module Name:    alu_fulladder8 - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
library UNISIM;
use UNISIM.VComponents.all;

entity alu_adder32 is
	Port( 
			exec_add : in STD_LOGIC;
			vA : in STD_LOGIC_VECTOR (31 downto 0);
			vB : in STD_LOGIC_VECTOR (31 downto 0);
			vS : out STD_LOGIC_VECTOR (31 downto 0)
		 );
			  
end alu_adder32;

architecture Behavioral of alu_adder32 is

	signal op1 : integer;
	signal op2 : integer;
	signal op3 : integer;

begin
		proc_add : process(exec_add)
		begin
			op1 <= to_integer(unsigned(vA));
			op2 <= to_integer(unsigned(vB));
			op3 <= op1 + op2;	
			vS <= std_logic_vector(to_unsigned(op3, 32));
		end process proc_add;
		
end Behavioral;

