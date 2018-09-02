`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:06:40 04/25/2018
// Design Name:   D_ff_26bits
// Module Name:   D:/cmpe200/D_ff_26bits_tb.v
// Project Name:  cmpe200
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: D_ff_26bits
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module D_ff_26bits_tb;

	// Inputs
	reg [25:0] D;
	reg clk;

	// Outputs
	wire [25:0] Q;

	// Instantiate the Unit Under Test (UUT)
	D_ff_26bits uut (
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

