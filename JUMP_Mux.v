`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:57:28 04/25/2018 
// Design Name: 
// Module Name:    JUMP_Mux 
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
module JUMP_Mux(
    input [31:0] Pc_in,
    input [25:0] Imm_in,
    input [19:0] jump_mux_sel,
    output reg [31:0] jum_mux_out
    );

reg [31:0] Imm_ext_reg = 32'b0;

always @ (*)
begin
	if(jump_mux_sel[15] == 1'b1)
	begin
		Imm_ext_reg[25:0] = Imm_in;
		jum_mux_out = Imm_ext_reg;
	end
	else
	begin
		jum_mux_out = Pc_in;
	end
end

endmodule
