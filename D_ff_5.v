`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:46:13 04/17/2018 
// Design Name: 
// Module Name:    D_ff_5 
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
module D_ff_5(
    input [4:0] data_in,
    input clk,
    output reg [4:0] data_out
    );

	 
always @ (posedge clk)
begin
	data_out <= data_in;
end

endmodule
