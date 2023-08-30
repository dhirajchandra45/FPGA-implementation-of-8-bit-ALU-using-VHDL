library IEEE;
use IEEE.STD_LOGIC_1164.all;
 
entity mux_divt is
 port(
     ra,rb: in STD_LOGIC;
     z: out STD_LOGIC
  );
end mux_divt;
 
architecture bhv of mux_divt is
begin
process (ra,rb) is
begin
  if (ra ='1' and rb = '1') then
      Z <= '1';
  elsif (ra ='0' and rb = '1') then
      Z <= '0';
  elsif (ra ='1' and rb = '0') then
      Z <= '0';
  elsif (ra ='0' and rb = '0') then
      Z <= '0';
  end if;
 
end process;
end bhv;
