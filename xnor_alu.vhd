library IEEE;
use IEEE.std_logic_1164.all;
entity XNOR_GATE_alu is
    port(Axn: in std_logic_vector(7 downto 0);     
         Bxn: in std_logic_vector(7 downto 0);     
         Yxn: out std_logic_vector(7 downto 0);
         res: in std_logic;
         clk: in std_logic;
         xnor_st: in std_logic_vector(15 downto 0));
end XNOR_GATE_alu;
architecture xnorLogic of XNOR_GATE_alu is
begin
Yxn <= "00000000" when res = '0' else (not(Axn XOR Bxn)) when xnor_st(14) = '1' else "00000000";

end xnorLogic;

