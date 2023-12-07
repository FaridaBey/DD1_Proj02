`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/04/2023 04:21:45 PM
// Design Name: 
// Module Name: pushbutton_detect
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


module pushbutton_detect(input clk, rst, in, output out);
wire w1, w2, clk_out;
//assign clk_out=clk;
clk_divider #(250_000) new_clk(.clk(clk),.rst(rst),.clk_out(clk_out));
debouncer debounce(.clk(clk_out), .rst(rst),.in(in),.out(w1));
synchronizer sync(.SIG(w1),.clk(clk_out),.SIG1(w2));
rising_egde_detect posedg(.clk(clk_out),.rst(rst),.x(w2),.z(out));

endmodule
