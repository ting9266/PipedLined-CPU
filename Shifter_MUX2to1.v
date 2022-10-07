/////////////////////////
//2X1 Mux
/////////////////////////
module mux2to1( in0, in1, sel, out);
	input in0,in1;
	input sel;
	output out;
	
	assign out=(sel)?in1:in0;
endmodule