library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity array_multiplier_8bit is
   Port ( x,y:in std_logic_vector(7 downto 0);
		mul_state: in std_logic_vector(15 downto 0); 
		reset_master: in std_logic;
		clk_mul: in std_logic;
	  p:out std_logic_vector(15 downto 0));
end array_multiplier_8bit; 
 
architecture data of array_multiplier_8bit is
	component half_adder_mul
   	Port(ah,bh:in std_logic;
	mul_state: in std_logic_vector(15 downto 0);
	reset_master: in std_logic;
	clk_mul: in std_logic;
	sumh,carryh:out std_logic); 
	end component;

	component full_adder_mul
   	Port(af,bf,cf:in std_logic;
	mul_state: in std_logic_vector(15 downto 0);
	reset_master: in std_logic;
	clk_mul: in std_logic;
	sumf,carryf:out std_logic); 
	end component;

signal c1,c2,c3,c4,c5,c6,c7: std_logic_vector (7 downto 0);
signal s1,s2,s3,s4,s5,s6,s7: std_logic_vector (7 downto 0);
signal xy0,xy1,xy2,xy3,xy4,xy5,xy6,xy7: std_logic_vector (7 downto 0);

begin
   
xy0(0)<= x(0) and y(0);
xy0(1) <= x(1) and y(0);
xy0(2) <= x(2) and y(0);
xy0(3) <= x(3) and y(0);
xy0(4) <= x(4) and y(0);
xy0(5) <= x(5) and y(0);
xy0(6) <= x(6) and y(0);
xy0(7) <= x(7) and y(0);

xy1(0) <= x(0) and y(1);
xy1(1) <= x(1) and y(1);
xy1(2) <= x(2) and y(1);
xy1(3) <= x(3) and y(1);
xy1(4) <= x(4) and y(1);
xy1(5) <= x(5) and y(1);
xy1(6) <= x(6) and y(1);
xy1(7) <= x(7) and y(1);

xy2(0) <= x(0) and y(2);
xy2(1) <= x(1) and y(2);
xy2(2) <= x(2) and y(2);
xy2(3) <= x(3) and y(2);
xy2(4) <= x(4) and y(2);
xy2(5) <= x(5) and y(2);
xy2(6) <= x(6) and y(2);
xy2(7) <= x(7) and y(2);

xy3(0) <= x(0) and y(3);
xy3(1) <= x(1) and y(3);
xy3(2) <= x(2) and y(3);
xy3(3) <= x(3) and y(3);
xy3(4) <= x(4) and y(3);
xy3(5) <= x(5) and y(3);
xy3(6) <= x(6) and y(3);
xy3(7) <= x(7) and y(3);

xy4(0) <= x(0) and y(4);
xy4(1) <= x(1) and y(4);
xy4(2) <= x(2) and y(4);
xy4(3) <= x(3) and y(4);
xy4(4) <= x(4) and y(4);
xy4(5) <= x(5) and y(4);
xy4(6) <= x(6) and y(4);
xy4(7) <= x(7) and y(4);

xy5(0) <= x(0) and y(5);
xy5(1) <= x(1) and y(5);
xy5(2) <= x(2) and y(5);
xy5(3) <= x(3) and y(5);
xy5(4) <= x(4) and y(5);
xy5(5) <= x(5) and y(5);
xy5(6) <= x(6) and y(5);
xy5(7) <= x(7) and y(5);

xy6(0) <= x(0) and y(6);
xy6(1) <= x(1) and y(6);
xy6(2) <= x(2) and y(6);
xy6(3) <= x(3) and y(6);
xy6(4) <= x(4) and y(6);
xy6(5) <= x(5) and y(6);
xy6(6) <= x(6) and y(6);
xy6(7) <= x(7) and y(6);

