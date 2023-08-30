Library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity fsub is
    Port ( sain, sbin, scin: in STD_LOGIC;
		sub_state: in STD_LOGIC_VECTOR(15 downto 0);
		reset_master: in std_logic;
		clk_sub: in std_logic;
           sso,sco: out STD_LOGIC);
end fsub;

architecture Behavioral of fsub is

begin

sso <= '0' when reset_master = '0' else (sain xor sbin xor scin) when sub_state(1) = '1' else '0';
sco <= '0' when reset_master = '0' else ((not sain and sbin) or (scin and (not sain xor sbin))) when sub_state(1) = '1' else '0';


end Behavioral;
