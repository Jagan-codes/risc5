Datapath.v`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.03.2025 20:57:16
// Design Name: 
// Module Name: datapath
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module Datapath#(
  parameter PC_W=8,//pc
  parameter INS_W=32,//instruction width
  parameter RG_ADDR=5,//reg file address
  parameter DATA_W=32,//data write data
  parameter DM_ADDR=9,//data mem addr
  parameter ALU_C_W=4)//ALU CONTROL CODE WIDTH)
  (
  input clk,rst,reg_write,memtoreg,alu_src,mem_write,
  input mem_read,
  input [ALU_C_W-1:0]alu_c,//ALUCC in datapath
  output [6:0] opcode,//opcode in datapath
  output [6:0]funct7,//datapath module
  output [2:0]funct3,//datapath module
  output [DATA_W-1:0] alu_result
);
  wire cf,zf,ov;
  wire [PC_W-1:0]n_pc_count,pc_count;
  wire [INS_W-1:0]ins_code,wrt_data,alu_in1,alu_in2,rg_data,imm_value,mem_data;
  flipflop f1(.clk(clk),.rst(rst),.d(n_pc_count),.q(pc_count));
  //inc pc counter
  assign n_pc_count=pc_count+8'h4;
  //instruction memory
  instructionmemory inm1(.addr(pc_count),.instruction(ins_code));
  
  registerfile rg1(.clk(clk),
                  .rst(rst),
                  .rg_wrt_en(reg_write),
                  .rg_rd_ad1(ins_code[19:19-RG_ADDR+1]),
                  .rg_rd_ad2(ins_code[24:24-RG_ADDR+1]),
                  .rg_wrt_add(ins_code[11:11-RG_ADDR+1]),
                  .rg_wrt_data(wrt_data),
                  .rg_rd_data1(alu_in1),
                  .rg_rd_data2(rg_data));
  //mux decide data fromreg or immediate value(based on slusrc
  mux2_1 m1(.d1(rg_data),
            .d2(imm_value),
            .sel(alu_src),
            .y(alu_in2));
  //generate immediate value
  Immediategen im1(.inscode(ins_code),
               .Immout(imm_value));
  //risc v alu operation
  alu_32 a1(.a(alu_in1),
            .b(alu_in2),
             .asel(alu_c),
            .alu_out(alu_result),
            .cf(cf),
            .ov(ov),
            .zero(zf));
  
  //data memory
  datamemory d1(.memread(mem_read),
                .memwrite(mem_write),
                .addr(alu_result[DM_ADDR-1:0]),
                .write_data(rg_data),
                .read_data(mem_data));
  
  //mux which decide dta from emem or alu to the reg file
  
  mux2_1 m2(.d1(alu_result),
             .d2(mem_data),
             .sel(memtoreg),
             .y(wrt_data));
  //assign output to datapath
  assign opcode=ins_code[6:0];
  assign funct7=ins_code[31:25];
  assign funct3=ins_code[14:12];
endmodule
