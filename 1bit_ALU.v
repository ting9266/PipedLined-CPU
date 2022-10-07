`timescale 1ns/1ns
module ALU_1bit( s, cout, set, a, b, c, Signal, inv, less ) ;

	input a, b, c, inv, less ;
	input [2:0] Signal ;
	output s, cout, set ;

	wire [3:0] i ;
	wire e1 ;

	and (i[0], a, b);
	or	(i[1], a, b);
	xor (e1, inv, b);
	
	FA fa(.cout(cout), .sum(i[2]), .a(a), .b(e1), .c(c)) ;
	assign i[3] =  ( less == 1 ) ? 1'b1 : 1'b0 ;

	MUX_4to1 mux(.out(s), .i0(i[0]), .i1(i[1]), .i2(i[2]), .i3(i[3]), .Signal(Signal) ) ;

endmodule