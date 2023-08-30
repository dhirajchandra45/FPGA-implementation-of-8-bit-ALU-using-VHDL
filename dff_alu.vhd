library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity d_flip_flop_alu is
    Port ( D : in  STD_LOGIC;
           Clock : in  STD_LOGIC;
           Reset_N : in  STD_LOGIC;
		op : in  STD_LOGIC_VECTOR (7 downto 0);
           Q : out  STD_LOGIC);
end d_flip_flop_alu;

architecture Behavioral of d_flip_flop_alu is

begin
	process (Reset_N, Clock)
	Begin
		if Reset_N = '0' or op(7) = '0' then
			Q <= '0';
		elsif Clock'EVENT AND Clock = '1' then
			Q<= D;
		end if;
	end process;
end Behavioral;
