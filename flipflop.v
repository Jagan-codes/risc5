`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.03.2025 20:13:54
// Design Name: 
// Module Name: flipflop
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


module flipflop(
  input clk,rst,
  input [7:0]d,
  output reg[7:0]q
);
  //reg [7:0]q;
  always@(posedge clk)
    begin
      if(rst)
        q<=0;
      else
        q<=d;
    end
endmodule
    
  
