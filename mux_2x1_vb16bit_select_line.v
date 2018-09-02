`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:54:06 04/15/2018 
// Design Name: 
// Module Name:    mux_16bit_select_line 
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
module mux_16bit_select_line(
    input [31:0] Data_in_1,
    input [31:0] Data_in_2,
    output reg [31:0] DOut,
    input [15:0] select_line
    );

reg sel1 = select_line[4] + select_line[5];
reg sel2 = select_line[6] + select_line[7];
always@(*)
begin

	if(sel1)
	begin
		DOut <= Data_in_1;
	end
	else if(sel2)
	begin
		DOut <= Data_in_2;
	end
	
end
endmodule
