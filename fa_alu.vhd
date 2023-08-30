library ieee;
use ieee.std_logic_1164.all;

entity FA_8bit is
port(xad,yad : in std_logic_vector(7 downto 0);
     cin : in std_logic;
	adder_statef : in std_logic_vector (15 downto 0);
	reset_master: in std_logic;
	clk_add: in std_logic;
      sum : out std_logic_vector(7 downto 0);
      co : out std_logic);
end FA_8bit;

architecture FA_arch of FA_8bit is
signal cary : std_logic_vector(6 downto 0);

component full_adder_1b is
  port (p,q,r:in std_logic;  sm,cr: out std_logic; adder_state: in std_logic_vector(15 downto 0); reset_master: in std_logic;
	clk_add: in std_logic);
end component;
  begin


     a0:full_adder_1b port map (p=>xad(0), q=>yad(0), r=>cin, sm=>sum(0), cr=>cary(0), adder_state=>adder_statef, reset_master=>reset_master, clk_add=>clk_add);
     a1:full_adder_1b port map (p=>xad(1), q=>yad(1), r=>cary(0), sm=>sum(1), cr=>cary(1), adder_state=>adder_statef, reset_master=>reset_master, clk_add=>clk_add);
     a2:full_adder_1b port map (p=>xad(2), q=>yad(2), r=>cary(1), sm=>sum(2), cr=>cary(2), adder_state=>adder_statef, reset_master=>reset_master, clk_add=>clk_add);
     a3:full_adder_1b port map (p=>xad(3), q=>yad(3), r=>cary(2), sm=>sum(3), cr=>cary(3), adder_state=>adder_statef, reset_master=>reset_master, clk_add=>clk_add);
     a4:full_adder_1b port map (p=>xad(4), q=>yad(4), r=>cary(3), sm=>sum(4), cr=>cary(4), adder_state=>adder_statef, reset_master=>reset_master, clk_add=>clk_add);
     a5:full_adder_1b port map (p=>xad(5), q=>yad(5), r=>cary(4), sm=>sum(5), cr=>cary(5), adder_state=>adder_statef, reset_master=>reset_master, clk_add=>clk_add);
     a6:full_adder_1b port map (p=>xad(6), q=>yad(6), r=>cary(5), sm=>sum(6), cr=>cary(6), adder_state=>adder_statef, reset_master=>reset_master, clk_add=>clk_add);
     a7:full_adder_1b port map (p=>xad(7), q=>yad(7), r=>cary(6), sm=>sum(7), cr=>co, adder_state=>adder_statef, reset_master=>reset_master, clk_add=>clk_add);
	
end FA_arch;

