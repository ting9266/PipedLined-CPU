module ID_EX ( clk, rst, WB_out, MEM_out, EX_out, RD1_out, RD2_out, immed_out, rt_out, rd_out, rs_out, Jal_in,
						 WB_in,  MEM_in,  EX_in,  RD1_in,  RD2_in,  immed_in,  rt_in,  rd_in , rs_in, Jal_out );
    input clk, rst, Jal_in;
	input [1:0]  WB_in;
	input [2:0]  MEM_in;
	input [3:0]  EX_in;
	input [4:0]	 rt_in, rd_in,rs_in;
    input [31:0] RD1_in, RD2_in, immed_in ;
	
	output 		  Jal_out;
	output [1:0]  WB_out;
	output [2:0]  MEM_out;
	output [3:0]  EX_out;
	output [4:0]  rt_out, rd_out,rs_out;
    output [31:0] RD1_out, RD2_out, immed_out;
	
	reg 		Jal_out ;
	reg	  [1:0]  WB_out;
	reg   [2:0]  MEM_out;
	reg   [3:0]  EX_out;
	reg   [4:0]  rt_out, rd_out,rs_out;
    reg   [31:0] RD1_out, RD2_out, immed_out;
   
    always @( posedge clk ) begin
        if ( rst ) begin
		WB_out    <= 2'b0;
		MEM_out   <= 3'b0;
		EX_out	  <= 4'b0;
		RD1_out   <= 32'b0;
		RD2_out   <= 32'b0; 
		immed_out <= 32'b0; 
		Jal_out   <= 1'b0 ;
		rt_out    <= 5'b0; 
		rd_out    <= 5'b0;
		rs_out    <= 5'b0;
	end
        else begin
		WB_out    <=  WB_in;
		MEM_out   <=  MEM_in;
		EX_out	  <=  EX_in;
		RD1_out   <=  RD1_in;
		RD2_out   <=  RD2_in; 
		immed_out <=  immed_in; 
		rt_out    <=  rt_in; 
		rd_out    <=  rd_in;
		rs_out    <=  rs_in;
		Jal_out   <=  Jal_in ;
	end
    end
endmodule