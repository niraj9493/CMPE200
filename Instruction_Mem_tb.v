`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   21:52:05 04/14/2018
// Design Name:   Instruction_Mem
// Module Name:   D:/cmpe200/Instruction_Mem_tb.v
// Project Name:  cmpe200
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Instruction_Mem
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Instruction_Mem_tb;

	// Inputs
	reg [31:0] Addr;
	reg reset;
	reg clk;

	// Outputs
	wire [31:0] Out_Reg;

	// Instantiate the Unit Under Test (UUT)
	Instruction_Mem uut (
		.Addr(Addr), 
		.reset(reset), 
		.clk(clk), 
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
		#120 
		Addr =5;
			// Add stimulus here

	end
      
always
begin
	#1 clk = ~clk;
end

		
endmodule



