library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity master_alu is
 Port ( A_reg : in  STD_LOGIC_VECTOR (7 downto 0);
	B_reg : in  STD_LOGIC_VECTOR (7 downto 0);
		  Sel_operation : in  STD_LOGIC_VECTOR(3 downto 0);
		  clk_master :	in STD_LOGIC;
			Cin_master : in STD_LOGIC;
		  reset_master : in STD_LOGIC;
		  carry_flag : out STD_LOGIC;
		  C_reg : out  STD_LOGIC_VECTOR(7 downto 0);
		D_reg : out  STD_LOGIC_VECTOR (7 downto 0));
end master_alu;

architecture Behavioral of master_alu is
	component FA_8bit
	port(xad,yad : in std_logic_vector(7 downto 0);
     		cin : in std_logic;
		adder_statef : in std_logic_vector (15 downto 0);
		reset_master: in std_logic;
		clk_add: in std_logic;
      		sum : out std_logic_vector(7 downto 0);
      		co : out std_logic);
	end component;

	component sub8
	Port ( A,B : in STD_LOGIC_VECTOR (7 downto 0);
		sub_states : in STD_LOGIC_VECTOR (15 downto 0);
		C: in std_logic;
		reset_master: in std_logic;
		clk_sub: in std_logic;
          	 R: out STD_LOGIC_VECTOR (7 downto 0);
           	Z: out STD_LOGIC);
	end component;

	component array_multiplier_8bit
	Port ( x,y:in std_logic_vector(7 downto 0);
		mul_state: in std_logic_vector(15 downto 0); 
		reset_master: in std_logic;
		clk_mul: in std_logic;
	  p:out std_logic_vector(15 downto 0));
	end component; 	

	component divider_alu
	Port ( clr_div, clk_div, start : in STD_LOGIC;
           A_d,B_d : in STD_LOGIC_VECTOR (7 downto 0);
		div_state : in std_logic_vector(15 downto 0);
           Q_d,R_d : out STD_LOGIC_VECTOR (7 downto 0);
		carryd_flag : out STD_LOGIC);

	end component;

	component decoder1
	port ( sel_dec : in STD_LOGIC_VECTOR(3 downto 0);
 		dec_outp : out STD_LOGIC_VECTOR(15 downto 0)
		 );
	end component;

	component switch_mux
	port (sw_add,sw_sub,sw_mull,sw_div_q,sw_and,sw_or,sw_not,sw_nand,sw_nor,sw_xor,sw_xnor,sw_buffer,sw_shift: in std_logic_vector(7 downto 0);
		select_sw: in std_logic_vector(3 downto 0);
	sw_out: out std_logic_vector(7 downto 0));
	end component;

	component switch_mux_c_reg
	port(
      	sw_gnd,sw_mulh,sw_div_r: in std_logic_vector(7 downto 0);
      	select_sw: in std_logic_vector(3 downto 0);
      	sw_out: out std_logic_vector(7 downto 0));
	end component;

	component switch_mux_carry
	port(
      	sw_add_c,sw_sub_c,sw_div_c,sw_shift_c: in std_logic;
      	select_sw: in std_logic_vector(3 downto 0);
      	sw_out: out std_logic);
	end component;

        component AND_GATE_alu
        port(
        Aa: in std_logic_vector(7 downto 0);     
        Ba: in std_logic_vector(7 downto 0);     
        Ya: out std_logic_vector(7 downto 0);
        res: in std_logic;
        clk: in std_logic;
        and_st: in std_logic_vector(15 downto 0));
        end component;

        component OR_GATE_alu
        port(
        Ao: in std_logic_vector(7 downto 0);     
        Bo: in std_logic_vector(7 downto 0);     
        Yo: out std_logic_vector(7 downto 0);
        res: in std_logic;
        clk: in std_logic;
        or_st: in std_logic_vector(15 downto 0));
        end component;

        component NOT_GATE_alu
        port(
        An: in std_logic_vector(7 downto 0);   
        Yn: out std_logic_vector(7 downto 0);
        res: in std_logic;
        clk: in std_logic;
        not_st: in std_logic_vector(15 downto 0));
        end component;

        component NAND_GATE_alu
        port(
        Ana: in std_logic_vector(7 downto 0);     
        Bna: in std_logic_vector(7 downto 0);     
        Yna: out std_logic_vector(7 downto 0);
        res: in std_logic;
        clk: in std_logic;
        nand_st: in std_logic_vector(15 downto 0));
        end component;

        component NOR_GATE_alu
        port(
        Ano: in std_logic_vector(7 downto 0);     
        Bno: in std_logic_vector(7 downto 0);     
        Yno: out std_logic_vector(7 downto 0);
        res: in std_logic;
        clk: in std_logic;
        nor_st: in std_logic_vector(15 downto 0));
        end component;

        component XOR_GATE_alu
        port(
        Ax: in std_logic_vector(7 downto 0);     
        Bx: in std_logic_vector(7 downto 0);     
        Yx: out std_logic_vector(7 downto 0);
        res: in std_logic;
        clk: in std_logic;
        xor_st: in std_logic_vector(15 downto 0));
        end component;

        component XNOR_GATE_alu
        port(
        Axn: in std_logic_vector(7 downto 0);     
        Bxn: in std_logic_vector(7 downto 0);     
        Yxn: out std_logic_vector(7 downto 0);
        res: in std_logic;
        clk: in std_logic;
        xnor_st: in std_logic_vector(15 downto 0));
        end component;

	component BUFFER_GATE is
   	 port(Ab: in std_logic_vector(7 downto 0);  
         Yb: out std_logic_vector(7 downto 0);
         res: in std_logic;
         clk: in std_logic;
         buffer_st: in std_logic_vector(15 downto 0));
	end component;

	component mod_shift_reg_alu is
    	Port ( c_in : in  STD_LOGIC;
	   loads : in  STD_LOGIC_VECTOR (7 downto 0);
		operation : in  STD_LOGIC_VECTOR (7 downto 0);
	   shift_state : in std_logic_vector(15 downto 0);
           outp : out  STD_LOGIC_VECTOR (7 downto 0);
			  clk_shift : in  STD_LOGIC;
           ---sel : in  STD_LOGIC_VECTOR (1 downto 0);
           clr_shift : in  STD_LOGIC;
		carrys_flag : out STD_LOGIC);
        end component;

