`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/04/2023 03:57:46 PM
// Design Name: 
// Module Name: bin_counter
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


module bin_counter #(parameter x = 3, parameter n=8)
(input clk, reset, enable, output reg [x-1:0]count);

always @(posedge clk, posedge reset) begin
 if (reset) begin
    count <= 0; 
 end
  else if(enable) begin
 if(count == n-1)begin
     count <= 0;
    end
  else begin
    count <= count +1;
        end
    end
 end

endmodule

