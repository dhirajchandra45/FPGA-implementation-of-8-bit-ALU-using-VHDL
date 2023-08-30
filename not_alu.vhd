library IEEE;
use IEEE.std_logic_1164.all;
entity NOT_GATE_alu is
    port(An: in std_logic_vector(7 downto 0);  
         Yn: out std_logic_vector(7 downto 0);
         res: in std_logic;
         clk: in std_logic;
         not_st: in std_logic_vector(15 downto 0));
end NOT_GATE_alu;
architecture notLogic of NOT_GATE_alu is
begin
Yn <= "00000000" when res = '0' else (not(An)) when not_st(10) = '1' else "00000000";
end notLogic;

