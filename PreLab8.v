`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/20/2023 10:07:25 PM
// Design Name: 
// Module Name: PreLab8
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


module synchronizer(
input SIG,
input clk,
output SIG1
    );
reg META; 
DFF DFF1(.clk(clk), .D(SIG), .Q(META));
DFF DFF2(.clk(clk), .D(META), .Q(SIG1));
endmodule
