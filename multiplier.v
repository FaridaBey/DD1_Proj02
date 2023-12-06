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
wire[7:0] Twosmultiplier;
TwothComp TC(.og_num(MC),.twoth_num(Twosmultiplier));
wire [7:0]TwosMux;
assign TwosMux= MC[7]?Twosmultiplier :  MC;
//reg [7:0]MultiplierReg;
//Combinational logic? Or Separate Module? Clock, load, and enable need to be handled.
reg [15:0]Shift_Left;
reg [7:0]Shift_Right;
wire[7:0] Twosmultiplier2;
TwothComp TC2(.og_num(MP),.twoth_num(Twosmultiplier2));
wire [7:0]TwosMux2;
assign TwosMux2= MP[7]?Twosmultiplier2 :  MP;

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
Shift_Right<=TwosMux;
Shift_Left<=  {8'd0,TwosMux2};
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
wire[16:0] TwosProduct;
TwothComp16bit TC3(.og_num(product),.twoth_num(TwosProduct));
wire [16:0]TwosMux3;
assign TwosMux3= MP[7]^MC[7]?TwosProduct :  product;
wire [19:0]BCDOut;
bin_to_BCD BCD(.bin(TwosMux3), .bcd_output(BCDOut));
wire[3:0] BBCD1=BCDOut[3:0];
wire[3:0] BBCD2=BCDOut[7:4];
wire[3:0] BBCD3=BCDOut[11:8];
wire[3:0] BBCD4=BCDOut[15:12];
wire[3:0] BBCD5=BCDOut[19:16];

endmodule
