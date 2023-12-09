`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Module Name: CU
// Description: 
//////////////////////////////////////////////////////////////////////////////////



module CU(input clk,input BTNL, input BTNR,
input BTNC, output sel_1,output sel_2, output reg load);
wire clk_out;
clk_divider #(50_000) clkdiv(.clk(clk), .rst(1'b0), .clk_out(clk_out));
reg [1:0]counter;
initial begin counter = 2'b00; end
  
  reg updown;
  reg en;
 // reg rst;
  always @ (posedge clk_out) begin
  
  load <= BTNC;
  end
 always @(posedge clk_out ) begin
 if (BTNL & ~BTNR) begin
 if (counter<2)
 counter = counter + 1;
 end
 else if (BTNR & ~BTNL) begin
 if(counter>0)
 counter=counter-1;
 end
else
begin
counter <=counter;
end
 end
 assign {sel_1,sel_2}=counter;
 //updown_counter #(2, 3) counter_inst(.clk(en),.reset(BTNC), .enable(en), .UpDown(updown),.count({sel_2,sel_1}));
endmodule