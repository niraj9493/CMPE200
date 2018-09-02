`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    05:37:45 04/25/2018 
// Design Name: 
// Module Name:    D_FF_16bit 
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
module D_FF_16bit(
    input [15:0] D,
    input clk,
    output reg [15:0] Q
    );

always @(posedge clk)
begin
	Q <= D;

end

endmodule
