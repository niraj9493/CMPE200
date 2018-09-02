`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   22:15:58 04/17/2018
// Design Name:   Stage_1and2
// Module Name:   D:/cmpe200/Stage_1and2_tb.v
// Project Name:  cmpe200
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Stage_1and2
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Stage_1and2_tb;

	// Inputs
	reg clk;
	reg reset;

	// Instantiate the Unit Under Test (UUT)
	Stage_1and2 uut (
		.clk(clk),
		.reset(reset)
		);

	initial begin
		// Initialize Inputs
		clk =0;
		reset =1;
		// Wait 100 ns for global reset to finish
		#10
		reset =0;

	end
 
always
begin
	#1 clk = ~clk; 
end
endmodule

