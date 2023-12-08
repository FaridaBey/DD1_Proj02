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


module pushbutton_detect(input clk, in, output out);
wire w1, w2, clk_out, const_zero;
assign const_zero = 1'b0;
clk_divider #(.n(250_000)) new_clk(.clk(clk),.rst(const_zero),.clk_out(clk_out));
debouncer debounce(.clk(clk_out), .rst(const_zero),.in(in),.out(w1));
synchronizer sync(.SIG(w1),.clk(clk_out),.SIG1(w2));
rising_egde_detect posedg(.clk(clk_out),.rst(const_zero),.x(w2),.z(out));

endmodule
