`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Module Name: CU
// Description: 
//////////////////////////////////////////////////////////////////////////////////



module CU(input clk, input rst,input en ,input BTNL, input BTNR, output sel_1,output sel_2,
input BTNC,z_flag, b0, output done, rst, load, enable, Psel);


  reg updown;
 
  always @ (posedge clk) begin
   if(BTNL || BTNR) begin
    if (BTNL) begin
      updown <= 1'b1;
    end
    else if (BTNR) begin
      updown <= 1'b0;
    end
  end
  if(BTNC)begin
   load <= 1'b1;
   enable<= 1'b1;
   end
   if(z_flag)begin
   done <=  1'b1;
   //enable bcd??
   end
  if(b0)begin
  Psel <=  1'b1;
  end
  end
updown_counter #(2, 3) counter_inst(.clk(clk),.reset(rst), .enable(en), .UpDown(updown),.count({sel_2,sel_1}));
endmodule
