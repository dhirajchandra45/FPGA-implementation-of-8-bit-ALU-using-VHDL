library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_unsigned.ALL;

entity divider_alu is
    Port ( clr_div, clk_div, start : in STD_LOGIC;
           A_d,B_d : in STD_LOGIC_VECTOR (7 downto 0);
		div_state : in std_logic_vector(15 downto 0);
           Q_d,R_d : out STD_LOGIC_VECTOR (7 downto 0);
		carryd_flag : out STD_LOGIC);

end divider_alu;

architecture Behavioral of divider_alu is
type state_type is (sx_in, sx_proc, sx_done, sx_res);
signal state_now, state_next : state_type;
signal B_zero, M : std_logic;
signal X_now,X_next,Y_now,Y_next,Z_now,n_now,n_next,prev_A,prev_B : STD_LOGIC_VECTOR (7 downto 0);
signal clr_tmp : STD_LOGIC := '0';
signal ra : STD_LOGIC := '1';
signal rb : STD_LOGIC := '0';
---shared variable clr_tmp : integer := 0;

component sub_div is
  Port ( A_d,B_d : in STD_LOGIC_VECTOR (7 downto 0);
		div_state: in std_logic_vector(15 downto 0);
		reset_master: in std_logic;
		clk_div: in std_logic;
           R_d: out STD_LOGIC_VECTOR (7 downto 0);
           Z_d: out STD_LOGIC);
end component;

component mux_divt is
 port(
     ra,rb: in STD_LOGIC;
     z: out STD_LOGIC
  );
end component;
begin

UO: sub_div port map (                  --8 bit full subtractor
      A_d => X_now, B_d => Y_now,
      R_d => Z_now, Z_d => M, div_state => div_state, reset_master => clr_div, clk_div => clk_div);
		
muxd: mux_divt port map (
		ra => ra , rb => rb, z => clr_tmp);

---clr_tmp := 0;
--state memory
process (clr_div, clk_div)
begin

if clr_div = '0' then               --inital value for quotient and remainder
  X_now <= "00000000";
  Y_now <= "00000000";
  n_now <= "00000000";
	
	rb <= '0';
	---clr_tmp <= '0';
	state_now <= sx_res;
	---carry_flag <= '0';

	---Q_d <= "00000000";
    	---R_d <= "00000000";
else
	if clr_tmp = '0' then
	if(div_state(3) = '1') then
		X_now <= "00000000";
  		Y_now <= "00000000";
  		n_now <= "00000000";
		---state_now <= sx_done;
  		state_now <= sx_in;
		---clr_tmp <= '1';
		rb <= '1';
	
	end if;
	if(div_state(3) /= '1') then
		---clr_tmp <= '0';
		rb <= '0';
		X_now <= "00000000";
  		Y_now <= "00000000";
  		n_now <= "00000000";
		state_now <= sx_res;
	end if;
	---end if;
else

if(div_state(3) /= '1') then
		---clr_tmp <= '0';
		rb <= '0';
		X_now <= "00000000";
  		Y_now <= "00000000";
  		n_now <= "00000000";
		state_now <= sx_res;
	end if;

if clk_div'event and clk_div = '1' then
if(div_state(3) = '1') then
  state_now <= state_next;
  X_now <= X_next;
  Y_now <= Y_next;
  n_now <= n_next;
	---carry_flag <= '0';

end if;
end if;
end if;
	
end if;
end process;

B_zero <= B_d(7) or B_d(6) or B_d(5) or B_d(4) or B_d(3) or B_d(2) or B_d(1) or B_d(0);  -- B is zero if B_zero=0

process (start,A_d,B_d,state_now,X_now,Y_now,n_now,B_zero,M,Z_now)
begin 
if(div_state(3) = '1') then
state_next <= state_now;
X_next <= X_now;
Y_next <= Y_now;
n_next <= n_now;
end if;

 case state_now is
  when sx_in =>
		ra <= '1';
    if(div_state(3) = '1') then
    if start = '1' then
	if (prev_A /= A_d) or (prev_B /= B_d) then 
    if B_zero = '1' then     -- the divition won't begin if the divisor is 0
      X_next <= A_d;
      Y_next <= B_d;
      n_next <= X"00";

	---if (prev_A = A_d) or (prev_B = B_d) then 
	---state_next <= sx_proc;
	---carry_flag <= '1';
	---clr_tmp := 0;
	
	---else
	Q_d <= "00000000";
    	R_d <= "00000000";
	carryd_flag <= '0';
	---Q_d <= n_next;
   	---R_d <= X_next;
	prev_A <= A_d;
	prev_B <= B_d;
      state_next <= sx_proc;
	
	---end if;
	---if carryd_flag = '0' then
	
	---end if;
	
    end if;
	else
		carryd_flag <= '1';
    end if;
end if;
end if;
	

  when sx_proc =>
   ---Q_d <= n_now;
   ---R_d <= X_now;
	---if (prev_A = A_d) or (prev_B = B_d) then 
		---carry_flag <= '1';
	---else
	---carry_flag <= '0';
	---end if;
	if(div_state(3) = '1') then
   if M = '1' then           --stop subtarcrion when remainder is smaller than divisor
     X_next <= X_now;
     n_next <= n_now;
     state_next <= sx_done;
	
   else                      --keep subtraction
       X_next <= Z_now;
       n_next <= n_now + 1;
   end if;
	end if;
	
  when sx_done =>
	if(div_state(3) = '1') then
   Q_d <= n_now;
   R_d <= X_now;
	---clr_tmp <= '0';
	ra <= '0';
	carryd_flag <= '1';
end if;
---end if;

  when sx_res =>
	---X_now <= "00000000";
  	---Y_now <= "00000000";
  	---n_now <= "00000000";
	---Q_d <= n_now;
   	---R_d <= X_now;
	Q_d <= "00000000";
    	R_d <= "00000000";
	carryd_flag <= '0';
	---clr_tmp <= '0';
	ra <= '0';

 end case;

---end if;
end process;

end Behavioral;
