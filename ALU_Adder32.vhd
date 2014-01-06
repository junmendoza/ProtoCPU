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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity adder32 is
    Port( clock : in STD_LOGIC;
			 vA : in STD_LOGIC_VECTOR (31 downto 0);
			 vB : in STD_LOGIC_VECTOR (31 downto 0);
          vS : out STD_LOGIC_VECTOR (31 downto 0)
			);
			  
end adder32;

architecture Behavioral of adder32 is

	component fulladder 
		 Port( a : in  STD_LOGIC;
				 b : in  STD_LOGIC;
				 c : in  STD_LOGIC;
				 s_out : out  STD_LOGIC;
				 c_out : out  STD_LOGIC);
	end component;

	signal carry : STD_LOGIC_VECTOR (31 downto 0);

begin

	A1 :  fulladder port map (vA(0),  vB(0),  '0', 			vS(0),  carry(0));
	A2 :  fulladder port map (vA(1),  vB(1),  carry(0),   vS(1),  carry(1));
	A3 :  fulladder port map (vA(2),  vB(2),  carry(1),   vS(2),  carry(2));
	A4 :  fulladder port map (vA(3),  vB(3),  carry(2),   vS(3),  carry(3));
	A5 :  fulladder port map (vA(4),  vB(4),  carry(3),   vS(4),  carry(4));
	A6 :  fulladder port map (vA(5),  vB(5),  carry(4),   vS(5),  carry(5));
	A7 :  fulladder port map (vA(6),  vB(6),  carry(5),   vS(6),  carry(6));
	A8 :  fulladder port map (vA(7),  vB(7),  carry(6),   vS(7),  carry(7));
	A9 :  fulladder port map (vA(8),  vB(8),  carry(7),   vS(8),  carry(8));
	A10 : fulladder port map (vA(9),  vB(9),  carry(8),   vS(9),  carry(9));
	A11 : fulladder port map (vA(10), vB(10), carry(9),   vS(10), carry(10));
	A12 : fulladder port map (vA(11), vB(11), carry(10),  vS(11), carry(11));
	A13 : fulladder port map (vA(12), vB(12), carry(11),  vS(12), carry(12));
	A14 : fulladder port map (vA(13), vB(13), carry(12),  vS(13), carry(13));
	A15 : fulladder port map (vA(14), vB(14), carry(13),  vS(14), carry(14));
	A16 : fulladder port map (vA(15), vB(15), carry(14),  vS(15), carry(15));
	A17 : fulladder port map (vA(16), vB(16), carry(15),  vS(16), carry(16));
	A18 : fulladder port map (vA(17), vB(17), carry(16),  vS(17), carry(17));
	A19 : fulladder port map (vA(18), vB(18), carry(17),  vS(18), carry(18));
	A20 : fulladder port map (vA(19), vB(19), carry(18),  vS(19), carry(19));
	A21 : fulladder port map (vA(20), vB(20), carry(19),  vS(20), carry(20));
	A22 : fulladder port map (vA(21), vB(21), carry(20),  vS(21), carry(21));
	A23 : fulladder port map (vA(22), vB(22), carry(21),  vS(22), carry(22));
	A24 : fulladder port map (vA(23), vB(23), carry(22),  vS(23), carry(23));
	A25 : fulladder port map (vA(24), vB(24), carry(23),  vS(24), carry(24));
	A26 : fulladder port map (vA(25), vB(25), carry(24),  vS(25), carry(25));
	A27 : fulladder port map (vA(26), vB(26), carry(25),  vS(26), carry(26));
	A28 : fulladder port map (vA(27), vB(27), carry(26),  vS(27), carry(27));
	A29 : fulladder port map (vA(28), vB(28), carry(27),  vS(28), carry(28));
	A30 : fulladder port map (vA(29), vB(29), carry(28),  vS(29), carry(29));
	A31 : fulladder port map (vA(30), vB(30), carry(29),  vS(30), carry(30));
	A32 : fulladder port map (vA(31), vB(31), carry(30),  vS(31), carry(31));
			
end Behavioral;

