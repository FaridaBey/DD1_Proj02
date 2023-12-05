`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/05/2023 07:15:50 PM
// Design Name: 
// Module Name: Multiplier_tb
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


module Multiplier_tb();
reg [7:0]MP;
reg [7:0]MC;
reg clk;
reg  rst;
reg enable;
//reg Psel;
reg load;
wire zero_flag;
wire b0;
wire [15:0] product;


 multiplier dut(.MP(MP),.MC(MC),.clk(clk),.rst(rst),.enable(enable),.load(load),.Psel(b0),.zero_flag(zero_flag),.b0(b0), .product(product));
 localparam period=100;
 initial begin 
 clk<=0;
 forever #10 clk<=~clk;
 end 
 initial begin 
 rst=1;
 MP = 8'b00000011;
 MC = 8'b00000011;
 load=1'b1;
 enable = 1'b1;
 #(period)
 rst=0;
 load = 1'b1;
 #(period)
 load = 1'b0;
 
 

 #(period);
 $finish;
 end 
 
endmodule
