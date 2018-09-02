`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   19:49:37 04/18/2018
// Design Name:   ALU
// Module Name:   D:/cmpe200/ALU_tb.v
// Project Name:  cmpe200
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ALU
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module ALU_tb;

	// Inputs
	reg [17:0] Op_in;
	reg [31:0] input1;
	reg [31:0] input2;

	// Outputs
	wire [31:0] out_32;

	// Instantiate the Unit Under Test (UUT)
	ALU uut (
		.Op_in(Op_in), 
		.input1(input1), 
		.input2(input2), 
		.out_32(out_32)
	);

	initial begin
		// Initialize Inputs
		
		#400
		Op_in = 18'h10001;
		input1 = 32'h00000004;
		input2 = 32'h00000010;

		// Wait 100 ns for global reset to finish
		
		// Add stimulus here

	end
      
endmodule

