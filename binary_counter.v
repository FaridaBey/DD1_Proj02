`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/07/2023 03:06:26 PM
// Design Name: 
// Module Name: binary_counter
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


module binary_counter#(parameter x=3, n=6)(input clk, rst, en, output reg [x-1:0] count);

always @(posedge clk, posedge rst) begin

if (rst == 1) begin
    count <= 0;
end 
else if (en == 1) begin
    if (count == n-1) begin
        count <= 0;
    end else begin
        count <= count + 1;
    end
  end
  
end

endmodule
