module MEM_WB ( clk, rst, WB_out, RD_out, ADDRESS_out, WN_out, Jal_out, 
						  WB_in, RD_in, ADDRESS_in, WN_in, Jal_in );
    input clk, rst, Jal_in;
	input [1:0]  WB_in;
	input [31:0] RD_in,ADDRESS_in ;
	input [4:0] WN_in ;

	output 		  Jal_out ;
	output [1:0]  WB_out;
	output [31:0] RD_out,ADDRESS_out ;
    output [4:0] WN_out;
	
	reg 		 Jal_out ;
	reg	  [1:0]  WB_out;
	reg   [31:0]  RD_out,ADDRESS_out ;
	reg   [4:0]  WN_out;

   
    always @( posedge clk ) begin
        if ( rst ) begin
		WB_out    <= 2'b0;
		RD_out	  <= 32'b0;
		ADDRESS_out	  <= 32'b0;
		Jal_out    <= 1'b0 ;
		WN_out    <= 5'b0;
	end
        else begin
		WB_out    <=  WB_in;
		RD_out	  <=  RD_in;
		ADDRESS_out <= ADDRESS_in ;
		WN_out    <=  WN_in ;
		Jal_out    <= Jal_in ;
	end
    end
endmodule