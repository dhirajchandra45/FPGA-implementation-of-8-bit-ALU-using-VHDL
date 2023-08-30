library IEEE;
use IEEE.std_logic_1164.all;
entity NOR_GATE_alu is
    port(Ano: in std_logic_vector(7 downto 0);     
         Bno: in std_logic_vector(7 downto 0);     
         Yno: out std_logic_vector(7 downto 0);
         res: in std_logic;
         clk: in std_logic;
         nor_st: in std_logic_vector(15 downto 0));
end NOR_GATE_alu;
architecture norLogic of NOR_GATE_alu is
begin
Yno <= "00000000" when res = '0' else (not(Ano OR Bno)) when nor_st(12) = '1' else "00000000";
end norLogic;

