`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:54:58 04/25/2018 
// Design Name: 
// Module Name:    Bra_Jump_Adder 
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
module Bra_Jump_Adder(
    input [19:0] Op_code_in,
	 //input bra_out_bit,
	 input [31:0] Address,
    output reg [31:0] Out
    );

always @ (*)
begin
	if(Op_code_in[14] ==1'b 1) //unsuccessful branch.pc = pc + 2  
	begin
		Out = Address + 2 ;
	end
	else  //bra out but is 1 or undefined 
	begin
		//if(Op_code_in[15] == 1'b1)
		//begin
		Out = Address;
		//end
	end
end

endmodule
