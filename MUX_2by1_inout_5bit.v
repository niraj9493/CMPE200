`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:59:38 04/18/2018 
// Design Name: 
// Module Name:    MUX_2by1_inout_5bit 
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
module MUX_2by1_inout_5bit(
    input [4:0] input1,
    input [4:0] input2,
    input [19:0] select,
    output reg[4:0] out
    );


always @ (*)
begin
		if(select[0] || select[1]|| select[4]|| select[5] || select[6] || select[18] || select[19] ) //ADD,SUB,SGE,SLE,SEQ,ADDF,MULF - RF[RD]		
		begin
			out = input1;
		end
		else if(select[2] || select[3] || select[7] || select[8] || select[9] || select[10] || select[11]
					 || select[12] || select[13]) 
		// LOAD,STORE,SLI,SRI,ADDI,SUBI or NOP - RF[RS2]
		begin
			out = input2;
		end

end

endmodule
