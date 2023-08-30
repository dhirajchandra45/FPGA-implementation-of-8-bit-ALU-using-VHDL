library ieee;
use ieee.std_logic_1164.all;
entity full_adder_1b is
   port (p,q,r:in std_logic;
	adder_state: in std_logic_vector(15 downto 0);
	reset_master: in std_logic;
	clk_add: in std_logic;
 sm,cr: out std_logic);

end full_adder_1b;

architecture FA_arc of full_adder_1b is
  begin

sm <= '0' when reset_master = '0' else (p xor q xor r) when adder_state(0) = '1' else '0';
cr <= '0' when reset_master = '0' else ((p and q) or (q and r) or (r and p)) when adder_state(0) = '1' else '0';

end FA_arc;

