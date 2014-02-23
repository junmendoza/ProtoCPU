----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:02:28 02/23/2014 
-- Design Name: 
-- Module Name:    DecodeCondition - Behavioral 
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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity DecodeJump is
	Port( 
			cond : in STD_LOGIC_VECTOR(3 downto 0);
			NextPC : in STD_LOGIC_VECTOR(31 downto 0);
			ExecNextPC : out STD_LOGIC_VECTOR(31 downto 0)
		  );
end DecodeJump;

architecture Behavioral of DecodeJump is

	component DecodeCondition is
		Port( 
				cond : in STD_LOGIC_VECTOR(3 downto 0);
				cond_eval : out STD_LOGIC
			 );
	end component DecodeCondition;
	
	signal jmp_condition : STD_LOGIC_VECTOR(3 downto 0) := (others => '0');
	signal cond_eval : STD_LOGIC := '0';

begin

	GetCondition : DecodeCondition port map
	(
		cond => jmp_condition,
		cond_eval => cond_eval
	);

	ProcDecodeJump : process(cond)
	
	begin 
	
		jmp_condition <= cond;
		
		-- Send the signal to DecodeCondition to evaluate the condition
		-- Is this wait necessary?
		--wait for 10 ns;
		
		if_jmpcondition_met : if cond_eval = '1' then
			ExecNextPC <= NextPC;
		end if if_jmpcondition_met;
		
	end process ProcDecodeJump;


end Behavioral;

