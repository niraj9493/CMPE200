`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:27:25 04/22/2018 
// Design Name: 
// Module Name:    D_ff_opcode_stage4 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module D_ff_opcode_stage4(
    input [19:0] D,
    output reg [19:0] Q,
    input clk
    );
parameter ADD   = 1 ;
parameter SUB   = 2 ;
parameter LOAD  = 4 ;
parameter STORE = 8 ;
parameter SGE 	 = 16;
parameter SLE 	 = 32;
parameter SEQ   = 64;
parameter SLI   = 128;
parameter SRI   = 256;
parameter ADDI  = 512;
parameter SUBI  = 1024;
parameter NOP   = 2048;
parameter MOVE  = 4096;
parameter MOVEI = 8192;
parameter ADDF  = 262144;
parameter MULF  = 524288;

always @ (posedge clk)
begin
	case(D)
	
	ADD	: Q <= D | (1<<16);	
	
	SUB	: Q <= D | (1<<16);	
	
	LOAD	: Q <= D | (1<<16);		
	
	STORE	: Q <= D | (1<<17);	
			
	SGE	: Q <= D | (1<<16);
	
	SLE	: Q <= D | (1<<16);
	
	SEQ	: Q <= D | (1<<16);
	
	SLI	: Q <= D | (1<<16);
	
	SRI	: Q <= D | (1<<16);
	
	ADDI	: Q <= D | (1<<16);
	
	SUBI	: Q <= D | (1<<16);
	
	NOP	: begin
				Q <= (D & 20'b000000100000000000 );
			 end
	MOVE  : Q <= D | (1<<16);

	MOVEI : Q <= D | (1<<16);
	
	ADDF	: Q <= D | (1<<16);
	
	MULF	: Q <= D | (1<<16);
	
	default: Q <= ( D & 20'b00111111111111111 );
	endcase
end

endmodule
