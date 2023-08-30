library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity half_adder_mul is
   Port(ah,bh:in std_logic;
	mul_state: in std_logic_vector(15 downto 0);
	reset_master: in std_logic;
	clk_mul: in std_logic;
	sumh,carryh:out std_logic); 
end half_adder_mul; 
 
architecture data of half_adder_mul is
begin

sumh <= '0' when reset_master = '0' else (ah xor bh) when mul_state(2) = '1' else '0';
carryh <= '0' when reset_master = '0' else (ah and bh) when mul_state(2) = '1' else '0';

end data;
