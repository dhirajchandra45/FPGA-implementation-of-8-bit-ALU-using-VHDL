Library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity sub8 is
    Port ( A,B: in STD_LOGIC_VECTOR (7 downto 0);
		sub_states : in STD_LOGIC_VECTOR (15 downto 0);
		C: in std_logic;
		reset_master: in std_logic;
		clk_sub: in std_logic;
           R: out STD_LOGIC_VECTOR (7 downto 0);
           Z: out STD_LOGIC);
end sub8;

architecture Behavioral of sub8 is

signal scx: STD_LOGIC_VECTOR (7 downto 1);
constant low: STD_LOGIC := '0';

component fsub is
port (sain, sbin, scin: in STD_LOGIC;
	sub_state : in STD_LOGIC_VECTOR (15 downto 0);
	reset_master: in std_logic;
	clk_sub: in std_logic;
       sco,sso: out STD_LOGIC);
end component;

begin

U1 : fsub port map (sain=>A(0),sbin=>B(0),scin=>C,sco=>scx(1),sso=>R(0), sub_state=>sub_states, reset_master=>reset_master, clk_sub=>clk_sub); 
U2 : fsub port map (sain=>A(1),sbin=>B(1),scin=>scx(1),sco=>scx(2),sso=>R(1), sub_state=>sub_states, reset_master=>reset_master, clk_sub=>clk_sub);
U3 : fsub port map (sain=>A(2),sbin=>B(2),scin=>scx(2),sco=>scx(3),sso=>R(2), sub_state=>sub_states, reset_master=>reset_master, clk_sub=>clk_sub);
U4 : fsub port map (sain=>A(3),sbin=>B(3),scin=>scx(3),sco=>scx(4),sso=>R (3), sub_state=>sub_states, reset_master=>reset_master, clk_sub=>clk_sub);
U5 : fsub port map (sain=>A(4),sbin=>B(4),scin=>scx(4),sco=>scx(5),sso=>R(4), sub_state=>sub_states, reset_master=>reset_master, clk_sub=>clk_sub);
U6 : fsub port map (sain=>A(5),sbin=>B(5),scin=>scx(5),sco=>scx(6),sso=>R(5), sub_state=>sub_states, reset_master=>reset_master, clk_sub=>clk_sub);
U7 : fsub port map (sain=>A(6),sbin=>B(6),scin=>scx(6),sco=>scx(7),sso=>R(6), sub_state=>sub_states, reset_master=>reset_master, clk_sub=>clk_sub);
U8 : fsub port map (sain=>A(7),sbin=>B(7),scin=>scx(7),sco=>z, sso=>R(7), sub_state=>sub_states, reset_master=>reset_master, clk_sub=>clk_sub);

end Behavioral;
