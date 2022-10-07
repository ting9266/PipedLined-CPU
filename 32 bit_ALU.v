`timescale 1ns/1ns
module ALU_32bit( dataOut, dataA, dataB, Signal, inv ) ;

	input [31:0] dataA ;
	input [31:0] dataB ;
	input [2:0] Signal ;
	input inv ;

	output [31:0] dataOut ;

	wire [32:0] c ;	
	wire set ; 
	
	assign set = (dataA < dataB) ? 1 : 0 ;
	
	ALU_1bit alu0( .s(dataOut[0]), .cout(c[1]), .set(), .a(dataA[0]), .b(dataB[0]), .c(inv), .Signal(Signal), .inv(inv), .less(set) ) ;
	ALU_1bit alu1( .s(dataOut[1]), .cout(c[2]), .set(), .a(dataA[1]), .b(dataB[1]), .c(c[1]), .Signal(Signal), .inv(inv), .less(1'b0) ) ;
	ALU_1bit alu2( .s(dataOut[2]), .cout(c[3]), .set(), .a(dataA[2]), .b(dataB[2]), .c(c[2]), .Signal(Signal), .inv(inv), .less(1'b0) ) ;
	ALU_1bit alu3( .s(dataOut[3]), .cout(c[4]), .set(), .a(dataA[3]), .b(dataB[3]), .c(c[3]), .Signal(Signal), .inv(inv), .less(1'b0) ) ;
	ALU_1bit alu4( .s(dataOut[4]), .cout(c[5]), .set(), .a(dataA[4]), .b(dataB[4]), .c(c[4]), .Signal(Signal), .inv(inv), .less(1'b0) ) ;
	ALU_1bit alu5( .s(dataOut[5]), .cout(c[6]), .set(), .a(dataA[5]), .b(dataB[5]), .c(c[5]), .Signal(Signal), .inv(inv), .less(1'b0) ) ;
	ALU_1bit alu6( .s(dataOut[6]), .cout(c[7]), .set(), .a(dataA[6]), .b(dataB[6]), .c(c[6]), .Signal(Signal), .inv(inv), .less(1'b0) ) ;
	ALU_1bit alu7( .s(dataOut[7]), .cout(c[8]), .set(), .a(dataA[7]), .b(dataB[7]), .c(c[7]), .Signal(Signal), .inv(inv), .less(1'b0) ) ;
	ALU_1bit alu8( .s(dataOut[8]), .cout(c[9]), .set(), .a(dataA[8]), .b(dataB[8]), .c(c[8]), .Signal(Signal), .inv(inv), .less(1'b0) ) ;
	ALU_1bit alu9( .s(dataOut[9]), .cout(c[10]), .set(), .a(dataA[9]), .b(dataB[9]), .c(c[9]), .Signal(Signal), .inv(inv), .less(1'b0) ) ;
	ALU_1bit alu10( .s(dataOut[10]), .cout(c[11]), .set(), .a(dataA[10]), .b(dataB[10]), .c(c[10]), .Signal(Signal), .inv(inv), .less(1'b0) ) ;
	ALU_1bit alu11( .s(dataOut[11]), .cout(c[12]), .set(), .a(dataA[11]), .b(dataB[11]), .c(c[11]), .Signal(Signal), .inv(inv), .less(1'b0) ) ;
	ALU_1bit alu12( .s(dataOut[12]), .cout(c[13]), .set(), .a(dataA[12]), .b(dataB[12]), .c(c[12]), .Signal(Signal), .inv(inv), .less(1'b0) ) ;
	ALU_1bit alu13( .s(dataOut[13]), .cout(c[14]), .set(), .a(dataA[13]), .b(dataB[13]), .c(c[13]), .Signal(Signal), .inv(inv), .less(1'b0) ) ;
	ALU_1bit alu14( .s(dataOut[14]), .cout(c[15]), .set(), .a(dataA[14]), .b(dataB[14]), .c(c[14]), .Signal(Signal), .inv(inv), .less(1'b0) ) ;
	ALU_1bit alu15( .s(dataOut[15]), .cout(c[16]), .set(), .a(dataA[15]), .b(dataB[15]), .c(c[15]), .Signal(Signal), .inv(inv), .less(1'b0) ) ;
	ALU_1bit alu16( .s(dataOut[16]), .cout(c[17]), .set(), .a(dataA[16]), .b(dataB[16]), .c(c[16]), .Signal(Signal), .inv(inv), .less(1'b0) ) ;
	ALU_1bit alu17( .s(dataOut[17]), .cout(c[18]), .set(), .a(dataA[17]), .b(dataB[17]), .c(c[17]), .Signal(Signal), .inv(inv), .less(1'b0) ) ;
	ALU_1bit alu18( .s(dataOut[18]), .cout(c[19]), .set(), .a(dataA[18]), .b(dataB[18]), .c(c[18]), .Signal(Signal), .inv(inv), .less(1'b0) ) ;
	ALU_1bit alu19( .s(dataOut[19]), .cout(c[20]), .set(), .a(dataA[19]), .b(dataB[19]), .c(c[19]), .Signal(Signal), .inv(inv), .less(1'b0) ) ;
	ALU_1bit alu20( .s(dataOut[20]), .cout(c[21]), .set(), .a(dataA[20]), .b(dataB[20]), .c(c[20]), .Signal(Signal), .inv(inv), .less(1'b0) ) ;
	ALU_1bit alu21( .s(dataOut[21]), .cout(c[22]), .set(), .a(dataA[21]), .b(dataB[21]), .c(c[21]), .Signal(Signal), .inv(inv), .less(1'b0) ) ;
	ALU_1bit alu22( .s(dataOut[22]), .cout(c[23]), .set(), .a(dataA[22]), .b(dataB[22]), .c(c[22]), .Signal(Signal), .inv(inv), .less(1'b0) ) ;
	ALU_1bit alu23( .s(dataOut[23]), .cout(c[24]), .set(), .a(dataA[23]), .b(dataB[23]), .c(c[23]), .Signal(Signal), .inv(inv), .less(1'b0) ) ;
	ALU_1bit alu24( .s(dataOut[24]), .cout(c[25]), .set(), .a(dataA[24]), .b(dataB[24]), .c(c[24]), .Signal(Signal), .inv(inv), .less(1'b0) ) ;
	ALU_1bit alu25( .s(dataOut[25]), .cout(c[26]), .set(), .a(dataA[25]), .b(dataB[25]), .c(c[25]), .Signal(Signal), .inv(inv), .less(1'b0) ) ;
	ALU_1bit alu26( .s(dataOut[26]), .cout(c[27]), .set(), .a(dataA[26]), .b(dataB[26]), .c(c[26]), .Signal(Signal), .inv(inv), .less(1'b0) ) ;
	ALU_1bit alu27( .s(dataOut[27]), .cout(c[28]), .set(), .a(dataA[27]), .b(dataB[27]), .c(c[27]), .Signal(Signal), .inv(inv), .less(1'b0) ) ;
	ALU_1bit alu28( .s(dataOut[28]), .cout(c[29]), .set(), .a(dataA[28]), .b(dataB[28]), .c(c[28]), .Signal(Signal), .inv(inv), .less(1'b0) ) ;
	ALU_1bit alu29( .s(dataOut[29]), .cout(c[30]), .set(), .a(dataA[29]), .b(dataB[29]), .c(c[29]), .Signal(Signal), .inv(inv), .less(1'b0) ) ;
	ALU_1bit alu30( .s(dataOut[30]), .cout(c[31]), .set(), .a(dataA[30]), .b(dataB[30]), .c(c[30]), .Signal(Signal), .inv(inv), .less(1'b0) ) ;
	ALU_1bit alu31( .s(dataOut[31]), .cout(c[32]), .set(set), .a(dataA[31]), .b(dataB[31]), .c(c[31]), .Signal(Signal), .inv(inv), .less(1'b0) ) ;

endmodule