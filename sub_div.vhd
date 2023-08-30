Library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity sub_div is
    Port ( A_d,B_d : in STD_LOGIC_VECTOR (7 downto 0);
		div_state: in std_logic_vector(15 downto 0);
		reset_master: in std_logic;
		clk_div: in std_logic;
           R_d: out STD_LOGIC_VECTOR (7 downto 0);
           Z_d: out STD_LOGIC);
end sub_div;

architecture Behavioral of sub_div is

signal scx: STD_LOGIC_VECTOR (7 downto 1);
constant low: STD_LOGIC := '0';

component sub_1b_div is
    Port ( sain_d, sbin_d, scin_d: in STD_LOGIC;
	div_state: in std_logic_vector(15 downto 0);
	reset_master: in std_logic;
	clk_div: in std_logic;
           sso_d,sco_d: out STD_LOGIC);
end component;

begin
U1 : sub_1b_div port map (sain_d=>A_d(0),sbin_d=>B_d(0),scin_d=>low,sco_d=>scx(1),sso_d=>R_d(0), div_state=>div_state,
	reset_master=>reset_master, clk_div=>clk_div); 
U2 : sub_1b_div port map (sain_d=>A_d(1),sbin_d=>B_d(1),scin_d=>scx(1),sco_d=>scx(2),sso_d=>R_d(1), div_state=>div_state,
	reset_master=>reset_master, clk_div=>clk_div);
U3 : sub_1b_div port map (sain_d=>A_d(2),sbin_d=>B_d(2),scin_d=>scx(2),sco_d=>scx(3),sso_d=>R_d(2), div_state=>div_state,
	reset_master=>reset_master, clk_div=>clk_div);
U4 : sub_1b_div port map (sain_d=>A_d(3),sbin_d=>B_d(3),scin_d=>scx(3),sco_d=>scx(4),sso_d=>R_d(3), div_state=>div_state,
	reset_master=>reset_master, clk_div=>clk_div);
U5 : sub_1b_div port map (sain_d=>A_d(4),sbin_d=>B_d(4),scin_d=>scx(4),sco_d=>scx(5),sso_d=>R_d(4), div_state=>div_state,
	reset_master=>reset_master, clk_div=>clk_div);
U6 : sub_1b_div port map (sain_d=>A_d(5),sbin_d=>B_d(5),scin_d=>scx(5),sco_d=>scx(6),sso_d=>R_d(5), div_state=>div_state,
	reset_master=>reset_master, clk_div=>clk_div);
U7 : sub_1b_div port map (sain_d=>A_d(6),sbin_d=>B_d(6),scin_d=>scx(6),sco_d=>scx(7),sso_d=>R_d(6), div_state=>div_state,
	reset_master=>reset_master, clk_div=>clk_div);
U8 : sub_1b_div port map (sain_d=>A_d(7),sbin_d=>B_d(7),scin_d=>scx(7),sco_d=>z_d, sso_d=>R_d(7), div_state=>div_state,
	reset_master=>reset_master, clk_div=>clk_div);

end Behavioral;
