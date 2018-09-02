`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   20:54:30 04/15/2018
// Design Name:   opc_dec
// Module Name:   D:/cmpe200/opc_dec_tb.v
// Project Name:  cmpe200
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: opc_dec
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module opc_dec_tb;

	// Inputs
	reg [31:0] code_in;

	// Outputs
	wire [17:0] code_out;

	// Instantiate the Unit Under Test (UUT)
	opc_dec uut (
		.code_in(code_in), 
		.code_out(code_out)
	);

	initial begin
		// Initialize Inputs
		code_in = 6'b000000;

		// Wait 100 ns for global reset to finish
		#100;
      code_in = 6'b000001;
		#100;
		code_in = 6'b000010;
		#100;
		code_in = 6'b000011;
		// Add stimulus here

	end
      
endmodule

