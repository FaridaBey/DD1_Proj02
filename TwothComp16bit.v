`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/05/2023 02:34:42 PM
// Design Name: 
// Module Name: TwothComp
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


module TwothComp16bit(input [15:0]og_num,output[15:0]twoth_num);
assign twoth_num = (~og_num)+1;
endmodule