xy7(0) <= x(0) and y(7);
xy7(1) <= x(1) and y(7);
xy7(2) <= x(2) and y(7);
xy7(3) <= x(3) and y(7);
xy7(4) <= x(4) and y(7);
xy7(5) <= x(5) and y(7);
xy7(6) <= x(6) and y(7);
xy7(7) <= x(7) and y(7);


HA1:	half_adder_mul	PORT MAP (
	ah=>xy0(1),  bh=> xy1(0), sumh=> s1(0), carryh=> c1(0),
	mul_state=>mul_state, reset_master=>reset_master, clk_mul=>clk_mul);
HA2:	half_adder_mul	PORT MAP (
	ah=>xy0(2),  bh=> xy1(1), sumh=> s2(0), carryh=> c2(0),
	mul_state=>mul_state, reset_master=>reset_master, clk_mul=>clk_mul);
HA3:	half_adder_mul	PORT MAP (
	ah=>xy0(3),  bh=> xy1(2), sumh=> s3(0), carryh=> c3(0),
	mul_state=>mul_state, reset_master=>reset_master, clk_mul=>clk_mul);
HA4:	half_adder_mul	PORT MAP (
	ah=>xy0(4),  bh=> xy1(3), sumh=> s4(0), carryh=> c4(0),
	mul_state=>mul_state, reset_master=>reset_master, clk_mul=>clk_mul);
HA5:	half_adder_mul	PORT MAP (
	ah=>xy0(5),  bh=> xy1(4), sumh=> s5(0), carryh=> c5(0),
	mul_state=>mul_state, reset_master=>reset_master, clk_mul=>clk_mul);
HA6:	half_adder_mul	PORT MAP (
	ah=>xy0(6),  bh=> xy1(5), sumh=> s6(0), carryh=> c6(0),
	mul_state=>mul_state, reset_master=>reset_master, clk_mul=>clk_mul);
HA7:	half_adder_mul	PORT MAP (
	ah=>xy0(7),  bh=> xy1(6), sumh=> s7(0), carryh=> c7(0),
	mul_state=>mul_state, reset_master=>reset_master, clk_mul=>clk_mul);


FA1:	full_adder_mul	PORT MAP (
	af=>s2(0),  bf=> xy2(0), cf=> c1(0), sumf=> s1(1), carryf=> c1(1),
	mul_state=>mul_state, reset_master=>reset_master, clk_mul=>clk_mul);
FA2:	full_adder_mul	PORT MAP (
	af=>s3(0),  bf=> xy2(1), cf=> c2(0), sumf=> s2(1), carryf=> c2(1),
	mul_state=>mul_state, reset_master=>reset_master, clk_mul=>clk_mul);
FA3:	full_adder_mul	PORT MAP (
	af=>s4(0),  bf=> xy2(2), cf=> c3(0), sumf=> s3(1), carryf=> c3(1),
	mul_state=>mul_state, reset_master=>reset_master, clk_mul=>clk_mul);
FA4:	full_adder_mul	PORT MAP (
	af=>s5(0),  bf=> xy2(3), cf=> c4(0), sumf=> s4(1), carryf=> c4(1),
	mul_state=>mul_state, reset_master=>reset_master, clk_mul=>clk_mul);
FA5:	full_adder_mul	PORT MAP (
	af=>s6(0),  bf=> xy2(4), cf=> c5(0), sumf=> s5(1), carryf=> c5(1),
	mul_state=>mul_state, reset_master=>reset_master, clk_mul=>clk_mul);
FA6:	full_adder_mul	PORT MAP (
	af=>s7(0),  bf=> xy2(5), cf=> c6(0), sumf=> s6(1), carryf=> c6(1),
	mul_state=>mul_state, reset_master=>reset_master, clk_mul=>clk_mul);
FA7:	full_adder_mul	PORT MAP (
	af=>xy1(7),  bf=> xy2(6), cf=> c7(0), sumf=> s7(1), carryf=> c7(1),
	mul_state=>mul_state, reset_master=>reset_master, clk_mul=>clk_mul);

