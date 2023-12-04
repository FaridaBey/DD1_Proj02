`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/07/2023 04:21:50 PM
// Design Name: 
// Module Name: clock_divider
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

module clock_divider#(parameter n=50000000)(input clk, rst, output reg clk_out);

wire [31:0] count;
binary_counter #(32,n) C1(.clk(clk),.rst(rst),.en(1'b1),.count(count));
// Handle the output clock

always @ (posedge clk, posedge rst) begin
    if (rst) // Asynchronous Reset
        clk_out <= 0;
    else if (count == n-1)
        clk_out <= ~ clk_out;
end

endmodule
