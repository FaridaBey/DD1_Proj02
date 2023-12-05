`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/04/2023 04:11:39 PM
// Design Name: 
// Module Name: multiplier
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

module multiplier(
    //input  [7:0] multiplicand,
    input  [7:0] MP,
    input [7:0]MC,
    input clk, rst,
    input enable,
  
   input  Psel,
    //input LA,LB, EA,EB,EP,
    input load, 
   
    //output  sign,
    output  zero_flag, b0,
    output reg  [15:0] product
    
  //  output w
);
//wire[7:0] Twosmultiplier;
//TwothComp TC(.og_num(multiplier),.twoth_num(Twosmultiplier));
//wire [7:0]TwosMux;
//assign TwosMux= multiplier[7]?Twosmultiplier :  multiplier;
//assign w =1'b1;
//reg [7:0]MultiplierReg;
//Combinational logic? Or Separate Module? Clock, load, and enable need to be handled.
reg [15:0]Shift_Left;
reg [7:0]Shift_Right;


// ALU add(.A(Shift_Left ),.P(product ),.Result(product ));

always @ (rst) 
begin
Shift_Left =16'b0000000000000000;
Shift_Right =8'b00000000;
product=16'b0000000000000000;
end

always @(posedge clk ) begin

if(load)
begin
Shift_Right<=MC;
Shift_Left<=  {8'd0,MP};
end
else if(enable)
begin
Shift_Left <=Shift_Left <<1;
Shift_Right <=Shift_Right >>1;
if(Psel)
product <=product +Shift_Left; 
else
product <=product; 
end
end

assign zero_flag=!Shift_Right;    
assign b0=Shift_Right[0];



endmodule
