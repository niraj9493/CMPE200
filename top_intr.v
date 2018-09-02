`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    04:22:37 04/25/2018 
// Design Name: 
// Module Name:    top_intr 
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
module top_intr(
    input clk,
    input reset
    );

wire[31:0] Out1;
wire[31:0] D_ff_out_wire;
wire[31:0] ins_out_wire;
wire [31:0] reg_dout1_wire;
wire [15:0] Imm_16bit_in_wire;
wire[4:0] RS2_value_wire;
wire [4:0] RS2_value_delayed_wire;
wire [5:0] op_wire;
wire[17:0] opc_decoder_out_wire;
wire[31:0] bra_mod2_out_wire;
wire[31:0] bra_MUX_out_wire;
wire[15:0] D_ff_16bit_out_wire;
wire[31:0] pc_out2_plus_1_wire;
wire out_bit_wire;
wire neg_out_bit;
wire[31:0] Br_J_Out_Addr_wire;
wire[31:0] D_ff_Out2_wire;
wire[17:0] d_ff_bra_j_opcode_out;
wire[25:0] jump_imm_val_wire;
wire[25:0] D_ff_26b_out_wire;
wire[31:0] jump_Mux_out_wire;

		//Program_counter PC_new_ob (.Address(bra_MUX_out_wire), .clk(clk), .Out_Addr1(Out1), .Out_Addr2_plus_1(pc_out2_plus_1_wire)	);
		
		//D_flip_flop D_ff_bra_jump (.data_in(Out1), .clk(clk), .data_out( D_ff_out_wire )	);
		//D_flip_flop D_ff_Out2 (.data_in(pc_out2_plus_1_wire), .clk(clk), .data_out( D_ff_Out2_wire )	);

		
		//Instruction_Mem mem_new (.Addr(Out1), .reset(reset), .clk(clk), .Out_Reg(ins_out_wire));
		//register_file reg_new (.instruction(ins_out_wire), .Data_in(Data_in) ,.WE(WE), .clk(clk), .AddrIn3(AddrIn3), .DOut1(reg_dout1_wire), .DOut2(DOut2) );
		//opc_dec opc_ob (.code_in(ins_out_wire), .code_out(opc_decoder_out_wire));
		
	
		//assign Imm_16bit_in_wire = ins_out_wire[15:0];
		//assign RS2_value_wire = ins_out_wire[20:16];
		//assign jump_imm_val_wire = ins_out_wire[25:0];
		
		//D_FF_16bit Dff_16bit_ob (	.D(Imm_16bit_in_wire), .clk(clk), .Q(D_ff_16bit_out_wire) );
		//D_ff_5 d_5_rs_value (.data_in(RS2_value_wire), .clk(clk), .data_out(RS2_value_delayed_wire));
		//branch_ins_mod2 bra_mod2_ob (.Imm_in(D_ff_16bit_out_wire), .PC_in(D_ff_out_wire), 	.Add_out(bra_mod2_out_wire) );
		//branch_ins_mod1 bra_mod1_ob (.opc_in(opc_decoder_out_wire), .RF_in(reg_dout1_wire), .RS_val(RS2_value_delayed_wire), .out_bit(out_bit_wire)	);
		
		//assign neg_out_wire = ~out_bit_wire;
		
		//D_ff_18 D_FF_bra_j_opcode (.data_in(opc_decoder_out_wire), .clk(clk), .data_out(d_ff_bra_j_opcode_out));

		//Bra_Jump_Adder Br_Jmp_Adder_Ob (	.Op_code_in(opc_decoder_out_wire), 	.bra_out_bit(neg_out_wire), .Address(D_ff_Out2_wire), 	.Out(Br_J_Out_Addr_wire)	);
		
		//D_ff_26bits Dff_26bits_ob (	.D(jump_imm_val_wire), 	.clk(clk), 	.Q(D_ff_26b_out_wire)	);
		//JUMP_Mux Jump_Mux_out (.Pc_in(D_ff_Out2_wire),.Imm_in(D_ff_26b_out_wire), .jump_mux_sel(d_ff_bra_j_opcode_out), 	.jum_mux_out(jump_Mux_out_wire) );
		//Bra_Jump_Adder Br_Jmp_Adder_Ob (	.Op_code_in(d_ff_bra_j_opcode_out),  .Address(jump_Mux_out_wire), 	.Out(Br_J_Out_Addr_wire)	);
		//Branch_MUX bra_MUX_ob (	.in1_PC_plus_Imm(bra_mod2_out_wire), 	.in2_from_Jump_Mux(Br_J_Out_Addr_wire), .in_sel_bit(out_bit_wire), .Out(bra_MUX_out_wire)	);


endmodule
