`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:08:33 04/15/2018 
// Design Name: 
// Module Name:    register_file 
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
module register_file(
    input [31:0] instruction,
    input [31:0] Data_in,
    input WE,
	 input clk,
    input [4:0] AddrIn3,
    output reg [31:0] DOut1,
    output reg [31:0] DOut2
    );
reg [4:0] AddrIn1;
reg [4:0] AddrIn2;
reg [31:0] register_memory [15:0];
integer i;


initial
begin
	AddrIn1 =0;
	AddrIn2 =0;
	for(i = 0; i < 16; i = i + 1)
	begin
		//register_memory[i] <= 32'b0 | (1<<i);
		register_memory[i] <= i;
	end
	//register_memory[14] <= 32'h40000000; //2
	//register_memory[15] <= 32'h3f800000; //1
	register_memory[14] <= 32'h415e6666; //13.9
	register_memory[15] <= 32'h4161999a; //14.1


end




always @ (posedge clk)
begin
	
	AddrIn1 = instruction[25:21];
	AddrIn2 = instruction[20:16];
	
	if(WE == 1'b1)
	begin
		register_memory[AddrIn3] = Data_in;
	end
	else
	begin
		DOut1 = register_memory[AddrIn1];
		DOut2 = register_memory[AddrIn2];
	end
end
endmodule
