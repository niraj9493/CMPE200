`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:40:37 04/18/2018 
// Design Name: 
// Module Name:    ALU 
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
module ALU(
    input [19:0] Op_in,
    input [31:0] input1,
    input [31:0] input2,
    output reg [31:0] out_32
    );

reg [31:0] temp_calculation = 32'b0;
// ADDF registers
integer i, normalize_shift_count;
reg select;
reg[7:0] delta_exp, exp1, exp2;
reg[8:0] res_exp;
reg[23:0] frac1, frac2;
reg[24:0] frac_sum;
reg flag =1'b1;

// MULF registers
integer shift_count, norm_count;
reg[7:0] exp1_bias, exp2_bias;
reg[47:0] frac_mul;
reg[24:0] frac_mul_trunc;


always @ (*)
begin

	if(Op_in[0] == 1 || Op_in[2] == 1 || Op_in[3] == 1 || Op_in[9] || Op_in[12] || Op_in[13]) //ADD or LOAD or STORE or ADDI or MOVE or MOVEI
	begin
		out_32 <= (input1 + input2);
		$display("add/load/store entered in ALU%h",out_32);
	end
	
	else if(Op_in[1] == 1 || Op_in[10] || Op_in[11]) //SUB or SUBI or NOP
	begin
		$display("SUB entered in ALU");
		out_32 <= (input1 - input2);
	end
	
	else if (Op_in[4] == 1)	// SGE checking the sign bit
	begin
		temp_calculation = (input1 - input2);
		if(temp_calculation[31] == 1'b0)
		begin
			out_32 <= 32'b1;
		end
		else
		begin
			out_32 <= 32'b0;
		end
	end
	
	else if (Op_in[5] == 1) // SLE, checking the sign bit
	begin
		temp_calculation = (input1 - input2);
		if(temp_calculation[31] == 1'b1)
		begin
			out_32 <= 32'b1;
		end
		else
		begin
			out_32 <= 32'b0;
		end
	end
	
	else if(Op_in[6] == 1)	// SEQ
	begin
		temp_calculation = (input1 - input2);
		if(temp_calculation == 32'b0)
		begin
			out_32 <= 32'b1;
		end
		else
		begin
			out_32 <= 32'b0;
		end
	end
	
	else if(Op_in[7] == 1)	// SLI
	begin
		out_32 <= input1 << input2;
	end
	
	else if(Op_in[8] == 1)	// SRI
	begin
		out_32 <= input1 >> input2;
	end
	else if(Op_in[18] == 1)	// ADDF
	begin
		frac1[23] = 1;
      frac2[23] = 1;
      frac1[22:0] = input1[22:0];
      frac2[22:0] = input2[22:0];
		exp1 = input1[30:23];
      exp2 = input2[30:23];
      if (exp1 >= exp2) 
		begin
			delta_exp = exp1 - exp2;
         select = 0;
      end
      else 
		begin
			delta_exp = exp2 - exp1;
         select = 1;
      end
		if (select) 
		begin
			frac1 = frac1 >> delta_exp;
      end
      else 
		begin
			frac2 = frac2 >> delta_exp;
      end
      
		if (input1[31] && input2[31] == 0) //in1 > in2
		begin
			frac_sum = frac2 - frac1;
			out_32[31] <= input1 > input2 ? 1'b1 : 1'b0;
		end
      else if (input2[31] && input1[31] == 0)
		begin	
			frac_sum = frac1 - frac2;
			out_32[31] <= input2 > input1 ? 1'b1 : 1'b0;
		end
		else
		begin
			frac_sum = frac1 + frac2;
			out_32[31] <= 1'b0;
		end
      normalize_shift_count = 0;
      if (frac_sum[24] == 0 && frac_sum[23])
			normalize_shift_count = 0;
      else if (frac_sum[24]) 
		begin
			normalize_shift_count = 1;
         frac_sum = frac_sum >> normalize_shift_count;
      end
      else 
		begin
			for (i = 22; i >= 0 && flag; i = i - 1)
			begin
				if (frac_sum[i] == 1)
				begin
					normalize_shift_count = 22 - i + 1;
					flag = 1'b0;
				end
         end
            frac_sum = frac_sum << normalize_shift_count;
            normalize_shift_count = normalize_shift_count * -1;
      end
      res_exp = (normalize_shift_count) + (select ? exp2 : exp1);
      if (res_exp > 255 || res_exp < 0)
			$display("Exception for exponent greater than 255 or less than 0");
      else 
		begin
         out_32[30:23] <= res_exp[7:0];
         out_32[22:0] <= frac_sum;
		end
	end
	else if(Op_in[19] == 1)	//MULF
	begin
        frac1[23] = 1;
        frac2[23] = 1;
        frac1[22:0] = input1[22:0];
        frac2[22:0] = input2[22:0];
        exp1 = input1[30:23];
        exp1_bias = exp1 - 127;
        exp2 = input2[30:23];
        exp2_bias = exp2 - 127;
        res_exp = exp1_bias + exp2_bias;
        frac_mul = frac1 * frac2;
        frac_mul_trunc[24:0] = frac_mul[47:23]; //Truncate

        if (frac_mul_trunc[24] == 0 && frac_mul_trunc[23] == 0) 
		  begin
            for (i = 22; i >= 0  && flag; i = i - 1) 
				begin
                if (frac_mul_trunc[i] == 1) 
					 begin
                    shift_count = 22 - i + 2;
                    norm_count = i - 22;
						  flag = 1'b0;
                end
            end
            frac_mul_trunc = frac_mul_trunc << shift_count;
        end
        else if (frac_mul_trunc[24] == 0 && frac_mul_trunc[23] == 1) 
		  begin
            norm_count = 0;
            frac_mul_trunc = frac_mul_trunc << 1;
        end
        else 
		  begin
            norm_count = 1;
        end

        res_exp = res_exp + norm_count;
        res_exp = res_exp + 127;
        if (res_exp > 255 || res_exp < 0)
            $display("Exception for exponent greater than 255 or less than 0");
        else 
		  begin
            out_32[30:23] <= res_exp;
//            out_32[31] <= (input1[23] ^ input2[23]);
            out_32[31] <= (input1[31] ^ input2[31]);

            out_32[22:0] <= frac_mul_trunc[23:1];
        end
    end

end //end of always



endmodule
