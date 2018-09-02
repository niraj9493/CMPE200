`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:04:23 04/25/2018
// Design Name:   JUMP_Mux
// Module Name:   D:/cmpe200/Jump_mux_tb.v
// Project Name:  cmpe200
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: JUMP_Mux
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Jump_mux_tb;

	// Inputs
	reg [31:0] Pc_in;
	reg [25:0] Imm_in;
	reg [17:0] jump_mux_sel;

	// Outputs
	wire [31:0] jum_mux_out;

	// Instantiate the Unit Under Test (UUT)
	JUMP_Mux uut (
		.Pc_in(Pc_in), 
		.Imm_in(Imm_in), 
		.jump_mux_sel(jump_mux_sel), 
		.jum_mux_out(jum_mux_out)
	);

	initial begin
		// Initialize Inputs
		Pc_in = 0;
		Imm_in = 0;
		jump_mux_sel = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

