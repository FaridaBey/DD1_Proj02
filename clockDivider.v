`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/21/2023 04:20:22 PM
// Design Name: 
// Module Name: clockDivider
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


module clockDivider #(parameter n = 250000)
(input clk, rst, output reg clk_out);
// 100M to 200 
// 100M/200 = 0.5M FULL CLOCK
// Half Clock = 0.5M /2 = 0.25M
wire [31:0] count;
BinaryCounter #(32,n) counterMod
(.clk(clk), .reset(rst),.enable(1'b1), .count(count));

always @ (posedge clk, posedge rst) begin
    if (rst) 
        clk_out <= 0;
    else if (count == n-1)
        clk_out <= ~ clk_out;
end
endmodule