FA8:	full_adder_mul	PORT MAP (
	af=>s2(1),  bf=> xy3(0), cf=> c1(1), sumf=> s1(2), carryf=> c1(2),
	mul_state=>mul_state, reset_master=>reset_master, clk_mul=>clk_mul);
FA9:	full_adder_mul	PORT MAP (
	af=>s3(1),  bf=> xy3(1), cf=> c2(1), sumf=> s2(2), carryf=> c2(2),
	mul_state=>mul_state, reset_master=>reset_master, clk_mul=>clk_mul);
FA10:	full_adder_mul	PORT MAP (
	af=>s4(1),  bf=> xy3(2), cf=> c3(1), sumf=> s3(2), carryf=> c3(2),
	mul_state=>mul_state, reset_master=>reset_master, clk_mul=>clk_mul);
FA11:	full_adder_mul	PORT MAP (
	af=>s5(1),  bf=> xy3(3), cf=> c4(1), sumf=> s4(2), carryf=> c4(2),
	mul_state=>mul_state, reset_master=>reset_master, clk_mul=>clk_mul);
FA12:	full_adder_mul	PORT MAP (
	af=>s6(1),  bf=> xy3(4), cf=> c5(1), sumf=> s5(2), carryf=> c5(2),
	mul_state=>mul_state, reset_master=>reset_master, clk_mul=>clk_mul);
FA13:	full_adder_mul	PORT MAP (
	af=>s7(1),  bf=> xy3(5), cf=> c6(1), sumf=> s6(2), carryf=> c6(2),
	mul_state=>mul_state, reset_master=>reset_master, clk_mul=>clk_mul);
FA14:	full_adder_mul	PORT MAP (
	af=>xy2(7),  bf=> xy3(6), cf=> c7(1), sumf=> s7(2), carryf=> c7(2),
	mul_state=>mul_state, reset_master=>reset_master, clk_mul=>clk_mul);

FA15:	full_adder_mul	PORT MAP (
	af=>s2(2),  bf=> xy4(0), cf=> c1(2), sumf=> s1(3), carryf=> c1(3),
	mul_state=>mul_state, reset_master=>reset_master, clk_mul=>clk_mul);
FA16:	full_adder_mul	PORT MAP (
	af=>s3(2),  bf=> xy4(1), cf=> c2(2), sumf=> s2(3), carryf=> c2(3),
	mul_state=>mul_state, reset_master=>reset_master, clk_mul=>clk_mul);
FA17:	full_adder_mul	PORT MAP (
	af=>s4(2),  bf=> xy4(2), cf=> c3(2), sumf=> s3(3), carryf=> c3(3),
	mul_state=>mul_state, reset_master=>reset_master, clk_mul=>clk_mul);
FA18:	full_adder_mul	PORT MAP (
	af=>s5(2),  bf=> xy4(3), cf=> c4(2), sumf=> s4(3), carryf=> c4(3),
	mul_state=>mul_state, reset_master=>reset_master, clk_mul=>clk_mul);
FA19:	full_adder_mul	PORT MAP (
	af=>s6(2),  bf=> xy4(4), cf=> c5(2), sumf=> s5(3), carryf=> c5(3),
	mul_state=>mul_state, reset_master=>reset_master, clk_mul=>clk_mul);
FA20:	full_adder_mul	PORT MAP (
	af=>s7(2),  bf=> xy4(5), cf=> c6(2), sumf=> s6(3), carryf=> c6(3),
	mul_state=>mul_state, reset_master=>reset_master, clk_mul=>clk_mul);
FA21:	full_adder_mul	PORT MAP (
	af=>xy3(7),  bf=> xy4(6), cf=> c7(2), sumf=> s7(3), carryf=> c7(3),
	mul_state=>mul_state, reset_master=>reset_master, clk_mul=>clk_mul);

FA22:	full_adder_mul	PORT MAP (
	af=>s2(3),  bf=> xy5(0), cf=> c1(3), sumf=> s1(4), carryf=> c1(4),
	mul_state=>mul_state, reset_master=>reset_master, clk_mul=>clk_mul);
