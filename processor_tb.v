`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.03.2025 15:06:38
// Design Name: 
// Module Name: processor_tb
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


module proceesor_tb;
  reg clk;
  reg rst;
  wire [31:0] res_tb;
  processor DUT(.clk(clk),.rst(rst),.res(res_tb));
  always begin
    #10 clk=~clk;
  end
  initial begin
    clk=0;
    rst=1;
    #20;
    rst=0;
    
  end
  
  integer point=0;//to verify number of opeartions
  
   
   initial begin
      #20;
      if(res_tb==32'd0)//and
        begin
          point=point+1;
          $display("%s%d","The number of correct test case is:",point);
        end
      #25;
      if(res_tb==32'd3)//addi
        begin
          point=point+1;
          $display("%s%d","The number of correct test case is:",point);
        end
      #25;
      if(res_tb==32'd2)
        begin
          point=point+1;
          $display("%s%d","The number of correct test case is:",point);
        end
      #25;
      if(res_tb==32'd6)
        begin
          point=point+1;
          $display("%s%d","The number of correct test case is:",point);
        end
      #25;
      if(res_tb==32'd7)
        begin
          point=point+1;
           $display("%s%d","The number of correct test case is:",point);
        end
      #25;
      if(res_tb==32'd8)
        begin
          point=point+1;
          $display("%s%d","The number of correct test case is:",point); $display("%s%s","The number of correct test case is:",point);
        end
      #20;
      if(res_tb==32'd13)
        begin
          point=point+1;
          $display("%s%d","The number of correct test case is:",point);
        end
      #20;
      if(res_tb==32'd8)
        begin
          point=point+1;
         $display("%s%d","The number of correct test case is:",point);
        end
        
      #20;
      if(res_tb==32'd0)
        begin
          point=point+1;
          $display("%s%d","The number of correct test case is:",point);
        end
      #20;
      if(res_tb==32'd2)
        begin
          point=point+1;
          $display("%s%d","The number of correct test case is:",point);
        end
      #20;
      if(res_tb==32'd7)
        begin
          point=point+1;
           $display("%s%d","The number of correct test case is:",point);
        end
      #20;
      if(res_tb==32'd1)
        begin
          point=point+1;
         $display("%s%d","The number of correct test case is:",point);
        end
      #20;
      if(res_tb==32'hfffffff2)
        begin
          point=point+1;
          $display("%s%d","The number of correct test case is:",point);
        end
      #20;
      if(res_tb==32'd1)
        begin
          point=point+1;
           $display("%s%d","The number of correct test case is:",point);
        end
      #20;
      if(res_tb==32'hfffff8d7)
        begin
          point=point+1;
          $display("%s%s","The number of correct test case is:",point);
        end
      #20;
      if(res_tb==32'd1)
        begin
          point=point+1;
           $display("%s%d","The number of correct test case is:",point);
        end
      #20;
      if(res_tb==32'hfffffb25)
        begin
          point=point+1;
           $display("%s%d","The number of correct test case is:",point);
        end
      #20;
      if(res_tb==32'h00000030)
        begin
          point=point+1;
          $display("%s%d","The number of correct test case is:",point);
        end
      #20;
     
    end
  initial begin
    #550;
    $finish;
  end
endmodule

  