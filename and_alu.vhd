library IEEE;
use IEEE.std_logic_1164.all;
entity AND_GATE_alu is
    port(Aa: in std_logic_vector(7 downto 0);     
         Ba: in std_logic_vector(7 downto 0);     
         Ya: out std_logic_vector(7 downto 0);
         res: in std_logic;
         clk: in std_logic;
         and_st: in std_logic_vector(15 downto 0));
end AND_GATE_alu;
architecture andLogic of AND_GATE_alu is
begin
Ya <= "00000000" when res = '0' else (Aa AND Ba) when and_st(8) = '1' else "00000000";
end andLogic;

