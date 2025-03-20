`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.03.2025 20:06:15
// Design Name: 
// Module Name: registerfile
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


module registerfile(
  input clk,
  input rst,
  input rg_wrt_en,//write enable
  input[4:0] rg_rd_ad1,rg_rd_ad2,rg_wrt_add,//reg read address 1,2,and write addrwss
  input [31:0] rg_wrt_data,//write data into reg
  output [31:0] rg_rd_data1,rg_rd_data2//reg read data
);
  reg [31:0] reg31[31:0];//32 bit reg(32)
  integer i;
  always@(posedge clk,posedge rst)
    begin
      if(rst)
        begin
          for(i=0;i<32;i=i+1)
            begin
              reg31[i]=32'b0;
            end
        end
      else
        if(rg_wrt_en)
          begin
            reg31[rg_wrt_add]<=rg_wrt_data;
          end
    end
  assign rg_rd_data1=reg31[rg_rd_ad1];
  assign rg_rd_data2=reg31[rg_rd_ad2];
endmodule
    
      

  
