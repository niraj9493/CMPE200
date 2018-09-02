`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   05:20:33 04/25/2018
// Design Name:   top_intr
// Module Name:   D:/cmpe200/top_intr_tb.v
// Project Name:  cmpe200
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: top_intr
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module top_intr_tb;

	// Inputs
	reg clk;
	reg reset;

	// Instantiate the Unit Under Test (UUT)
	top_intr uut (
		.clk(clk), 
		.reset(reset)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 1;

		// Wait 100 ns for global reset to finish
		#5 
		reset =0;
        
		// Add stimulus here

	end

always
begin
#1 clk = ~clk;
end  
endmodule

