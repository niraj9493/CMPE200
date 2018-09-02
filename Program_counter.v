`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:08:24 04/14/2018 
// Design Name: 
// Module Name:    Program_counter 
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
module Program_counter(
    input [31:0] Address,
	 input clk,
    output reg [31:0] Out_Addr1,
	 output reg [31:0] Out_Addr2_plus_1
	 
    );
	 
reg [31:0] inc;
reg [32:0] prev,next;


initial 
begin

#130 
inc =0;	
prev = 0;

	
end 

always @ (posedge clk)
begin
	
	/*next = Address;
	if(prev != Address)
	begin
		inc = Address;
		prev = next;
	end
	else
	begin
		Out_Addr = inc;
		inc = inc + 1;
	
	end*/
	
	//Out_Addr1 = Address;
	//Out_Addr2_plus_1 = Address + 1;
	
		next = Address;
	if(prev != Address)
	begin
		inc = Address;
		prev = next;
	end
	else
	begin
		Out_Addr1 = inc;
		Out_Addr2_plus_1 = inc + 1;
	
	end
end


endmodule
