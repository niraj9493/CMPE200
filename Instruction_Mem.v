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
module Instruction_Mem(
    input [31:0] Addr,
	 input reset,
	 input clk,
    output reg [31:0] Out_Reg
    );

`define NULL 0
`define MEM_SIZE 16

integer scan_file = 0;
integer data_file =  0;
reg [31:0] captured_data;
reg[31:0] mem[15:0];
reg[31:0] counter;
reg[31:0] temp32;
reg[4:0] temp1;


initial 
	begin
		data_file = $fopen("ins.txt", "r");
		if (data_file == `NULL)
		begin
				$display("data_file handle was NULL");
				$finish;
		end
		counter =0;
		temp1 = 0;
		temp32 = 0;
		
	end
	
always @ (posedge clk or negedge clk) 
begin
		
		if(reset)
		begin
			counter = 0;
			temp1 = 0;
			temp32 = 0;
		end
		else
		begin
			if (!$feof(data_file) && counter <= `MEM_SIZE -1 ) 
			begin
				//use captured_data as you would any other wire or reg value;
				scan_file = $fscanf(data_file,"%x\n",captured_data);
				case(temp1)
				
					5'b00000:begin
									temp32 = 0;
									mem[counter] = 32'b0;
									temp32[5:0] = captured_data[5:0];
									mem[counter] = mem[counter] | (temp32 << 26);
									temp1 = temp1 + 5'b1;
								end
					5'b00001:begin 
									temp32 = 0;
									temp32[4:0] = captured_data[4:0];
									mem[counter] = mem[counter] | (temp32 << 21);
									temp1 = temp1 + 5'b1;
								end
					5'b00010:begin 
									temp32 = 0;
									temp32[4:0] = captured_data[4:0];
									mem[counter] = mem[counter] | (temp32 << 16);
									temp1 = temp1 + 5'b1;
								end
					5'b00011:begin 
									temp32 = 0;
									temp32[4:0] = captured_data[4:0];
									mem[counter] = mem[counter] | (temp32 << 11);
									temp1 = temp1 + 5'b1;
								end
					5'b00100:begin 
									temp32 = 0;
									temp32[2:0] = captured_data[2:0];
									mem[counter] = mem[counter] | (temp32 << 8);
									temp1 = temp1 + 5'b1;
								end
					5'b00101:begin 
									temp32 = 0;
									temp32[3:0] = captured_data[3:0];
									mem[counter] = mem[counter] | (temp32 << 4);
									temp1 = temp1 + 5'b1;
								end
					5'b00110:begin 
									temp32 = 0;
									temp32[3:0] = captured_data[3:0];
									mem[counter] = mem[counter] | (temp32 << 0);
									temp1 = 5'b0;
									counter = counter + 1;
								end
				
				endcase		  
			end//if
			else
			begin
				counter = 32'hffffffff;
			end
		end//else
end

	
always @ (Addr)
begin

Out_Reg = mem[Addr];

end
		
			


endmodule
