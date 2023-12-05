`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/04/2023 04:11:39 PM
// Design Name: 
// Module Name: multiplier
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

module multiplier(
    //input  [7:0] multiplicand,
    input  [7:0] multiplier,
    //input clk, rst,
    //input LA,LB, EA,EB,EP, Psel,
    //output reg  [15:0] product,
    //output  sign,
    //output  zero_flag, b0 
    output w
);
wire[7:0] Twosmultiplier;
TwothComp TC(.og_num(multiplier),.twoth_num(Twosmultiplier));
wire [7:0]TwosMux;
assign TwosMux= multiplier[7]?Twosmultiplier :  multiplier;
assign w =1'b1;
reg [7:0]MultiplierReg;
//Combinational logic? Or Separate Module? Clock, load, and enable need to be handled.



endmodule
