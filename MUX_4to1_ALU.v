//MUX
`timescale 1ns/1ns
module MUX_4to1(out, i0, i1, i2, i3, Signal) ;

  output out ;
  input i0, i1, i2, i3 ;
  input [2:0] Signal ;
  
  parameter AND = 3'b000;
  parameter OR  = 3'b001;
  parameter ADD = 3'b010;
  parameter SUB = 3'b110;
  parameter SLT = 3'b111;
  
  assign out = (Signal == AND) ? i0 :
				(Signal == OR) ? i1 :
				(Signal == ADD) ? i2 :
				(Signal == SUB) ? i2 :
				(Signal == SLT) ? i3 :
				6'bx ;
  
endmodule
