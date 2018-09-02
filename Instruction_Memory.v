`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:44:05 04/13/2018 
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
    input [31:0] Addr,
	 input reset,
	 input clk,
    output reg [31:0] Out_Reg
    );

`define NULL 0
integer scan_file,data_file;
reg [31:0] captured_data;
reg[31:0] mem[9:0];
reg[31:0] counter;
reg flag;

initial 
	begin
		data_file = $fopen("ins.txt", "r");
		if (data_file == `NULL)
		begin
				$display("data_file handle was NULL");
				$finish;
		end
	end

always @ (posedge clk) 
begin
		if(reset)
		begin
			counter = 0;
		end
		else
		begin
			scan_file = $fscanf(data_file,"%x\n",captured_data);
			if (!$feof(data_file)) 
			begin
				//use captured_data as you would any other wire or reg value;
				mem[counter] = captured_data;
				counter = counter + 1;
			end
		end
end
		
		
		
			


endmodule
