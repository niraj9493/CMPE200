`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   03:31:36 04/25/2018
// Design Name:   branch_ins_mod1
// Module Name:   D:/cmpe200/branch_mod1_tb.v
// Project Name:  cmpe200
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: branch_ins_mod1
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module branch_mod1_tb;

	// Inputs
	reg [17:0] opc_in;
	reg [31:0] RF_in;
	reg [4:0] RS_val;

	// Outputs
	wire out_bit;

	// Instantiate the Unit Under Test (UUT)
	branch_ins_mod1 uut (
		.opc_in(opc_in), 
		.RF_in(RF_in), 
		.RS_val(RS_val), 
		.out_bit(out_bit)
	);

	initial begin
		// Initialize Inputs
		opc_in = 0;
		RF_in = 0;
		RS_val = 0;

		// Wait 100 ns for global reset to finish
		#100;
       RF_in = 10;
		 RS_val = 5'b01010;

		#10;
		RS_val = 5'b00100;
// Add stimulus here

	end
      
endmodule

