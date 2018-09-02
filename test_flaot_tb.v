`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:35:13 04/28/2018
// Design Name:   test_float
// Module Name:   D:/cmpe200/test_flaot_tb.v
// Project Name:  cmpe200
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: test_float
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_flaot_tb;

	// Inputs
	reg [31:0] in;

	// Outputs
	wire [31:0] out;

	// Instantiate the Unit Under Test (UUT)
	test_float uut (
		.in(in), 
		.out(out)
	);

	initial begin
		// Initialize Inputs
		in = 0;

		// Wait 100 ns for global reset to finish
		#100;
		in = -0.75;
		// Add stimulus here

	end
      
endmodule

