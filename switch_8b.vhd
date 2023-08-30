library ieee;
use ieee.std_logic_1164.all;
entity switch_mux is
   port(
      sw_add,sw_sub,sw_mull,sw_div_q,sw_and,sw_or,sw_not,sw_nand,sw_nor,sw_xor,sw_xnor,sw_buffer,sw_shift: in std_logic_vector(7 downto 0);
      select_sw: in std_logic_vector(3 downto 0);
      sw_out: out std_logic_vector(7 downto 0)
   );
end switch_mux;

architecture cond_arch of switch_mux is
begin
   sw_out <= sw_add when (select_sw = "0000") else
        sw_sub when (select_sw = "0001") else
	sw_mull when (select_sw = "0010") else
	sw_div_q when (select_sw = "0011") else
        sw_and when (select_sw = "1000") else
        sw_or when (select_sw = "1001") else
        sw_not when (select_sw = "1010") else
        sw_nand when (select_sw = "1011") else
        sw_nor when (select_sw = "1100") else
        sw_xor when (select_sw = "1101") else
        sw_xnor when (select_sw = "1110") else
	sw_buffer when (select_sw = "1111") else
	sw_shift;
end cond_arch;
