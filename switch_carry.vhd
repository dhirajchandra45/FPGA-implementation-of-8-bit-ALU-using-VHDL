library ieee;
use ieee.std_logic_1164.all;
entity switch_mux_carry is
   port(
      sw_add_c,sw_sub_c,sw_div_c,sw_shift_c: in std_logic;
      select_sw: in std_logic_vector(3 downto 0);
      sw_out: out std_logic
   );
end switch_mux_carry;

architecture cond_arch of switch_mux_carry is
begin
   sw_out <= sw_add_c when (select_sw = "0000") else
 	  sw_sub_c when (select_sw = "0001") else
          sw_div_c when (select_sw = "0011") else
	  sw_shift_c;
end cond_arch;