FA23:	full_adder_mul	PORT MAP (
	af=>s3(3),  bf=> xy5(1), cf=> c2(3), sumf=> s2(4), carryf=> c2(4),
	mul_state=>mul_state, reset_master=>reset_master, clk_mul=>clk_mul);
FA24:	full_adder_mul	PORT MAP (
	af=>s4(3),  bf=> xy5(2), cf=> c3(3), sumf=> s3(4), carryf=> c3(4),
	mul_state=>mul_state, reset_master=>reset_master, clk_mul=>clk_mul);
FA25:	full_adder_mul	PORT MAP (
	af=>s5(3),  bf=> xy5(3), cf=> c4(3), sumf=> s4(4), carryf=> c4(4),
	mul_state=>mul_state, reset_master=>reset_master, clk_mul=>clk_mul);
FA26:	full_adder_mul	PORT MAP (
	af=>s6(3),  bf=> xy5(4), cf=> c5(3), sumf=> s5(4), carryf=> c5(4),
	mul_state=>mul_state, reset_master=>reset_master, clk_mul=>clk_mul);
FA27:	full_adder_mul	PORT MAP (
	af=>s7(3),  bf=> xy5(5), cf=> c6(3), sumf=> s6(4), carryf=> c6(4),
	mul_state=>mul_state, reset_master=>reset_master, clk_mul=>clk_mul);
FA28:	full_adder_mul	PORT MAP (
	af=>xy4(7),  bf=> xy5(6), cf=> c7(3), sumf=> s7(4), carryf=> c7(4),
	mul_state=>mul_state, reset_master=>reset_master, clk_mul=>clk_mul);

FA29:	full_adder_mul	PORT MAP (
	af=>s2(4),  bf=> xy6(0), cf=> c1(4), sumf=> s1(5), carryf=> c1(5),
	mul_state=>mul_state, reset_master=>reset_master, clk_mul=>clk_mul);
FA30:	full_adder_mul	PORT MAP (
	af=>s3(4),  bf=> xy6(1), cf=> c2(4), sumf=> s2(5), carryf=> c2(5),
	mul_state=>mul_state, reset_master=>reset_master, clk_mul=>clk_mul);
FA31:	full_adder_mul	PORT MAP (
	af=>s4(4),  bf=> xy6(2), cf=> c3(4), sumf=> s3(5), carryf=> c3(5),
	mul_state=>mul_state, reset_master=>reset_master, clk_mul=>clk_mul);
FA32:	full_adder_mul	PORT MAP (
	af=>s5(4),  bf=> xy6(3), cf=> c4(4), sumf=> s4(5), carryf=> c4(5),
	mul_state=>mul_state, reset_master=>reset_master, clk_mul=>clk_mul);
FA33:	full_adder_mul	PORT MAP (
	af=>s6(4),  bf=> xy6(4), cf=> c5(4), sumf=> s5(5), carryf=> c5(5),
	mul_state=>mul_state, reset_master=>reset_master, clk_mul=>clk_mul);
FA34:	full_adder_mul	PORT MAP (
	af=>s7(4),  bf=> xy6(5), cf=> c6(4), sumf=> s6(5), carryf=> c6(5),
	mul_state=>mul_state, reset_master=>reset_master, clk_mul=>clk_mul);
FA35:	full_adder_mul	PORT MAP (
	af=>xy5(7),  bf=> xy6(6), cf=> c7(4), sumf=> s7(5), carryf=> c7(5),
	mul_state=>mul_state, reset_master=>reset_master, clk_mul=>clk_mul);

FA36:	full_adder_mul	PORT MAP (
	af=>s2(5),  bf=> xy7(0), cf=> c1(5), sumf=> s1(6), carryf=> c1(6),
	mul_state=>mul_state, reset_master=>reset_master, clk_mul=>clk_mul);
