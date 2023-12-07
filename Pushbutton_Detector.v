`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/21/2023 04:36:31 PM
// Design Name: 
// Module Name: Pushbutton_Detector
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


module Pushbutton_Detector(
input clk, reset, in,
output out
    );
  wire db_out;
  wire sync_out;
  wire clk_out;
clockDivider CD(.clk(clk),.rst(reset),.clk_out(clk_out));
debouncer DB(.clk(clk_out),.rst(reset),.in(in),.out(db_out));
synchronizer sync(.clk(clk_out), .SIG(db_out),.SIG1(sync_out));
rising_edge rd(.clk(clk_out),.reset(reset),.x(sync_out),.z(out));

endmodule
