library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
entity full_adder_mul is 
Port(af,bf,cf:in std_logic;
	mul_state: in std_logic_vector(15 downto 0);
	reset_master: in std_logic;
	clk_mul: in std_logic;
	sumf,carryf:out std_logic); 
end full_adder_mul;
  
architecture data of full_adder_mul is
begin

sumf <= '0' when reset_master = '0' else (af xor bf xor cf) when mul_state(2) = '1' else '0';
carryf <= '0' when reset_master = '0' else ((af and bf) or (bf and cf) or (af and cf)) when mul_state(2) = '1' else '0';

end data;
