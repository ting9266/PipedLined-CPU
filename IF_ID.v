module IF_ID ( clk, rst, en_reg, instr_out, pc_out, instr_in, pc_in );
    input clk, rst, en_reg;
	input [31:0] instr_in;
	input [31:0] pc_in ;

	
	output [31:0]  instr_out;
	output [31:0] pc_out;
	
	reg	  [31:0]  instr_out;
	reg   [31:0]  pc_out;

   
    always @( posedge clk ) begin
        if ( rst ) begin
		pc_out	  <= 32'b0;
		instr_out <= 32'b0;
	end
        else if(en_reg)begin
		pc_out	  <=  pc_in;
		instr_out <= instr_in ;
	end
		else begin
		instr_out <= 31'dx ;
	end
	
    end
endmodule