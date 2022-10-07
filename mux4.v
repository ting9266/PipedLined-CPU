module mux4( sel, a, b, c, d, result );
    parameter bitwidth=32;
    input [1:0] sel;
    input  [bitwidth-1:0] a, b, c, d;
    output [bitwidth-1:0] result;

    assign result = ( sel == 2'b00 ) ? a : 
	                ( sel == 2'b01 ) ? b : 
					( sel == 2'b10 ) ? c : 
					( sel == 2'b11 ) ? d :
                 	32'dx ;
endmodule