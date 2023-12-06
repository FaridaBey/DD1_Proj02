`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/06/2023 02:40:17 PM
// Design Name: 
// Module Name: Bin2BCDtb
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


module Bin2BCDtb();
reg[15:0] product;
wire[19:0] BCDOut;
wire[16:0] TwosProduct;
TwothComp16bit TC3(.og_num(product),.twoth_num(TwosProduct));
bin_to_BCD BCD(.bin(TwosProduct), .bcd_output(BCDOut));
wire[3:0] BBCD1=BCDOut[3:0];
wire[3:0] BBCD2=BCDOut[7:4];
wire[3:0] BBCD3=BCDOut[11:8];
wire[3:0] BBCD4=BCDOut[15:12];
wire[3:0] BBCD5=BCDOut[19:16];

initial begin
product =15625;
#100
product =-15625;

#100
product =15625;
end
endmodule
