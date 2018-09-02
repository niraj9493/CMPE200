`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   20:06:05 04/18/2018
// Design Name:   MUX_2by1_inout_5bit
// Module Name:   D:/cmpe200/MUX_2by1_inout_5bit_tb.v
// Project Name:  cmpe200
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: MUX_2by1_inout_5bit
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module MUX_2by1_inout_5bit_tb;

	// Inputs
	reg [4:0] input1;
	reg [4:0] input2;
	reg [17:0] select;

	// Outputs
	wire [4:0] out;

	// Instantiate the Unit Under Test (UUT)
	MUX_2by1_inout_5bit uut (
		.input1(input1), 
		.input2(input2), 
		.select(select), 
		.out(out)
	);

	initial begin
		// Initialize Inputs
		input1 = 1;
		input2 = 2;
		select = 4;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

