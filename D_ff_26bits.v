`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:02:52 04/25/2018 
// Design Name: 
// Module Name:    D_ff_26bits 
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
module D_ff_26bits(
    input [25:0] D,
    input clk,
    output reg [25:0] Q
    );

always @ (posedge clk)
begin
	Q <= D;
end

endmodule