signal dec_sig : STD_LOGIC_VECTOR (15 downto 0):= (others => '0');
signal buf_sig_adder : STD_LOGIC_VECTOR (7 downto 0);
signal buf_sig_sub : STD_LOGIC_VECTOR (7 downto 0);
signal buf_sig_mulh : STD_LOGIC_VECTOR (7 downto 0);
signal buf_sig_mull : STD_LOGIC_VECTOR (7 downto 0);
signal buf_sig_div_q : STD_LOGIC_VECTOR (7 downto 0);
signal buf_sig_div_r : STD_LOGIC_VECTOR (7 downto 0);
signal buf_sig_carry_add : STD_LOGIC;
signal buf_sig_carry_sub : STD_LOGIC;
signal buf_sig_carry_div : STD_LOGIC;
signal buf_sig_carry_shift : STD_LOGIC;
--signal buf_sig_carry_mul : STD_LOGIC;
signal buf_sig_and : STD_LOGIC_VECTOR (7 downto 0);
signal buf_sig_or : STD_LOGIC_VECTOR (7 downto 0);
signal buf_sig_not : STD_LOGIC_VECTOR (7 downto 0);
signal buf_sig_nand : STD_LOGIC_VECTOR (7 downto 0);
signal buf_sig_nor : STD_LOGIC_VECTOR (7 downto 0);
signal buf_sig_xor : STD_LOGIC_VECTOR (7 downto 0);
signal buf_sig_xnor : STD_LOGIC_VECTOR (7 downto 0);
signal buf_sig_buf : STD_LOGIC_VECTOR (7 downto 0);
signal buf_sig_shift : STD_LOGIC_VECTOR (7 downto 0);


