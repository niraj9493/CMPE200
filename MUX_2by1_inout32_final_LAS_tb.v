`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   23:32:24 04/20/2018
// Design Name:   MUX_2by1_inout32_final_load_add_sub
// Module Name:   D:/cmpe200/MUX_2by1_inout32_final_LAS_tb.v
// Project Name:  cmpe200
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: MUX_2by1_inout32_final_load_add_sub
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module MUX_2by1_inout32_final_LAS_tb;

	// Inputs
	reg [31:0] input1;
	reg [31:0] input2;
	reg [17:0] select;

	// Outputs
	wire [31:0] out_32_bit;

	// Instantiate the Unit Under Test (UUT)
	MUX_2by1_inout32_final_load_add_sub uut (
		.input1(input1), 
		.input2(input2), 
		.select(select), 
		.out_32_bit(out_32_bit)
	);

	initial begin
		// Initialize Inputs
		input1 = 0;
		input2 = 0;
		select = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

