library IEEE;
use IEEE.STD_LOGIC_1164.all;
 
entity decoder1 is
 port(
 sel_dec : in STD_LOGIC_VECTOR(3 downto 0);
 dec_outp : out STD_LOGIC_VECTOR(15 downto 0)
 );
end decoder1;
 
architecture bhv of decoder1 is
begin
 
process(sel_dec)
begin
 if (sel_dec="0000") then
 dec_outp <= "0000000000000001";
 elsif (sel_dec="0001") then
 dec_outp <= "0000000000000010";
 elsif (sel_dec="0010") then
 dec_outp <= "0000000000000100";
elsif (sel_dec="0011") then
 dec_outp <= "0000000000001000";
elsif (sel_dec="0100") then
 dec_outp <= "0000000000010000";
elsif (sel_dec="0101") then
 dec_outp <= "0000000000100000";
elsif (sel_dec="0110") then
 dec_outp <= "0000000001000000";
elsif (sel_dec="0111") then
 dec_outp <= "0000000010000000";
elsif (sel_dec="1000") then
 dec_outp <= "0000000100000000";
elsif (sel_dec="1001") then
 dec_outp <= "0000001000000000";
elsif (sel_dec="1010") then
 dec_outp <= "0000010000000000";
elsif (sel_dec="1011") then
 dec_outp <= "0000100000000000";
elsif (sel_dec="1100") then
 dec_outp <= "0001000000000000";
elsif (sel_dec="1101") then
 dec_outp <= "0010000000000000";
elsif (sel_dec="1110") then
 dec_outp <= "0100000000000000";
 else
 dec_outp <= "1000000000000000";
 end if;
end process;
 
end bhv;
