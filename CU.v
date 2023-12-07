`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Module Name: CU
// Description: 
//////////////////////////////////////////////////////////////////////////////////



module CU(input clk,input BTNL, input BTNR, output sel_1,output sel_2,
input BTNC,z_flag, b0, output reg done, rst, load, enable, Psel);
  reg updown;
  reg en;
  always @ (posedge clk) begin
   if(BTNL || BTNR) begin
    if (BTNL) begin
      updown <= 1'b1;
      en <=1'b1;
    end
    else if (BTNR) begin
      updown <= 1'b0;
      en <=1'b1;
    end
  end
  else begin
  en<=0;
  end
  if(BTNC)begin
   load <= 1'b1;
   enable<= 1'b1;
   rst<=1'b1;
   end
   else begin
   rst<=1'b0;
   end
   if(z_flag)begin
   done <=  1'b1;
   enable<=0;
   //enable bcd??
   end
  if(b0)begin
  Psel <=  1'b1;
  
  end
  end
updown_counter #(2, 3) counter_inst(.clk(clk),.reset(BTNC), .enable(en), .UpDown(updown),.count({sel_2,sel_1}));
endmodule
