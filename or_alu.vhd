library IEEE;
use IEEE.std_logic_1164.all;
entity OR_GATE_alu is
    port(Ao: in std_logic_vector(7 downto 0);     
         Bo: in std_logic_vector(7 downto 0);     
         Yo: out std_logic_vector(7 downto 0);
         res: in std_logic;
         clk: in std_logic;
         or_st: in std_logic_vector(15 downto 0));
end OR_GATE_alu;
architecture OrLogic of OR_GATE_alu is
begin
Yo <= "00000000" when res = '0' else (Ao OR Bo) when or_st(9) = '1' else "00000000";
end OrLogic;

