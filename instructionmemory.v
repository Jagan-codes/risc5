`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.03.2025 23:00:27
// Design Name: 
// Module Name: instructionmemory
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


module instructionmemory(
  input [7:0]addr,
  output wire [31:0]instruction
);
  reg [31:0] mem[63:0];
  initial begin
    mem[0]=32'h0000_7033;//and ro,ro,ro
    mem[1]=32'h0030_0093;//addi r1,r0,1
    mem[2]=32'h0020_0113;//addi r2,r0,2
    mem[3]=32'h0030_8193;//addi r3,r1,3
    mem[4]=32'h0040_8213;//addi r4,r1,4
    mem[5]=32'h0051_0293;//addi r5,r2,5
    mem[6]=32'h0061_0313;//addi r6,r2,6
    mem[7]=32'h0071_8393;//addi r7,r3,7
    mem[8]=32'h0021_8433;//add r8,r1,r2
    mem[9]=32'h4044_04b3;//sub r9,r8,r4
    mem[10]=32'h0031_7533;//and r10,r2,r3
    mem[11]=32'h0041_e5b3;//or r11,r3,r4
    mem[12]=32'h0041_a633;//if r3 is less than r4 then r12 = 1 32'h00000001
    mem[13]=32'h0073_46b3;//nor r13,r6,r7
    mem[14]=32'h4d34_f713;//andi r14,r9,"4D3"
    mem[15]=32'h8d35_e793;//ori r15,r11,"8D3"
    mem[16]=32'h4d26_a813;// if r13 is less than 32'h000004D2 then r16 = 1 32'h00000001 
    mem[17]=32'h4d24_4893;//nori r17,r9,"4D2"
    mem[18]=32'h02b0_2823;//sw r11,48(r0)
    mem[19]=32'h0300_2603;//lw r12,48(r0)
    //mem[20] = 32'h0050_0093; // ADDI r1, r0, 5
   // mem[21] = 32'h0030_0113; // ADDI r2, r0, 3
    //mem[22] = 32'h0020_8193; // ADD r3, r1, r2

    end
    assign instruction=mem[addr[7:2]];
endmodule
