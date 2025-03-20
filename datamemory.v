`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.03.2025 18:21:38
// Design Name: 
// Module Name: datamemory
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


module datamemory(//store data 
  input memread,memwrite,//control signals
  input [8:0] addr,//address of the mem
  input [31:0]write_data,
  output [31:0] read_data
);
  reg [31:0] memory[127:0];//main memory
  wire [31:0] read_data;
  integer i;
  initial begin
    for(i=0;i<128;i=i+1)
      begin
        memory[i]=32'b0;
      end
  end
  
  always@(*)
    begin
      if(memwrite)
        memory[addr]<=write_data;
    end
  
  assign read_data=memread?memory[addr]:32'b0;
endmodule
