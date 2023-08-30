library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Mux4_to_1_alu is
 Port ( w : in  STD_LOGIC_VECTOR (3 downto 0);
		  m : in  STD_LOGIC_VECTOR (1 downto 0);
		  f : out  STD_LOGIC);
end Mux4_to_1_alu;

architecture Behavioral of Mux4_to_1_alu is

begin
	with m select
	f <= 	w(0)	when "00",
			w(1)	when "01",
			w(2) 	when "10",
			w(3) 	when others;
end Behavioral;