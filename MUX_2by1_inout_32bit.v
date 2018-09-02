`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:47:49 04/18/2018 
// Design Name: 
// Module Name:    MUX_2by1_inout_32bit 
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
module MUX_2by1_inout_32bit(
    input [31:0] input1,
    input [31:0] input2,
    input [19:0] select,
    output reg [31:0] out_32
    );

always@(*)
begin

	if(select[0] || select[1] || select[4] || select[5] || select[6] || select[18] || select[19])
	begin
		out_32 <= input1;		// ADD ,SUB,SGE,SLE,SEQ,ADDF,MULF - RF[RS2]
 	end
	else if(select[2] || select[3] || select[7] || select[8] || select[9] || select[10]  || select[13])
	begin
		if(select[9] || select[10])
		begin
			if(input2[15] == 0)
			begin
				out_32 <= input2;
			end
			else
			begin
				out_32 <= (input2 | 32'hffff0000);
			end
		end
		else
		begin
			out_32 <= input2;		// // LOAD,STORE,SLI,SRI,ADDI,SUBI, MOVEI - Immediate Value
		end
	end
	else if(select[11]  || select[12]) // NOP or MOVE - select 0
	begin 
	 out_32 <= 32'b0;
	end
end
endmodule
