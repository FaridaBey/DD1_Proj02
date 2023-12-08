`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Module Name: CU
// Description: 
//////////////////////////////////////////////////////////////////////////////////



module CU(input clk,input BTNL, input BTNR,
input BTNC, output sel_1,output sel_2, output reg load);
  
  reg updown;
  reg en;
 // reg rst;
  always @ (posedge clk) begin
  
  load <= BTNC;
 
  end
 always @(posedge clk ) begin
 if (BTNL) begin
 updown = 1'b1;
 en <= 1'b1;
 end
 else if (BTNR) begin
 updown = 1'b0;
 en <= 1'b1;
 end
 else begin
 en <= 1'b0;
 updown = 1'b1;
 end
 end
 updown_counter #(2, 3) counter_inst(.clk(en),.reset(1'b0), .enable(en), .UpDown(updown),.count({sel_2,sel_1}));
endmodule