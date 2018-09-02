`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   21:20:37 04/15/2018
// Design Name:   register_file
// Module Name:   D:/cmpe200/register_file_tb.v
// Project Name:  cmpe200
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: register_file
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module register_file_tb;

	// Inputs
	reg [31:0] instruction;
	reg [31:0] Data_in;
	reg WE;
	reg [4:0] AddrIn3;
	reg clk;

	// Outputs
	wire [31:0] DOut1;
	wire [31:0] DOut2;

	// Instantiate the Unit Under Test (UUT)
	register_file uut (
		.instruction(instruction), 
		.Data_in(Data_in), 
		.clk(clk),
		.WE(WE), 
		.AddrIn3(AddrIn3), 
		.DOut1(DOut1), 
		.DOut2(DOut2)
	);

	initial begin
		// Initialize Inputs
		instruction = 0;
		Data_in = 0;
		WE = 0;
		AddrIn3 = 0;
		clk=0;
		

		// Wait 100 ns for global reset to finish
		#10
		WE = 1;
		AddrIn3 = 5;
		Data_in = 2;
		#10
		WE=0;
		#10
		WE = 1;
		AddrIn3 = 6;
		Data_in = 4;
		#10
		WE=0;
		instruction  = 32'h00a60000;
		// Add stimulus here

	end
	
	
always
begin
#5 clk = ~clk;
end
      
endmodule

