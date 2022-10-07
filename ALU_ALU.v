`timescale 1ns/1ns
module alu( dataA, dataB, Signal, dataOut, zero );

	input [31:0] dataA ;
	input [31:0] dataB ;
	input [2:0] Signal ;
	output [31:0] dataOut ;
	output zero ;

	parameter AND = 3'b000;
	parameter OR  = 3'b001;
	parameter ADD = 3'b010;
	parameter SUB = 3'b110;
	parameter SLT = 3'b111;
	
	wire [32:0] c ;
	wire set, inv ;
	wire zero ;

	assign inv = (Signal == SUB) ? 1 : 0 ;	
	
	ALU_32bit alu_32bit ( .dataOut(dataOut), .dataA(dataA), .dataB(dataB), .Signal(Signal), .inv(inv) ) ;
	
	assign zero = ( dataOut == 0 ) ? 1 : 0 ;

	
endmodule