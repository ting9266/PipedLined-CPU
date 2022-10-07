/*
Forwarding Unit
*/

module forwarding_unit ( rst, mux_alu_a, mux_alu_b, rs, rt, EX_MEM_WN, MEM_WB_WN, EX_MEM_RegW, MEM_WB_RegW, alu_op );

  output [1:0] mux_alu_a, mux_alu_b ;
  input [4:0] rs, rt, EX_MEM_WN, MEM_WB_WN ;
  input [1:0] alu_op ;
  input rst, EX_MEM_RegW, MEM_WB_RegW ;
  
  reg [1:0] mux_alu_a, mux_alu_b ;
  
  always @( rst or rs  or EX_MEM_WN or MEM_WB_WN or EX_MEM_RegW or MEM_WB_RegW  ) begin
    if ( rst ) begin
	  mux_alu_a <= 2'b00 ;
	end
    else begin 
      mux_alu_a <= 2'b00 ;
	  if ( EX_MEM_RegW && EX_MEM_WN != 5'd0 && EX_MEM_WN == rs ) mux_alu_a <= 2'b10 ; 
	  else if ( MEM_WB_RegW && MEM_WB_WN != 5'd0 && MEM_WB_WN == rs  ) mux_alu_a <= 2'b01 ;
	  else mux_alu_a <= 2'b00 ;
	end
  end
	
  always @( rst  or rt or EX_MEM_WN or MEM_WB_WN or EX_MEM_RegW or MEM_WB_RegW or  alu_op ) begin
    if ( rst ) begin
	  mux_alu_b <= 2'b00 ;
	end
    else begin 
	  mux_alu_b <= 2'b00 ;  
	  if ( alu_op == 2'b00 ) mux_alu_b <= 2'b00 ;
	  else if ( MEM_WB_RegW && MEM_WB_WN != 5'd0 && MEM_WB_WN == rt && EX_MEM_WN != rt ) mux_alu_b <= 2'b01 ;
	  else if ( EX_MEM_RegW && EX_MEM_WN != 5'd0 && EX_MEM_WN == rt ) mux_alu_b <= 2'b10 ;
      else mux_alu_b <= 2'b00 ;	  
	end

  end

endmodule

