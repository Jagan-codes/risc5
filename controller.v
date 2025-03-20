`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.03.2025 18:33:25
// Design Name: 
// Module Name: controller
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


module controller(
  input [6:0]opcode,
  output reg mtor,//mem to reg
  output reg mw,// mem write
  output reg mr,//mwm read
  output reg ALUs,//second operand(1 operand is rs1)
  output reg rw,//reg write
  output reg[1:0]ALUOP
);
  always@(*)
    begin
      case(opcode)
        7'b0000011://load 
          begin
            mtor=1'b1;
            mw=1'b0;
            mr=1'b1;
            ALUs=1'b1;
            rw=1'b1;
            ALUOP=2'b01;
          end
        7'b0100011://store
          begin
            mtor=1'b0;
            mw=1'b1;
            mr=1'b0;
            ALUs=1'b1;
            rw=1'b0;
            ALUOP=2'b01;
          end
        7'b0010011://I type(immediate)
          begin
            mtor=1'b0;
            mw=1'b0;
            mr=1'b0;
            ALUs=1'b1;
            rw=1'b1;
            ALUOP=2'b00;
          end
        7'b0110011://R type(reg)
          begin
            mtor=1'b0;
            mw=1'b0;
            mr=1'b0;
            ALUs=1'b0;
            rw=1'b1;
            ALUOP=2'b10;
          end
        default:
          begin
            mtor=1'b0;
            mw=1'b0;
            mr=1'b0;
            ALUs=1'b0;
            rw=1'b0;
            ALUOP=2'b00;
          end
      endcase
    end
endmodule
            
            
            
            
  
