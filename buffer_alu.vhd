library IEEE;
use IEEE.std_logic_1164.all;
entity BUFFER_GATE is
    port(Ab: in std_logic_vector(7 downto 0);  
         Yb: out std_logic_vector(7 downto 0);
         res: in std_logic;
         clk: in std_logic;
         buffer_st: in std_logic_vector(15 downto 0));
end BUFFER_GATE;
architecture bufferLogic of BUFFER_GATE is
begin
Yb <= "00000000" when res = '0' else (Ab) when buffer_st(15) = '1' else "00000000";
end bufferLogic;