FA37:	full_adder_mul	PORT MAP (
	af=>s3(5),  bf=> xy7(1), cf=> c2(5), sumf=> s2(6), carryf=> c2(6),
	mul_state=>mul_state, reset_master=>reset_master, clk_mul=>clk_mul);
FA38:	full_adder_mul	PORT MAP (
	af=>s4(5),  bf=> xy7(2), cf=> c3(5), sumf=> s3(6), carryf=> c3(6),
	mul_state=>mul_state, reset_master=>reset_master, clk_mul=>clk_mul);
FA39:	full_adder_mul	PORT MAP (
	af=>s5(5),  bf=> xy7(3), cf=> c4(5), sumf=> s4(6), carryf=> c4(6),
	mul_state=>mul_state, reset_master=>reset_master, clk_mul=>clk_mul);
FA40:	full_adder_mul	PORT MAP (
	af=>s6(5),  bf=> xy7(4), cf=> c5(5), sumf=> s5(6), carryf=> c5(6),
	mul_state=>mul_state, reset_master=>reset_master, clk_mul=>clk_mul);
FA41:	full_adder_mul	PORT MAP (
	af=>s7(5),  bf=> xy7(5), cf=> c6(5), sumf=> s6(6), carryf=> c6(6),
	mul_state=>mul_state, reset_master=>reset_master, clk_mul=>clk_mul);
FA42:	full_adder_mul	PORT MAP (
	af=>xy6(7),  bf=> xy7(6), cf=> c7(5), sumf=> s7(6), carryf=> c7(6),
	mul_state=>mul_state, reset_master=>reset_master, clk_mul=>clk_mul);

HA8:	half_adder_mul	PORT MAP (
	ah=>s2(6),  bh=> c1(6), sumh=> s1(7), carryh=> c1(7),
	mul_state=>mul_state, reset_master=>reset_master, clk_mul=>clk_mul);
FA43:	full_adder_mul	PORT MAP (
	af=>s3(6),  bf=> c2(6), cf=> c1(7), sumf=> s2(7), carryf=> c2(7),
	mul_state=>mul_state, reset_master=>reset_master, clk_mul=>clk_mul);
FA44:	full_adder_mul	PORT MAP (
	af=>s4(6),  bf=> c3(6), cf=> c2(7), sumf=> s3(7), carryf=> c3(7),
	mul_state=>mul_state, reset_master=>reset_master, clk_mul=>clk_mul);
FA45:	full_adder_mul	PORT MAP (
	af=>s5(6),  bf=> c4(6), cf=> c3(7), sumf=> s4(7), carryf=> c4(7),
	mul_state=>mul_state, reset_master=>reset_master, clk_mul=>clk_mul);
FA46:	full_adder_mul	PORT MAP (
	af=>s6(6),  bf=> c5(6), cf=> c4(7), sumf=> s5(7), carryf=> c5(7),
	mul_state=>mul_state, reset_master=>reset_master, clk_mul=>clk_mul);
FA47:	full_adder_mul	PORT MAP (
	af=>s7(6),  bf=> c6(6), cf=> c5(7), sumf=> s6(7), carryf=> c6(7),
	mul_state=>mul_state, reset_master=>reset_master, clk_mul=>clk_mul);
FA48:	full_adder_mul	PORT MAP (
	af=>xy7(7),  bf=> c7(6), cf=> c6(7), sumf=> s7(7), carryf=> c7(7),
	mul_state=>mul_state, reset_master=>reset_master, clk_mul=>clk_mul);

p(0)<=xy0(0); p(1)<=s1(0); p(2)<=s1(1); p(3)<=s1(2); p(4)<=s1(3); p(5)<=s1(4); p(6)<=s1(5); p(7)<=s1(6);
p(8)<=s1(7); p(9)<=s2(7); p(10)<=s3(7); p(11)<=s4(7); p(12)<=s5(7); p(13)<=s6(7); p(14)<=s7(7); p(15)<=c7(7);
	
end data;
