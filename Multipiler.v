`timescale 1ns/1ns
module Multiplier( clk, dataA, dataB, Signal, dataOut, reset );
input clk ;
input reset ;
input [31:0] dataA ;
input [31:0] dataB ;
input Signal ;
output [63:0] dataOut ;

reg start ;

reg [31:0] a, b ;
reg [6:0] count ;
reg [63:0] temp ;


always @( posedge clk or reset ) begin

    if ( reset ) begin
      temp = 32'b0 ;
    end
    else begin
      if ( Signal ) 
	  begin	
	    a = dataA ;
		b = dataB ;
		temp[31:0] = b ;
		count = 0 ;
 		start = 1'b1 ;
	  end
	  
	  if ( start ) 
	  begin
	    
		if ( count == 32 ) 
		begin
		  start = 1'b0 ; 
		end
		else if ( count < 32 ) 
		begin
		  if ( temp[0:0] == 1'b1 ) 
			temp[63:32] = temp[63:32] + a ;
		  
		  temp = temp >> 1 ;
		end
		
		count = count + 1 ;
	  end

    end
end

assign dataOut = temp ;

endmodule