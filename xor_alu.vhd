library IEEE;
use IEEE.std_logic_1164.all;
entity XOR_GATE_alu is
    port(Ax: in std_logic_vector(7 downto 0);     
         Bx: in std_logic_vector(7 downto 0);     
         Yx: out std_logic_vector(7 downto 0);
         res: in std_logic;
         clk: in std_logic;
         xor_st: in std_logic_vector(15 downto 0));
end XOR_GATE_alu;
architecture xorLogic of XOR_GATE_alu is
begin
Yx <= "00000000" when res = '0' else (Ax XOR Bx) when xor_st(13) = '1' else "00000000";
end xorLogic;
