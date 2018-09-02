`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:59:42 04/13/2018
// Design Name:   Program_counter
// Module Name:   D:/cmpe200/test_ins_mem_file_tb.v
// Project Name:  cmpe200
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Program_counter
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_ins_mem_file_tb;

	// Inputs
	reg [31:0] Addr;
	reg reset;
	reg clk;

	// Outputs
	wire [31:0] Out_Reg;

	// Instantiate the Unit Under Test (UUT)
	Program_counter uut (
		.Addr(Addr), 
		.clk(clk),
		.reset(reset), 
		.Out_Reg(Out_Reg)
	);

	initial begin
		// Initialize Inputs
		Addr = 0;
		reset = 1;
		clk=0;

		// Wait 100 ns for global reset to finish
		
      
		#10
		reset=0;
		// Add stimulus here

	end
      
always
begin
	#5 clk = ~clk;
end

endmodule


