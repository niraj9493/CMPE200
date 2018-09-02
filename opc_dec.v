`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:36:10 04/15/2018 
// Design Name: 
// Module Name:    opc_dec 
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
module opc_dec(
    input [31:0] code_in,
    output reg[19:0] code_out
    );

reg [5:0] opcode;
parameter ADD   = 6'b000000 ; //OPCODE : 0
parameter SUB   = 6'b000001 ;	//OPCODE : 1
parameter LOAD  = 6'b000010 ;	//OPCODE : 2
parameter STORE = 6'b000011 ;	//OPCODE : 3
parameter SGE 	 = 6'b000100 ;	//OPCODE : 4
parameter SLE   = 6'b000101 ;	//OPCODE : 5
parameter SEQ   = 6'b000110 ;	//OPCODE : 6

parameter SLI  = 6'b000111 ;  //OPCODE : 7
parameter SRI 	= 6'b001000 ;	//OPCODE : 8
parameter ADDI = 6'b001001 ;	//OPCODE : 9
parameter SUBI = 6'b001010 ;	//OPCODE : 10

parameter NOP 		= 6'b001011 ; //OPCODE : 11
parameter MOVE 	= 6'b001100 ; //OPCODE : 12
parameter MOVEI 	= 6'b001101 ; //OPCODE : 13
parameter BRA  	= 6'b001110 ; //OPCODE : 14
parameter JUMP 	= 6'b001111 ; //OPCODE : 15
parameter ADDF		= 6'b010000 ; //OPCODE : 16
parameter MULF		= 6'b010001 ; //OPCODE : 17


always @ (*)
begin
opcode = code_in[31:26];
end

always @ *
begin
	case(opcode)
	ADD	: 	begin
				code_out = 20'b01;
				//code_out = code_out | (1<<16);
				end
	SUB	: begin
			  code_out = 20'b10;
			  //code_out = code_out | (1<<16);
			  end
	LOAD	: begin
			  code_out = 20'b100;
			  //code_out = code_out | (1<<16);
			  end
	STORE	: begin
			  code_out = 20'b1000;
			  //code_out = code_out | (1<<17);
			  end
	SGE	: begin
			  code_out = 20'b10000;
			  end
	SLE 	: begin
			  code_out = 20'b100000;			  
			  end
	SEQ	: begin
			  code_out = 20'b1000000;
			  end
			  
	SLI	: 	begin
				code_out = 20'b10000000;
				end
	
	SRI	: 	begin
				code_out = 20'b100000000;
				end
	
	ADDI	: 	begin
				code_out = 20'b1000000000;
				end
	
	SUBI	: 	begin
				code_out = 20'b10000000000;
				end
				
	NOP	: 	begin
				code_out = 20'b100000000000;
				end
	
	MOVE	: 	begin
				code_out = 20'b1000000000000;
				end
	
	MOVEI	: 	begin
				code_out = 20'b10000000000000;
				end
	
	BRA	: 	begin
				code_out = 20'b100000000000000;
				end	
	
	JUMP	: 	begin
				code_out = 20'b1000000000000000;
				end	
	ADDF	: 	begin
				code_out = 20'b1000000000000000000;
				end		  		  
	MULF	: 	begin
				code_out = 20'b10000000000000000000;
				end
	endcase
	

end

endmodule
