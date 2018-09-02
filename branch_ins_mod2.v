`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    03:40:25 04/25/2018 
// Design Name: 
// Module Name:    branch_ins_mod2 
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
module branch_ins_mod2(
    input [15:0] Imm_in,
    input [31:0] PC_in,
    output reg [31:0] Add_out
    );

reg[31:0] Imm_ext = 32'b0;

always @ (*)
begin

	Imm_ext[15:0] = Imm_in;
	Add_out = Imm_ext + PC_in;	

end
endmodule
