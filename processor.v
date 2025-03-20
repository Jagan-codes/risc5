`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.03.2025 15:02:33
// Design Name: 
// Module Name: processor
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

module processor(
  input clk,rst,
  output [31:0] res
);
  wire reg_write,memtoreg,alu_src,mem_write,mem_read;
  wire[3:0] alu_cc;
  wire [6:0] opcode,funct7;
  wire[2:0] funct3;
  wire[1:0] alu_op;
  
  //datapath
  Datapath dp1(.clk(clk),.rst(rst),.reg_write(reg_write),.memtoreg(memtoreg),.alu_src(alu_src),.mem_write(mem_write),.mem_read(mem_read),.alu_c(alu_cc),.opcode(opcode),.funct7(funct7),.funct3(funct3),.alu_result(res));
  
  //controller
  controller c1(.opcode(opcode),.mtor(memtoreg),.mw(mem_write),.mr(mem_read),.ALUs(alu_src),.rw(reg_write),.ALUOP(alu_op));
  
  //controller
  
  ALUController ac1(.aluop(alu_op),.funct7(funct7),.funct3(funct3),.opera(alu_cc));
endmodule


