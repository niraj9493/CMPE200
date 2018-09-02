`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    04:14:52 04/25/2018 
// Design Name: 
// Module Name:    Branch_MUX 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module Branch_MUX(
    input [31:0] in1_PC_plus_Imm,
    input [31:0] in2_from_Jump_Mux,
    input in_sel_bit,
    output reg [31:0] Out
    );

always @ (*)
begin
	
	if(in_sel_bit == 1'b1)
	begin
	
	Out =  in1_PC_plus_Imm;
			
	end
	else
	begin
		
	Out = in2_from_Jump_Mux;
		
	end

end
endmodule
