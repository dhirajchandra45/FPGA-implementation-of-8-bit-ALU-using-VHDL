library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity mod_shift_reg_alu is
    Port ( c_in : in  STD_LOGIC;
	   loads : in  STD_LOGIC_VECTOR (7 downto 0);
		operation : in  STD_LOGIC_VECTOR (7 downto 0);
	   shift_state : in std_logic_vector(15 downto 0);
           outp : out  STD_LOGIC_VECTOR (7 downto 0);
			  clk_shift : in  STD_LOGIC;
           ---sel : in  STD_LOGIC_VECTOR (1 downto 0);
           clr_shift : in  STD_LOGIC;
		carrys_flag : out STD_LOGIC);
end mod_shift_reg_alu;

architecture Behavioral of mod_shift_reg_alu is
	component uni_shift_reg_alu is
    Port ( input : in  STD_LOGIC;
           load : in  STD_LOGIC_VECTOR (7 downto 0);
           outp : out  STD_LOGIC_VECTOR (7 downto 0);
			  clk_1 : in  STD_LOGIC;
           sel : in  STD_LOGIC_VECTOR (1 downto 0);
		operation : in  STD_LOGIC_VECTOR (7 downto 0);
           clr_1 : in  STD_LOGIC);		
	end component;
	
	component mux_shiftt is
 port(
     ra,rb: in STD_LOGIC;
     z: out STD_LOGIC
  );
end component;

	---signal sh_left: STD_LOGIC_VECTOR (6 downto 0);
	signal prev_A: STD_LOGIC_VECTOR (7 downto 0);
	signal prev_st: STD_LOGIC_VECTOR (15 downto 0);
	---shared variable input_value: STD_LOGIC_VECTOR (2 downto 0);
	signal sel_shift: STD_LOGIC_VECTOR (1 downto 0);
	signal loopcount: STD_LOGIC_VECTOR (2 downto 0);
	---shared variable tmp : integer := 0;
	signal tmp : STD_LOGIC := '0';
	signal ra : STD_LOGIC := '1';
	signal rb : STD_LOGIC := '0';
	---shared variable finish_check : integer := 0;
	---shared variable done : integer;
type statetype is (s0, s1, s2, s3);
  signal pr_state, nx_state : statetype;
  
begin
shift: uni_shift_reg_alu port map (                  --8 bit full subtractor
      input => c_in, load => loads, outp => outp, sel => sel_shift, clr_1 => clr_shift, clk_1 => clk_shift,
	operation => operation);

muxd: mux_shiftt port map (
		ra => ra , rb => rb, z => tmp);
		
process (clr_shift, clk_shift)
begin
---if (operation(0) = '0') then
	---done := 1;
---end if;
if (clr_shift = '0' or operation(7) = '0') then
      ---outp <= "00000000";
		rb <= '0';
		---ra <= '1';
	pr_state <= s3;

else
	if (shift_state(4) = '1') or (shift_state(5) = '1') then
		if tmp = '0' then
			
			---outp <= "00000000";
			pr_state <= s0;
			---tmp := 1;
			rb <= '1';
		---else
			---if done = 1 then
			---pr_state <= s1;
			---end if;
		end if;
		
    	if (clk_shift'event and clk_shift = '1') then
      		pr_state <= nx_state;
    	end if;
	else
		if (shift_state(4) /= '1') and (shift_state(5) /= '1') then
		pr_state <= s3;
		end if;
	end if;
end if;
  end process;

process (pr_state)
  begin
    case pr_state is

      when s0 =>
	---outp <= "00000000";
	ra <= '1';
	if (prev_A /= loads) and (prev_st = shift_state) then
        	sel_shift <= "11";
		---outp <= "00000000";	
		carrys_flag <= '0';
	end if;
	if (prev_A = loads) and (prev_st /= shift_state) then
        	sel_shift <= "11";
		---outp <= "00000000";	
		carrys_flag <= '0';
	end if;
	if (prev_A /= loads) and (prev_st /= shift_state) then
        	sel_shift <= "11";
		---outp <= "00000000";	
		carrys_flag <= '0';
	end if;
	nx_state <= s1;
	---tmp := 1;
	
	prev_A <= loads;
	loopcount <= operation(2 downto 0);
      when s1 =>
	---integer input_value := to_integer(unsigned(operation(2 downto 0));
	
	---if loopcount /= "001" then
	if shift_state(4) = '1' then
        	sel_shift <= "01";
	end if;
	if shift_state(5) = '1' then
        	sel_shift <= "10";
	end if;
	
	---else
	nx_state <= s2;
	---end if;
	if loopcount /= "000" then
	loopcount <= loopcount - '1';
	end if;

	
      when s2 =>
	if loopcount /= "000" then
	sel_shift <= "00";
	nx_state <= s1;
	else
        sel_shift <= "00";
	carrys_flag <= '1';
	loopcount <= "000";
	end if;
	---nx_state <= s0;
	---tmp := 1;
	
      when s3 =>
	---tmp := 0;
	ra <= '1';
	carrys_flag <= '0';

end case;


end process;

end Behavioral;
