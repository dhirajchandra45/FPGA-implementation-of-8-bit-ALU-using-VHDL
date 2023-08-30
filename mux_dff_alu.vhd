library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity d_and_mux_alu is
 Port ( in_put : in  STD_LOGIC_VECTOR (3 downto 0);
		  Sel : in  STD_LOGIC_VECTOR (1 downto 0);
		  clk :	in STD_LOGIC;
		  clearN : in STD_LOGIC;
			operation : in  STD_LOGIC_VECTOR (7 downto 0);
		  Outp : out  STD_LOGIC);
end d_and_mux_alu;

architecture Behavioral of d_and_mux_alu is
	component Mux4_to_1_alu
	Port ( w : in  STD_LOGIC_VECTOR (3 downto 0);
			 m : in  STD_LOGIC_VECTOR (1 downto 0);
			 f : out  STD_LOGIC);
	end component;

	component d_flip_flop_alu
	Port ( D : in  STD_LOGIC;
			 Clock : in  STD_LOGIC;
			 Reset_N : in  STD_LOGIC;
			 op : in  STD_LOGIC_VECTOR (7 downto 0);
			 Q : out  STD_LOGIC);
	end component;

signal mux_d : STD_LOGIC;

begin
	mux:	Mux4_to_1_alu	PORT MAP (
	w=>in_put,  m=> Sel, f=> mux_d);
	flip_flop:  d_flip_flop_alu	PORT MAP ( 
	D=>mux_d, Q=>Outp, Clock=>clk,  Reset_N => clearN, op => operation
	);
end Behavioral;