begin
	Decoder:	decoder1 	PORT MAP (
	sel_dec => Sel_operation, dec_outp => dec_sig);

	F_adder:	FA_8bit 	PORT MAP (
	xad => A_reg,  yad => B_reg,  cin => Cin_master,  sum => buf_sig_adder,  co => buf_sig_carry_add, adder_statef => dec_sig,
	reset_master => reset_master, clk_add => clk_master);

	F_sub:	sub8 	PORT MAP (
	A => A_reg,  B => B_reg, C => Cin_master,  R => buf_sig_sub,  Z => buf_sig_carry_sub, sub_states => dec_sig,
	reset_master => reset_master, clk_sub => clk_master);

	F_mul:  array_multiplier_8bit  PORT MAP (
	x => A_reg, y => B_reg, mul_state => dec_sig , reset_master => reset_master, clk_mul => clk_master,
	p(7 downto 0) => buf_sig_mull, p(15 downto 8) => buf_sig_mulh);

	F_div:  divider_alu  PORT MAP (
	A_d => A_reg, B_d => B_reg, div_state => dec_sig, clr_div => reset_master, clk_div => clk_master,
	Q_d => buf_sig_div_q, R_d => buf_sig_div_r, start => '1', carryd_flag => buf_sig_carry_div);

	SWD:  switch_mux  PORT MAP (
	sw_add => buf_sig_adder, sw_sub => buf_sig_sub, sw_mull => buf_sig_mull, sw_div_q => buf_sig_div_q, 
	sw_and => buf_sig_and, sw_or => buf_sig_or, sw_not => buf_sig_not, sw_nand => buf_sig_nand, sw_nor => buf_sig_nor, sw_xor => buf_sig_xor, sw_xnor => buf_sig_xnor,
        sw_buffer => buf_sig_buf, sw_shift => buf_sig_shift, select_sw => Sel_operation, sw_out => D_reg);

	SWC:  switch_mux_c_reg  PORT MAP (
	sw_gnd => "00000000", sw_mulh => buf_sig_mulh, sw_div_r => buf_sig_div_r, select_sw => Sel_operation, sw_out => C_reg);

	SW_carry:  switch_mux_carry  PORT MAP (
	sw_add_c => buf_sig_carry_add, sw_sub_c => buf_sig_carry_sub, sw_div_c => buf_sig_carry_div,
	sw_shift_c => buf_sig_carry_shift, select_sw => Sel_operation, sw_out => carry_flag);	

        G_and:	AND_GATE_alu	PORT MAP (
        Aa => A_reg, Ba => B_reg, Ya => buf_sig_and, clk => clk_master, res => reset_master, and_st => dec_sig);

        G_or:	OR_GATE_alu 	PORT MAP (
        Ao => A_reg, Bo => B_reg, Yo => buf_sig_or, clk => clk_master, res => reset_master, or_st => dec_sig);

        G_not:	NOT_GATE_alu 	PORT MAP (
        An => A_reg, Yn => buf_sig_not, clk => clk_master, res => reset_master, not_st => dec_sig);

        G_nand:	NAND_GATE_alu 	PORT MAP (
        Ana => A_reg, Bna => B_reg, Yna => buf_sig_nand, clk => clk_master, res => reset_master, nand_st => dec_sig);

        G_nor:	NOR_GATE_alu 	PORT MAP (
        Ano => A_reg, Bno => B_reg, Yno => buf_sig_nor, clk => clk_master, res => reset_master, nor_st => dec_sig);

        G_xor:	XOR_GATE_alu 	PORT MAP (
        Ax => A_reg, Bx => B_reg, Yx => buf_sig_xor, clk => clk_master, res => reset_master, xor_st => dec_sig);

        G_xnor:	XNOR_GATE_alu 	PORT MAP (
        Axn => A_reg, Bxn => B_reg, Yxn => buf_sig_xnor, clk => clk_master, res => reset_master, xnor_st => dec_sig);

	G_buffer:  BUFFER_GATE  PORT MAP (
	Ab => A_reg, Yb => buf_sig_buf, clk => clk_master, res => reset_master, buffer_st => dec_sig);

	shift:  mod_shift_reg_alu PORT MAP (
	c_in => Cin_master, operation => B_reg, loads => A_reg, shift_state => dec_sig, outp => buf_sig_shift,
	clk_shift => clk_master, clr_shift => reset_master, carrys_flag => buf_sig_carry_shift);

end Behavioral;

