`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:33:59 04/22/2018
// Design Name:   D_ff_opcode_stage4
// Module Name:   D:/cmpe200/D_ff_opc_stage4_tb.v
// Project Name:  cmpe200
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: D_ff_opcode_stage4
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module D_ff_opc_stage4_tb;

	// Inputs
	reg [17:0] D;
	reg clk;

	// Outputs
	wire [17:0] Q;

	// Instantiate the Unit Under Test (UUT)
	D_ff_opcode_stage4 uut (
		.D(D), 
		.Q(Q), 
		.clk(clk)
	);

	initial begin
		// Initialize Inputs
		D = 0;
		clk = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

