`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   05:39:33 04/25/2018
// Design Name:   D_FF_16bit
// Module Name:   D:/cmpe200/d_ff_16bit_tb.v
// Project Name:  cmpe200
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: D_FF_16bit
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module d_ff_16bit_tb;

	// Inputs
	reg [15:0] D;
	reg clk;

	// Outputs
	wire [15:0] Q;

	// Instantiate the Unit Under Test (UUT)
	D_FF_16bit uut (
		.D(D), 
		.clk(clk), 
		.Q(Q)
	);

	initial begin
		// Initialize Inputs
		D = 0;
		clk = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

