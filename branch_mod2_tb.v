`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   03:43:24 04/25/2018
// Design Name:   branch_ins_mod2
// Module Name:   D:/cmpe200/branch_mod2_tb.v
// Project Name:  cmpe200
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: branch_ins_mod2
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module branch_mod2_tb;

	// Inputs
	reg [15:0] Imm_in;
	reg [31:0] PC_in;

	// Outputs
	wire [31:0] Add_out;

	// Instantiate the Unit Under Test (UUT)
	branch_ins_mod2 uut (
		.Imm_in(Imm_in), 
		.PC_in(PC_in), 
		.Add_out(Add_out)
	);

	initial begin
		// Initialize Inputs
		Imm_in = 0;
		PC_in = 0;

		// Wait 100 ns for global reset to finish
		#100;
		Imm_in = 15'h000F;
		PC_in = 10;
		// Add stimulus here

	end
      
endmodule

