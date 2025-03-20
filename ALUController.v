`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.03.2025 17:29:37
// Design Name: 
// Module Name: ALUController
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

module ALUController(
     input [1:0]aluop,//opcode from controller
     input [6:0]funct7,
     input [2:0]funct3,
     output [3:0] opera//sepcy which operation
     );
     reg [3:0]opera;
     always@(*)
       begin
         case({funct3,aluop})
             5'b11110:opera=4'b0000;//AND operation (10 R)
             5'b11010:opera=4'b0001;//OR
             5'b10010:opera=4'b1100;//nor
             5'b01010:opera=4'b0111;//slt 
             5'b00010:  if(funct7==7'h00)
                             opera=4'b0010;//add
                        else if(funct7==7'h20)
                             opera=4'b0110;//sub
             5'b11100:opera=4'b0000;//andi('i' reg and iv)
             5'b11000:opera=4'b0001;//ori
             5'b10000:opera=4'b1100;//nori
             5'b01000:opera=4'b0111;//slti
             5'b00000:opera=4'b0010;//addi
             5'b01001:opera=4'b0010;//lw or sw(mem acces(LDA and STA))
             default:
                  opera=4'b0000;
         endcase
       end
             
endmodule
