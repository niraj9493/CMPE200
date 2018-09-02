`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   13:01:52 04/25/2018
// Design Name:   Bra_Jump_Adder
// Module Name:   D:/cmpe200/Bra_Jump_Addr_tb.v
// Project Name:  cmpe200
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Bra_Jump_Adder
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Bra_Jump_Addr_tb;

	// Inputs
	reg [17:0] Op_code_in;
	reg bra_out_bit;
	reg [31:0] Address;

	// Outputs
	wire [31:0] Out;

	// Instantiate the Unit Under Test (UUT)
	Bra_Jump_Adder uut (
		.Op_code_in(Op_code_in), 
		.bra_out_bit(bra_out_bit), 
		.Address(Address), 
		.Out(Out)
	);

	initial begin
		// Initialize Inputs
		Op_code_in[15] = 0;
	
		Address = 5;

		// Wait 100 ns for global reset to finish
		#10;
		bra_out_bit = 0;
        
		// Add stimulus here

	end
      
endmodule

