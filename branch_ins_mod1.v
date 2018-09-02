`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    03:26:47 04/25/2018 
// Design Name: 
// Module Name:    branch_ins_mod1 
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
module branch_ins_mod1(
    input [19:0] opc_in,
    input [31:0] RF_in,
    input [4:0] RS_val,
    output reg out_bit
    );

reg[31:0] RS_ext = 32'b0;

always @(*)
begin
	if(1 == opc_in[14])
	begin
		RS_ext[4:0] = RS_val;
		if(RS_ext == RF_in)
		begin
			out_bit = 1'b1;
		end
		else
		begin
			out_bit = 1'b0;
		end
	end
	else
	begin
		out_bit = 1'b0;
	end
end

endmodule
