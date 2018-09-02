`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   23:53:18 04/14/2018
// Design Name:   Program_counter
// Module Name:   D:/cmpe200/program_counter_tb.v
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

module program_counter_tb;

	// Inputs
	reg [31:0] Address;
	reg clk;

	// Outputs
	wire [31:0] Out_Addr;

	// Instantiate the Unit Under Test (UUT)
	Program_counter uut (
		.Address(Address), 
		.clk(clk), 
		.Out_Addr(Out_Addr)
	);

	initial begin
		// Initialize Inputs
		Address = 0;
		clk = 0;

		// Wait 100 ns for global reset to finish
	
        #100
		  Address = 2;
		// Add stimulus here

	end
	
always
begin
#5 clk = ~clk;
end
      
endmodule

