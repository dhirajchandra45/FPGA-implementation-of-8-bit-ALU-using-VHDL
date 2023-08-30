Library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity sub_1b_div is
    Port ( sain_d, sbin_d, scin_d: in STD_LOGIC;
	div_state: in std_logic_vector(15 downto 0);
	reset_master: in std_logic;
	clk_div: in std_logic;
           sso_d,sco_d: out STD_LOGIC);
end sub_1b_div;

architecture Behavioral of sub_1b_div is
begin

sso_d <= '0' when reset_master = '0' else (sain_d xor sbin_d xor scin_d) when div_state(3) = '1' else '0';
sco_d <= '0' when reset_master = '0' else ((not sain_d and sbin_d) or (scin_d and (not sain_d xor sbin_d))) when div_state(3) = '1' else '0';
---process (reset_master)
---process(div_state)
	---Begin
		---if reset_master = '0' then
			---sso_d <= '0';
        		---sco_d <= '0';
		---else
			--process(p,q,r,adder_state)
			--begin
			---if(div_state(3) = '1') then
				---sso_d <= sain_d xor sbin_d xor scin_d;
				---sco_d <= (not sain_d and sbin_d) or (scin_d and (not sain_d xor sbin_d));
			---else
				---sso_d <= '0';
        			---sco_d <= '0';
			---end if;
		---end if;
---end process;
end Behavioral;
