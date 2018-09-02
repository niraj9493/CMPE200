`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   04:17:55 04/25/2018
// Design Name:   Branch_MUX
// Module Name:   D:/cmpe200/branch_mux_tb.v
// Project Name:  cmpe200
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Branch_MUX
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module branch_mux_tb;

	// Inputs
	reg [31:0] in1_PC_plus_Imm;
	reg [31:0] in2_from_Jump_Mux;
	reg in_sel_bit;

	// Outputs
	wire [31:0] Out;

	// Instantiate the Unit Under Test (UUT)
	Branch_MUX uut (
		.in1_PC_plus_Imm(in1_PC_plus_Imm), 
		.in2_from_Jump_Mux(in2_from_Jump_Mux), 
		.in_sel_bit(in_sel_bit), 
		.Out(Out)
	);

	initial begin
		// Initialize Inputs
		in1_PC_plus_Imm = 32'hF;
		in2_from_Jump_Mux = 32'hA ;
		in_sel_bit = 1;

		// Wait 100 ns for global reset to finish
		#100;
        in_sel_bit = 0;
		// Add stimulus here

	end
      
endmodule

