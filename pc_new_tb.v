`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   04:47:18 04/25/2018
// Design Name:   Program_counter
// Module Name:   D:/cmpe200/pc_new_tb.v
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

module pc_new_tb;

	// Inputs
	reg [31:0] Address;
	reg clk;

	// Outputs
	wire [31:0] Out_Addr1;
	wire [31:0] Out_Addr2_plus_1;

	// Instantiate the Unit Under Test (UUT)
	Program_counter uut (
		.Address(Address), 
		.clk(clk), 
		.Out_Addr1(Out_Addr1), 
		.Out_Addr2_plus_1(Out_Addr2_plus_1)
	);

	initial begin
		// Initialize Inputs
		Address = 0;
		clk = 0;
	end


always
begin
#5 clk = ~clk;
end      
endmodule

