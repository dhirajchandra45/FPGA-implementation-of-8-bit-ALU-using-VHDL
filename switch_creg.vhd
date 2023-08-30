library ieee;
use ieee.std_logic_1164.all;
entity switch_mux_c_reg is
   port(
      sw_gnd,sw_mulh,sw_div_r: in std_logic_vector(7 downto 0);
      select_sw: in std_logic_vector(3 downto 0);
      sw_out: out std_logic_vector(7 downto 0)
   );
end switch_mux_c_reg;

architecture cond_arch of switch_mux_c_reg is
begin
   sw_out <= sw_mulh when (select_sw = "0010") else
	sw_div_r when (select_sw = "0011") else
	sw_gnd;
end cond_arch;
