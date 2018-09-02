`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:33:25 04/28/2018 
// Design Name: 
// Module Name:    test_float 
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
module test_float(
    input [31:0] in,
    output reg [31:0] out
    );

real in1;
real in2 = -0.75;

always @(*)
begin
out = in;
end

endmodule
