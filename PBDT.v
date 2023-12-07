`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/27/2023 02:24:17 PM
// Design Name: 
// Module Name: PBDT
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


module PBDT();
reg x,clk,reset;
wire z;
 Push_Button_Detector PD(x,clk,reset,z);
 initial begin
 clk = 1;
 forever #0.001 clk=~clk;
end
initial begin
reset=1;
x=0;
#25
reset =0;
x=1;
#6000
x=0;
#25
x=1;
#600
x=0;
end
endmodule
