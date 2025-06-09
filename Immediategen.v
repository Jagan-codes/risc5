`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.03.2025 19:06:16
// Design Name: 
// Module Name: Immediategen
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


module Immediategen(
  input [31:0] inscode,//32-bit riscv instruction input
  output  [31:0] Immout//32-bit immediate value
);
 reg [31:0] Immout;
  always@(inscode)
    begin
      case(inscode[6:0])//opcode 
        7'b0000011:Immout={inscode[31]?{20{1'b1}}:20'b0,inscode[31:20]};//msb set na 20 bit set(I type)
        7'b0010011:Immout={inscode[31]?{20{1'b1}}:20'b0,inscode[31:20]};//(I type) in instruction code immediate value located at [31:20] (12 bits) extraction from instruction
        7'b0100011:Immout={inscode[31]?{20{1'b1}}:20'b0,inscode[31:25],inscode[11:7]};//s type
        7'b0010111:Immout={inscode[31:12],12'b0};//u type
        default:
          Immout=32'b0;
      endcase
    end
endmodule
        
                                                                               
                                                                
                                                                
                                                                
