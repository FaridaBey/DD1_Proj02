`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/05/2023 08:13:29 PM
// Design Name: 
// Module Name: updown_counter
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


module updown_counter#(parameter x = 2, parameter n = 3)
(input clk, reset, enable, UpDown, output reg [x - 1:0] count);
initial begin count <=0; end 
always @(posedge clk or posedge reset) begin
if (reset) begin
count <= 0; 
end 
else if (enable) begin

    if (UpDown == 0) begin
        if (count == n - 1) begin
        count <= 0;
        end
        else begin
        count <= count + 1;
        end 
    end
    else begin
        if (count == 0) begin
        count <= n - 1;
        end 
        else begin
        count <= count - 1;
        end 
    end
end
end
endmodule
