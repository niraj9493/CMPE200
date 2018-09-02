`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   12:38:05 04/17/2018
// Design Name:   D_flip_flop
// Module Name:   D:/cmpe200/D_flip_flop_tb.v
// Project Name:  cmpe200
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: D_flip_flop
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module D_flip_flop_tb;

	// Inputs
	reg [31:0] data_in;
	reg clk;

	// Outputs
	wire [31:0] data_out;

	// Instantiate the Unit Under Test (UUT)
	D_flip_flop uut (
		.data_in(data_in), 
		.clk(clk), 
		.data_out(data_out)
	);

	initial begin
		// Initialize Inputs
		data_in = 10;
		clk = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end

always
begin
#5 clk = ~clk;
end     
endmodule

