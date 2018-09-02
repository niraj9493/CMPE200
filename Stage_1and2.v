`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:06:47 04/17/2018 
// Design Name: 
// Module Name:    Stage_1and2 
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
module Stage_1and2(
    input [31:0] PC_in,
	 input clk, 
	 input reset,
	 output [17:0] D1,
    output [31:0] D2 ,
	 output [31:0] D3,
    output [4:0] D4,
	 output [31:0] ALU_out
    );

wire[31:0] out_addr_wire;
wire[31:0] out_d1;
wire[31:0] reg_out_1;
wire[31:0] reg_out_2;
//wire[17:0] opc_dec_out;
wire[19:0] opc_dec_out;

wire[4:0] rd_wire;
wire[4:0] rs2_wire;
wire[4:0] mux_inout_5bit_wire;
wire [31:0] immediate_value_wire;
wire [31:0] mux_inout_32bit_imm_wire;
wire [31:0] D3_wire;
wire [31:0] D2_wire;
wire [31:0] ALU_input2_wire;
wire [31:0] ALU_input1_wire;
wire[31:0] ALU_wire;
//wire[17:0] opc_stage_2to3_wire;
wire[19:0] opc_stage_2to3_wire;

wire[4:0] rd_stage3_wire;
wire[31:0] data_mem_input_wire;
wire[31:0] d2_stage4_wire;
wire WE_from_opc;
//wire[17:0] opc_stage_3to4_wire;
wire[19:0] opc_stage_3to4_wire;

wire [31:0] data_mem_out_wire;
wire [4:0] rd_stage4_wire;
wire [31:0] d2_wb_stage_wire;
wire [31:0] d_alu_wb_stage;
wire [4:0] ain3_rf_wire;
wire[31:0] din_rf_wire;
wire WE_for_Reg_File;
//wire[17:0] D_ff_opc_Reg_WE_stage4_wire;
wire[19:0] D_ff_opc_Reg_WE_stage4_wire;

//wire[17:0] D_ff_int1_out;
wire[19:0] D_ff_int1_out;

wire[31:0] D_ff_int2_out;
wire[4:0] D_ff_int3_out;
//wire[17:0] D_ff_int1_S4_out;
wire[19:0] D_ff_int1_S4_out;

wire[31:0] D_ff_int2_S4_out;
wire[4:0] D_ff_int3_S4_out;

	
wire[31:0] Out1;
wire[31:0] D_ff_out_wire;
wire[31:0] ins_out_wire;
wire [31:0] reg_dout1_wire;
wire [15:0] Imm_16bit_in_wire;
wire[4:0] RS2_value_wire;
wire [4:0] RS2_value_delayed_wire;
wire [5:0] op_wire;
//wire[17:0] opc_decoder_out_wire;
wire[19:0] opc_decoder_out_wire;

wire[31:0] bra_mod2_out_wire;
wire[31:0] bra_MUX_out_wire;
wire[15:0] D_ff_16bit_out_wire;
wire[31:0] pc_out2_plus_1_wire;
wire out_bit_wire;
wire neg_out_bit;
wire[31:0] Br_J_Out_Addr_wire;
wire[31:0] D_ff_Out2_wire;
//wire[17:0] d_ff_bra_j_opcode_out;
wire[19:0] d_ff_bra_j_opcode_out;

wire[25:0] jump_imm_val_wire;
wire[25:0] D_ff_26b_out_wire;
wire[31:0] jump_Mux_out_wire;

	//Program_counter pc_ob (	.Address(PC_in), 	.clk(clk), 	.Out_Addr(out_addr_wire)	);	
	//Instruction_Mem mem_ob (.Addr(out_addr_wire), .reset(reset), .clk(clk), .Out_Reg(out_d1));
	//register_file reg_ob (.instruction(out_d1), .Data_in(din_rf_wire) ,.WE(WE_for_Reg_File), .clk(clk), .AddrIn3(ain3_rf_wire), .DOut1(reg_out_1), .DOut2(reg_out_2) );
	//opc_dec opc_ob (.code_in(out_d1), .code_out(opc_dec_out));
	
	Program_counter PC_new_ob (.Address(bra_MUX_out_wire), .clk(clk), .Out_Addr1(Out1), .Out_Addr2_plus_1(pc_out2_plus_1_wire)	);
	
	D_flip_flop D_ff_bra_jump (.data_in(Out1), .clk(clk), .data_out( D_ff_out_wire )	);
	D_flip_flop D_ff_Out2 (.data_in(pc_out2_plus_1_wire), .clk(clk), .data_out( D_ff_Out2_wire )	);
	
	Instruction_Mem mem_new (.Addr(Out1), .reset(reset), .clk(clk), .Out_Reg(ins_out_wire));
	register_file reg_new (.instruction(ins_out_wire), .Data_in(din_rf_wire) ,.WE(WE_for_Reg_File), .clk(clk), .AddrIn3(ain3_rf_wire), .DOut1(reg_dout1_wire), .DOut2(reg_out_2) );
	opc_dec opc_ob (.code_in(ins_out_wire), .code_out(opc_decoder_out_wire));
	
	
	assign rd_wire = ins_out_wire[15:11];
	assign rs2_wire = ins_out_wire[20:16];
	//assign immediate_value_wire = 32'b0;
	assign immediate_value_wire = (32'h00000000 | ins_out_wire[15:0]);
	assign Imm_16bit_in_wire = ins_out_wire[15:0];
	assign RS2_value_wire = ins_out_wire[20:16];
	assign jump_imm_val_wire = ins_out_wire[25:0];
	
	D_FF_16bit Dff_16bit_ob (	.D(Imm_16bit_in_wire), .clk(clk), .Q(D_ff_16bit_out_wire) );
	D_ff_5 d_5_rs_value (.data_in(RS2_value_wire), .clk(clk), .data_out(RS2_value_delayed_wire));
	
	branch_ins_mod2 bra_mod2_ob (.Imm_in(D_ff_16bit_out_wire), .PC_in(D_ff_out_wire), 	.Add_out(bra_mod2_out_wire) );
	branch_ins_mod1 bra_mod1_ob (.opc_in(opc_decoder_out_wire), .RF_in(reg_dout1_wire), .RS_val(RS2_value_delayed_wire), .out_bit(out_bit_wire)	);
	
	D_ff_18 D_FF_bra_j_opcode (.data_in(opc_decoder_out_wire), .clk(clk), .data_out(d_ff_bra_j_opcode_out));
	
	D_ff_26bits Dff_26bits_ob (	.D(jump_imm_val_wire), 	.clk(clk), 	.Q(D_ff_26b_out_wire)	);
	JUMP_Mux Jump_Mux_out (.Pc_in(D_ff_Out2_wire),.Imm_in(D_ff_26b_out_wire), .jump_mux_sel(d_ff_bra_j_opcode_out), 	.jum_mux_out(jump_Mux_out_wire) );
	Bra_Jump_Adder Br_Jmp_Adder_Ob (	.Op_code_in(d_ff_bra_j_opcode_out),  .Address(jump_Mux_out_wire), 	.Out(Br_J_Out_Addr_wire)	);
	Branch_MUX bra_MUX_ob (	.in1_PC_plus_Imm(bra_mod2_out_wire), 	.in2_from_Jump_Mux(Br_J_Out_Addr_wire), .in_sel_bit(out_bit_wire), .Out(bra_MUX_out_wire)	);

	MUX_2by1_inout_5bit mux_rs2_rd (.input1(rd_wire),.input2(rs2_wire),.select(opc_decoder_out_wire),.out(mux_inout_5bit_wire) );

	D_ff_18 INT_1 (.data_in(opc_decoder_out_wire), .clk(clk), .data_out(D_ff_int1_out));//18-bit
	D_flip_flop INT_2 (.data_in(immediate_value_wire), .clk(clk), .data_out(D_ff_int2_out)); //32-bit
	D_ff_5 INT_3 (.data_in(mux_inout_5bit_wire), .clk(clk), .data_out(D_ff_int3_out));//5-bit
	
	D_ff_18 d_opcode (.data_in(D_ff_int1_out), .clk(clk), .data_out(opc_stage_2to3_wire));
	D_flip_flop d_rs1 (.data_in(reg_dout1_wire), .clk(clk), .data_out(D2_wire));
	D_flip_flop d_rs2 (.data_in(reg_out_2), .clk(clk), .data_out(D3_wire));
	D_flip_flop d_immediate (.data_in(D_ff_int2_out), .clk(clk), .data_out(mux_inout_32bit_imm_wire));
	D_ff_5 d_rd (.data_in(D_ff_int3_out), .clk(clk), .data_out(rd_stage3_wire));
	
	
	MUX_2by1_inout_32bit mux_rs2_imm (.input1(D3_wire),.input2(mux_inout_32bit_imm_wire),.select(opc_stage_2to3_wire),.out_32(ALU_input2_wire) );
	MUX_2by1_inout_32bit_LOAD_ADD_SUB mux_rs1_rs2 (.input1(D2_wire),.input2(D3_wire),.select(opc_stage_2to3_wire),.out_32(ALU_input1_wire));
	
	ALU alu_obj (.Op_in(opc_stage_2to3_wire), .input1(ALU_input1_wire), .input2(ALU_input2_wire), .out_32(ALU_wire));
	
	//D_ff_18 d_opcode_3 (.data_in(opc_stage_2to3_wire), .clk(clk), .data_out(opc_stage_3to4_wire));
	D_ff_opcode_stage4 d_opcode_3 (.D(opc_stage_2to3_wire), 	.Q(opc_stage_3to4_wire),.clk(clk) );
	D_flip_flop d_rs1_3 (.data_in(D2_wire), .clk(clk), .data_out(d2_stage4_wire));
	D_flip_flop d_alu_3 (.data_in(ALU_wire), .clk(clk), .data_out(data_mem_input_wire));
	D_ff_5 d_rd_3 (.data_in(rd_stage3_wire), .clk(clk), .data_out(rd_stage4_wire));
	
	assign WE_from_opc = opc_stage_3to4_wire[17];		// data_memory write is bit 17
	
	Data_Mem data_mem_obj (	.A_in(data_mem_input_wire), .D_in(d2_stage4_wire), .WE(WE_from_opc), .clk(clk), .D_out(data_mem_out_wire));
	
	
	D_ff_18 INT_1_S4(.data_in(opc_stage_3to4_wire), .clk(clk), .data_out(D_ff_int1_S4_out));
	D_flip_flop INT_2_S4 (.data_in(data_mem_input_wire), .clk(clk), .data_out(D_ff_int2_S4_out));
	D_ff_5 INT_3_S4(.data_in(rd_stage4_wire), .clk(clk), .data_out(D_ff_int3_S4_out));
	
	D_ff_18 d_opcode_4 (.data_in(D_ff_int1_S4_out), .clk(clk), .data_out(D_ff_opc_Reg_WE_stage4_wire));
	D_flip_flop d_mem_out_4 (.data_in(data_mem_out_wire), .clk(clk), .data_out(d2_wb_stage_wire));
	D_flip_flop d_alu_4 (.data_in(D_ff_int2_S4_out), .clk(clk), .data_out(d_alu_wb_stage));
	D_ff_5 d_rd_4 (.data_in(D_ff_int3_S4_out), .clk(clk), .data_out(ain3_rf_wire));
	
	assign WE_for_Reg_File = D_ff_opc_Reg_WE_stage4_wire[16]; //Register Memory
	
	MUX_2by1_inout32_final_load_add_sub final_mux(.input1(d2_wb_stage_wire),.input2(d_alu_wb_stage),.select(D_ff_opc_Reg_WE_stage4_wire),.out_32_bit(din_rf_wire) );

endmodule
