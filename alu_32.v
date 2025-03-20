`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.03.2025 21:13:55
// Design Name: 
// Module Name: alu_32
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


module alu_32(
  input [31:0] a,b,//inputs
  input [3:0]asel,
  output [31:0]alu_out,//output
  output reg cf,//carry flag
  output reg ov=1'b0,//overflow flag
  output zero//zero flag
);
  reg [31:0] ALU_R;
  reg [32:0] temp;//temp register to cal overflow
  reg [32:0] ts;
  wire signed [31:0] signed_a=$signed(a);
  wire signed [31:0] signed_b=$signed(b);  
  assign alu_out=ALU_R;
  assign zero=(ALU_R==0);
  always@(*)
    begin
      ov=1'b0;
      cf=1'b0;//rset
      
      case(asel)
        4'b0000:
          ALU_R=a&b;
        4'b0001:
          ALU_R=a|b;
        4'b0010:
          begin
            ALU_R=signed_a+signed_b;
            temp={1'b0,a}+{1'b0,b};
            cf=temp[32];
            if((a[31]&b[31]&~ALU_R[31])|(~a[31]&~b[31]&ALU_R))//for -ve and +ve overflow
              begin
                ov=1'b1;
              end
            else
              begin
                ov=1'b0;
              end
          end
        4'b0110:
          begin
            ALU_R=signed_a-signed_b;
            ts=~b+1'b1;
            if((a[31]&ts[31]&~ALU_R[31])|(~a[31]&~ts[31]&ALU_R[31]))
              begin
                ov=1'b1;
              end
            else
              begin
                ov=1'b0;
              end
          end
        4'b0111:
          ALU_R=(signed_a<signed_b)?32'd1:32'd0;
        4'b1100:
          ALU_R=~(a|b);
        4'b1111:
          ALU_R=(a==b)?32'd1:32'd0;
        default:
          ALU_R=a+b;
      endcase
    end
endmodule
          
                     
  
