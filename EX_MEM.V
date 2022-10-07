module EX_MEM ( clk, rst, WB_out, MEM_out, ALU_out, WN_out, zero_out, WD_out, Jal_in, 
                          WB_in,  MEM_in,  ALU_in,  WN_in, zero_in, WD_in, Jal_out);
    input clk, rst;
	input [1:0]  WB_in;
	input [2:0]  MEM_in;
	input [31:0] ALU_in ;
	input [4:0] WN_in ;
	input [31:0] WD_in ;
	input  zero_in, Jal_in ;

	
	output [1:0]  WB_out;
	output [2:0]  MEM_out;
	output [31:0] ALU_out ;
    output [4:0] WN_out ;
	output [31:0] WD_out;
	output zero_out, Jal_out;
	
	reg	  [1:0]  WB_out;
	reg   [2:0]  MEM_out;
	reg   [31:0]  ALU_out;
	reg   [4:0]  WN_out;
	reg   [31:0] WD_out;
	reg   zero_out, Jal_out;
	

   
    always @( posedge clk ) begin
        if ( rst ) begin
		WB_out    <= 2'b0;
		MEM_out   <= 3'b0;
		ALU_out	  <= 32'b0;
		Jal_out   <= 1'b0 ;
		WD_out	  <= 32'b0;
		WN_out    <= 5'b0;
		zero_out  <= 1'b0;
	end
        else begin
		WB_out    <=  WB_in;
		MEM_out   <=  MEM_in;
		WD_out    <=  WD_in ;
		ALU_out	  <=  ALU_in;
		WN_out    <=  WN_in ;
		zero_out  <=  zero_in;
		Jal_out   <=  Jal_in ;
	end
    end
endmodule