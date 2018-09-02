`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   23:06:39 04/18/2018
// Design Name:   Data_Mem
// Module Name:   D:/cmpe200/Data_mem_tb.v
// Project Name:  cmpe200
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Data_Mem
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Data_mem_tb;

	// Inputs
	reg [31:0] A_in;
	reg [31:0] D_in;
	reg WE;
	reg clk;

	// Outputs
	wire [31:0] D_out;

	// Instantiate the Unit Under Test (UUT)
	Data_Mem uut (
		.A_in(A_in), 
		.D_in(D_in), 
		.WE(WE), 
		.clk(clk), 
		.D_out(D_out)
	);

	initial begin
		// Initialize Inputs
		A_in = 0;
		D_in = 0;
		WE = 0;
		clk = 0;

		// Wait 100 ns for global reset to finish
		#100;
        WE <= 1'b1;
		  A_in <= 32'b1;
		  D_in <= 32'b100;
		 #100
		 WE <= 1'b0;
		 A_in <= 32'b1;
		// Add stimulus here

	end
always #5 clk = ~clk;
endmodule

