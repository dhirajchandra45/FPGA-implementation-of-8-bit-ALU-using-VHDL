library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity uni_shift_reg_alu is
    Port ( input : in  STD_LOGIC;
           load : in  STD_LOGIC_VECTOR (7 downto 0);
           outp : out  STD_LOGIC_VECTOR (7 downto 0);
			  clk_1 : in  STD_LOGIC;
           sel : in  STD_LOGIC_VECTOR (1 downto 0);
		operation : in  STD_LOGIC_VECTOR (7 downto 0);
           clr_1 : in  STD_LOGIC);
end uni_shift_reg_alu;

architecture Behavioral of uni_shift_reg_alu is
	component d_and_mux_alu
	Port ( in_put : in  STD_LOGIC_VECTOR (3 downto 0);
           Sel : in  STD_LOGIC_VECTOR (1 downto 0);
			  clk :	in STD_LOGIC;
			  clearN : in STD_LOGIC;
			operation : in  STD_LOGIC_VECTOR (7 downto 0);	
           Outp : out  STD_LOGIC);		
	end component;
	signal sh_left: STD_LOGIC_VECTOR (6 downto 0);
	signal sh_right: STD_LOGIC_VECTOR (7 downto 0);
	signal store: STD_LOGIC_VECTOR (7 downto 0);
begin
	Stage7: d_and_mux_alu  
	PORT MAP (in_put(0) => store(7),
		  in_put(1) =>	input,
		  in_put(2) => sh_left(6),
		  in_put(3) =>	load(7), 
		  clk => clk_1, 
		  Sel => sel, 
		  clearN => clr_1,
			operation => operation, 	
		  OutP => sh_right(7));
										  
										  
	Stage6: d_and_mux_alu
	PORT MAP (in_put(0) => store(6), 
		  in_put(1) =>	sh_right(7),
		  in_put(2) => sh_left(5),
		  in_put(3) =>	load(6), 
		  clk => clk_1, 
		  Sel => sel, 
		  clearN => clr_1,
			operation => operation, 
		  OutP => sh_right(6));
										  
	Stage5: d_and_mux_alu  
	PORT MAP (in_put(0) => store(5), 
		  in_put(1) =>	sh_right(6),
		  in_put(2) => sh_left(4),
		  in_put(3) =>	load(5), 
		  clk => clk_1, 
		  Sel => sel, 
		  clearN => clr_1,
			operation => operation, 
		  OutP => sh_right(5));
										  
										  
	Stage4: d_and_mux_alu  
	PORT MAP (in_put(0) => store(4), 
		  in_put(1) =>	sh_right(5),
		  in_put(2) => sh_left(3),
		  in_put(3) =>	load(4), 
		  clk => clk_1, 
		  Sel => sel, 
		  clearN => clr_1,
			operation => operation, 
		  OutP => sh_right(4));

        Stage3: d_and_mux_alu  
	PORT MAP (in_put(0) => store(3),
		  in_put(1) =>	sh_right(4),
		  in_put(2) => sh_left(2),
		  in_put(3) =>	load(3), 
		  clk => clk_1, 
		  Sel => sel, 
		  clearN => clr_1,
			operation => operation, 
		  OutP => sh_right(3));
										  
										  
	Stage2: d_and_mux_alu
	PORT MAP (in_put(0) => store(2), 
		  in_put(1) =>	sh_right(3),
		  in_put(2) => sh_left(1),
		  in_put(3) =>	load(2), 
		  clk => clk_1, 
		  Sel => sel, 
		  clearN => clr_1, 
			operation => operation,
		  OutP => sh_right(2));
										  
	Stage1: d_and_mux_alu  
	PORT MAP (in_put(0) => store(1), 
		  in_put(1) =>	sh_right(2),
		  in_put(2) => sh_left(0),
		  in_put(3) =>	load(1), 
		  clk => clk_1, 
		  Sel => sel, 
		  clearN => clr_1,
			operation => operation, 
		  OutP => sh_right(1));
										  
										  
	Stage0: d_and_mux_alu  
	PORT MAP (in_put(0) => store(0), 
		  in_put(1) =>	sh_right(1),
		  in_put(2) => input,
		  in_put(3) =>	load(0), 
		  clk => clk_1, 
		  Sel => sel, 
		  clearN => clr_1,
			operation => operation, 
		  OutP => sh_right(0));
			
		
	outp(7) <= sh_right(7);
	store(7) <= sh_right(7);
	
	outp(6) <= sh_right(6);
	store(6) <= sh_right(6);
	sh_left(6) <= sh_right(6);
	
	outp(5) <= sh_right(5);
	store(5) <= sh_right(5);
	sh_left(5) <= sh_right(5);
	
	outp(4) <= sh_right(4);
	store(4) <= sh_right(4);
	sh_left(4) <= sh_right(4);

        outp(3) <= sh_right(3);
	store(3) <= sh_right(3);
	sh_left(3) <= sh_right(3);
	
	outp(2) <= sh_right(2);
	store(2) <= sh_right(2);
	sh_left(2) <= sh_right(2);
	
	outp(1) <= sh_right(1);
	store(1) <= sh_right(1);
	sh_left(1) <= sh_right(1);

        outp(0) <= sh_right(0);
	store(0) <= sh_right(0);
	sh_left(0) <= sh_right(0);

end Behavioral;
