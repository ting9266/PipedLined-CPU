//	Title: MIPS Single-Cycle Processor
//	Editor: Selene (Computer System and Architecture Lab, ICE, CYCU)
module mips_single( clk, rst );
	input clk, rst;
	
	// instruction bus
	wire[31:0] instr, instr_out, instr_next, stallinsrt;
	
	// break out important fields from instruction
	wire [5:0] opcode, funct,funct_out;
    wire [4:0] rs, rt,rt_out, rd,rd_out, shamt,shamt_out;
    wire [15:0] immed;
    wire [31:0] extend_immed, extend_immed_1,extend_in,extend_out, b_offset,immed_result;
    wire [25:0] jumpoffset;
	
	// datapath signals
    wire [4:0] rfile_wn;
    wire [31:0] rfile_rd1,rfile_rd1_1, rfile_rd2,rfile_rd2_1,rfile_rd2_2,alu_a,alu_b,alu_b_1, b_tgt, pc_next,
                pc, pc_incr,pc_out, jump_addr, branch_addr,rd1_out,rd2_out,rfile_wd, JalMUXtorfileWD;
	wire [31:0] alu_out,alu_out_1, alu_out_2,alu_address, dmem_rdata, dmem_rdata_1 ;

	// control signals
    wire RegWrite, Branch, PCSrc, RegDst, MemtoReg, MemRead, MemWrite, ALUSrc, Zero,Zero_1, Jump, MULTU, SLL, en_reg ;
	wire IF_ID_Write, PC_Write, stall, flush, equal, Jal, Jal_1, Jal_2, Jal_3 ;
    wire [1:0] ALUOp;
    wire [2:0] Operation;
	
	wire [1:0] WB_reg, WB_reg_1, WB_reg_2, WB_reg_3, mux_alu_a, mux_alu_b, sel_out;
    wire [2:0] MEM_reg, MEM_reg_1, MEM_reg_2;
	wire [3:0] EX_reg, EX_reg_1;
	wire [4:0] rs_1, rd_1, rt_1, rfile_wn_1, rfile_wn_2 , JalWnMUXtorfileWN; /////////////
	
	wire [31:0] HiOut, LoOut, SLLAns, result_out ;
	wire [63:0] MULTUAns ;										   
	
    assign opcode = instr_out[31:26];
    assign rs = instr_out[25:21];
    assign rt = instr_out[20:16];
    assign rd = instr_out[15:11];
    assign shamt = instr_out[10:6];
    assign funct = instr_out[5:0];
    assign immed = instr_out[15:0];
    assign jumpoffset = instr_out[25:0];
	
	// branch offset shifter
    assign b_offset = extend_immed << 2;
	
	// jump offset shifter & concatenation
	assign jump_addr = { pc_incr[31:28], jumpoffset << 2 };
	
	assign WB_reg = { MemtoReg, RegWrite };
	assign MEM_reg = { MemRead, MemWrite, Branch };
	assign EX_reg = { RegDst, ALUSrc, ALUOp };


	// module instantiations
	reg32 PC( .clk(clk), .rst(rst), .en_reg(en_reg), .d_in(pc_next), .d_out(pc) );
	
	add32 PCADD( .a(pc), .b(32'd4), .result(pc_incr) );
	
	mux2 #(32) PCMUX( .sel(PCSrc), .a(pc_incr), .b(b_tgt), .y(branch_addr) );
	
	mux2 #(32) JMUX( .sel(Jump), .a(branch_addr), .b(jump_addr), .y(pc_next) );
	
	memory InstrMem( .clk(clk), .MemRead(1'b1), .MemWrite(1'b0), .wd(32'd0), .addr(pc), .rd(instr) );
	
	/*******************************************************************************************************************/
	
	IF_ID IF_ID_Reg( .clk(clk), .rst(rst), .en_reg(1'b1), .instr_out(instr_out), .pc_out(pc_out), .instr_in(instr_next), .pc_in(pc_incr) );
	
	/****************************************************************************************************************/
	
	Hazard_Detection hazardDection( .clk(clk), .rst(rst), .stall(stall), .en_reg(en_reg), .instr(instr), .stallinsrt(stallinsrt) ) ;
	
	mux2 #(32) STALLMUX( .sel(stall), .a(stallinsrt), .b(32'b0), .y(instr_next) ) ;
	
	// sign-extender
	sign_extend SignExt( .immed_in(immed), .ext_immed_out(extend_immed) );
	
	mux2 #(32) JalMUX( .sel(Jal_3), .a(rfile_wd), .b(pc_out), .y(JalMUXtorfileWD) ) ; // !!!!!!!!!!!!!!!!!!!!!!!!!!
	
	mux2 #(5) JalWnMUX( .sel(Jal_3), .a(rfile_wn_2), .b(5'd31), .y(JalWnMUXtorfileWN) ) ;
	
	reg_file RegFile( .clk(clk), .RegWrite(WB_reg_3[0]), .RN1(rs), .RN2(rt), .WN(JalWnMUXtorfileWN), 
					  .WD(JalMUXtorfileWD), .RD1(rfile_rd1), .RD2(rfile_rd2) );
					  
	
					  
	control_single CTL(.opcode(opcode), .RegDst(RegDst), .ALUSrc(ALUSrc), .MemtoReg(MemtoReg), 
                       .RegWrite(RegWrite), .MemRead(MemRead), .MemWrite(MemWrite), .Branch(Branch), 
                       .Jump(Jump), .ALUOp(ALUOp), .stall(stall), .Jal(Jal) );
					   
	add32 BRADD( .a(pc_out), .b(b_offset), .result(b_tgt) );
					   
					   
					   
	/*******************************************************************************************************************/				   
	ID_EX ID_EX_Reg( .clk(clk), .rst(rst), .WB_out(WB_reg_1), .MEM_out(MEM_reg_1), .EX_out(EX_reg_1),
					 .RD1_out(rfile_rd1_1), .RD2_out(rfile_rd2_1), .immed_out(extend_immed_1), .rt_out(rt_1), .rd_out(rd_1), .rs_out(rs_1),. Jal_out(Jal_1), 
					 .WB_in(WB_reg), .MEM_in(MEM_reg), .EX_in(EX_reg), .RD1_in(rfile_rd1), .RD2_in(rfile_rd2), 
					 .immed_in(extend_immed), .rt_in(rt), .rd_in(rd), .rs_in(rs), .Jal_in(Jal) ); 
					 
	/******************************************************************************************************************/
	

	alu ALU( .dataA(alu_a), .dataB(alu_b_1), .Signal(Operation), .dataOut(alu_out), .zero(Zero) );
	
	Branch_Equal branchEqual( .opcode(opcode), .equal(equal), .a(rfile_rd1), .b(rfile_rd2) );
	
	and BR_AND( PCSrc, Branch, equal ) ;
	
	alu_ctl ALUCTL( .ALUOp(EX_reg_1[1:0]), .Funct(extend_immed_1[5:0]), .ALUOperation(Operation), .MULTU(MULTU), .SLL(SLL), .sel(sel_out) );
	
	Multiplier multiplier( .clk(clk), .dataA(rfile_rd1_1), .dataB(rfile_rd2_1), .Signal(MULTU), .dataOut(MULTUAns), .reset(rst) );
	
	HiLo hilo( .clk(clk), .MULTUAns(MULTUAns), .HiOut(HiOut), .LoOut(LoOut), .reset(rst) );
	
	Shifter shifter( .dataA(rfile_rd1_1), .dataB(rfile_rd2_1), .Signal(SLL), .dataOut(SLLAns), .reset(rst) );
	
	mux4 #(32) RESULTMUX( .sel(sel_out), .a(alu_out), .b(HiOut), .c(LoOut), .d(SLLAns), .result(result_out) ) ;
	
	mux2 #(5) RFMUX( .sel(EX_reg_1[3]), .a(rt_1), .b(rd_1), .y(rfile_wn) );
	
	mux2 #(32) ALUMUX( .sel(EX_reg_1[2]), .a(rfile_rd2_1), .b(extend_immed_1), .y(alu_b) );

	mux3 #(32) ALUMUX1( .sel(mux_alu_a), .a(rfile_rd1_1), .b(rfile_wd), .c(alu_out_1), .y(alu_a));
	
	mux3 #(32) ALUMUX2( .sel(mux_alu_b), .a(alu_b), .b(rfile_wd), .c(alu_out_1), .y(alu_b_1));
	
	forwarding_unit Forwarding( .rst(rst), .mux_alu_a(mux_alu_a), .mux_alu_b(mux_alu_b), .rs(rs_1), .rt(rt_1), .EX_MEM_WN(rfile_wn_1), .MEM_WB_WN(rfile_wn_2), .EX_MEM_RegW(WB_reg_2[0]), .MEM_WB_RegW(WB_reg_3[0]), .alu_op(EX_reg_1[1:0]) );
	
	/*******************************************************************************************************************/
    EX_MEM EX_MEM_Reg ( .clk(clk), .rst(rst), 
	                    .WB_out(WB_reg_2), .MEM_out(MEM_reg_2), .ALU_out(alu_out_1), .WN_out(rfile_wn_1), .WD_out(rfile_rd2_2),.zero_out(Zero_1), .Jal_out(Jal_2),
						.WB_in(WB_reg_1),  .MEM_in(MEM_reg_1),  .ALU_in(result_out), .WN_in(rfile_wn), .WD_in(rfile_rd2_1),.zero_in(Zero), .Jal_in(Jal_1));
   
   /*******************************************************************************************************************/
	
	memory DatMem( .clk(clk), .MemRead(MEM_reg_2[2]), .MemWrite(MEM_reg_2[1]), .wd(rfile_rd2_2), 
				   .addr(alu_out_1), .rd(dmem_rdata) );
				   
				   
				   
	/*******************************************************************************************************************/			   
    MEM_WB MEM_WB_Reg ( .clk(clk), .rst(rst), .WB_out(WB_reg_3), .RD_out(dmem_rdata_1), .ADDRESS_out(alu_out_2), .WN_out(rfile_wn_2), .Jal_out(Jal_3),  
	                                          .WB_in(WB_reg_2), .RD_in(dmem_rdata), .ADDRESS_in(alu_out_1), .WN_in(rfile_wn_1), .Jal_in(Jal_2) );
											  
	/*****************************************************************************************************************/										  

    mux2 #(32) WRMUX( .sel(WB_reg_3[1]), .a(alu_out_2), .b(dmem_rdata_1), .y(rfile_wd) );
	
	
    /*********************************************************************************************************************/

endmodule
