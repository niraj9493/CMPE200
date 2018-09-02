`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:58:49 04/18/2018 
// Design Name: 
// Module Name:    Data_Mem 
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
module Data_Mem(
    input [31:0] A_in,
    input [31:0] D_in,
    input WE,
    input clk,
    output reg [31:0] D_out
    );

reg [31:0] data_mem [31:0];
integer i;
initial
begin
	for(i = 0; i < 32; i = i + 1)
	begin
		data_mem[i] <= i;
		//register_memory[i] <= 32'b0;
	end
end
always @ (posedge clk)
begin
	if (WE == 1'b1)
	begin
		data_mem[A_in] <= D_in;
	end
	else if (WE == 1'b0)
	begin
		D_out <= data_mem[A_in];
	end

end

endmodule
