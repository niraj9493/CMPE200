`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:31:43 04/18/2018 
// Design Name: 
// Module Name:    MUX_2by1_inout32_final_load_add_sub 
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
module MUX_2by1_inout32_final_load_add_sub(
    input [31:0] input1,
    input [31:0] input2,
    input [19:0] select,
    output reg [31:0] out_32_bit
    );
always @ (*)
begin
		if(select[2]) //LOAD - select data memory output - port1		
		begin
			out_32_bit = input1;
		end
		else if( select[0] || select[1] || select[4] || select[5]  || select[6] ||
					select[7] || select[8] || select[9] || select[10] || select[11] || 
					select[12] || select[13] || select[18] || select[19]) 
					// ADD,SUB,SGE,SLE,SEQ,SLI,SRI,ADDI,SUBI,NOP,MOVE,MOVEI - bypasses the data_memory 
		begin 
			out_32_bit = input2;
		end

end

endmodule
