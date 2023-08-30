library IEEE;
use IEEE.std_logic_1164.all;
entity NAND_GATE_alu is
    port(Ana: in std_logic_vector(7 downto 0);     
         Bna: in std_logic_vector(7 downto 0);     
         Yna: out std_logic_vector(7 downto 0);
         res: in std_logic;
         clk: in std_logic;
         nand_st: in std_logic_vector(15 downto 0));
end NAND_GATE_alu;
architecture nandLogic of NAND_GATE_alu is
begin

Yna <= "00000000" when res = '0' else (not(Ana AND Bna)) when nand_st(11) = '1' else "00000000";

---process (res,clk)
---begin
 --- if res = '0' then
    ---Yna <= "00000000";
    ---elsif clk'EVENT AND clk = '1' then
    ---if(nand_st(11) = '1') then
     ---Yna(7) <= not(Ana(7) AND Bna(7));
     ---Yna(6) <= not(Ana(6) AND Bna(6));
     ---Yna(5) <= not(Ana(5) AND Bna(5));
     ---Yna(4) <= not(Ana(4) AND Bna(4));
     ---Yna(3) <= not(Ana(3) AND Bna(3));
     ---Yna(2) <= not(Ana(2) AND Bna(2));
     ---Yna(1) <= not(Ana(1) AND Bna(1));
     ---Yna(0) <= not(Ana(0) AND Bna(0));
    ---else
     ---Yna <= "00000000";
---end if;
---end if;
---end process;
end nandLogic;

