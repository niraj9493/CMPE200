`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:23:48 04/15/2018 
// Design Name: 
// Module Name:    D_flip_flop 
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
module D_flip_flop(
    input [31:0] data_in,
    input clk,
    output reg [31:0] data_out
    );
	 
always @ (posedge clk)
begin
	data_out <= data_in;
end

endmodule
