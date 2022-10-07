`timescale 1ns/1ns
module Hazard_Detection( clk, rst, stall, en_reg, instr, stallinsrt ) ;
    input clk, rst ;
	input [31:0] instr ;
	output stall, en_reg ;
	output [31:0] stallinsrt ;
	
	parameter NOP = 32'd0;
	parameter BEQ = 6'd4;
	parameter JAL = 6'd3;
	
	reg [31:0] stallinsrt ;
	reg [6:0] amt, count ; 
	reg stall, en_reg ;
	
	always @( instr ) begin
		if ( instr[31:26] == 6'd0 && instr[5:0] == 6'd25 ) begin
		  amt <= 32 ;
		  en_reg <= 1'b0 ;
		  stallinsrt <= instr ;
		end
		else if ( instr[31:26] == BEQ ) begin
		  amt <= 1 ;
		  en_reg <= 1'b0 ;
		  stallinsrt <= instr ;
		end
		else if ( instr[31:26] == JAL ) begin
		  amt <= 3 ;
		  en_reg <= 1'b0 ;
		  stallinsrt <= instr ;
		end
	
		/*
		else if ( instr == NOP ) begin
		  amt <= 1 ;
		  en_reg <= 1'b0 ;
		  stallinsrt <= instr ;
		end
		*/
		else begin
		  amt <= 0 ;
		  en_reg <= 1'b1 ;
		  stallinsrt <= instr ;
		end
	end
	
	always @( posedge clk ) begin
	
		if ( rst ) begin
		  amt <= 0 ;
		  count <= 0 ;
		  en_reg <= 1'b1 ;
		  stall <= 1'b0 ;
		  stallinsrt <= 32'd0 ;
		end
		else begin
		  if ( count == 0 && en_reg == 1'b1 ) stall <= 1'b0 ;
		  else stall <= 1'b1 ;
		
		  count <= count + 1 ;
		  if ( count == amt ) begin
		    amt <= 0 ;
			count <= 0 ;
			en_reg <= 1'b1 ;
			stall <= 1'b0 ;
		  end
		end

	end
	
endmodule
