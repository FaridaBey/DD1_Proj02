`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/07/2023 02:46:53 PM
// Design Name: 
// Module Name: CUTB
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


module CUTB();
reg clk;
reg BTNL;
reg BTNR;
reg BTNC;  
reg [7:0]MP;
reg [7:0]MC;
wire [6:0]SS;
wire [3:0]AA;
reg reset;
wire sign, zero_flag,b0;
wire [15:0]product;
wire load, sel1, sel2, done, CUrst,CUenable, Psel;
//reg b0,zero_flag;


multiplier MT(.MP(MP),.MC(MC),.clk(clk),.rst(reset),.enable(CUenable),.Psel(Psel),.load(load),.sign(sign),.zero_flag(zero_flag),.b0(b0),.product(product));
CU CONTU(.clk(clk) ,.BTNL(BTNL),.BTNR(BTNR),.sel_1(sel1),.sel_2(sel2),.BTNC(BTNC),.z_flag(zero_flag),.b0(b0),.done(done),.rst(CUrst),.load(load),.enable(CUenable),.Psel(Psel));
wire[19:0] BCDOut;
bin_to_BCD BCD(.bin(product), .bcd_output(BCDOut));
wire[1:0] count={sel2, sel1}; //COUNTER FOR BCD->7SEG MUXXING 
wire[3:0] BBCD1=BCDOut[3:0];
wire[3:0] BBCD2=BCDOut[7:4];
wire[3:0] BBCD3=BCDOut[11:8];
wire[3:0] BBCD4=BCDOut[15:12];
wire[3:0] BBCD5=BCDOut[19:16];
reg[3:0]BCDMUX1,BCDMUX2,BCDMUX3;
always @(count) begin
case(count)
0:begin BCDMUX1=BBCD1; BCDMUX2 =BBCD2; BCDMUX3 =BBCD3; end
1:begin BCDMUX1=BBCD2; BCDMUX2 =BBCD3; BCDMUX3 =BBCD4; end
2:begin BCDMUX1=BBCD3; BCDMUX2 =BBCD4; BCDMUX3 =BBCD5; end
3:begin BCDMUX1=BBCD3; BCDMUX2 =BBCD4; BCDMUX3 =BBCD5; end
default:begin BCDMUX1=BBCD1; BCDMUX2 =BBCD2; BCDMUX3 =BBCD3; end
endcase
end
wire[1:0] dissell;
 bin_counter #(2, 4) BC(. clk(clk), .reset(CUrst),. enable(done),.count(dissell));
 reg[3:0] BCDMUX4;
 always @(dissell) begin
case(dissell)
0: BCDMUX4 =BCDMUX1;
1: BCDMUX4=BCDMUX2 ;
2: BCDMUX4=BCDMUX3; 
3: BCDMUX4=BCDMUX3;
default:BCDMUX4 =BCDMUX1;
endcase
end
//BCD->7SEG COMB LOGIC
BCD_to_7seg BCD7SEG(.en(done),.count(dissell),.num(BCDMUX4),.sign(sign),.segments(SS),.anode_active(AA));
initial begin
 clk = 1;
 forever #25 clk=~clk;
end
initial begin
 
MP = 8'b00000001;
MC = 8'b00000001;
BTNL=0;
//b0=0;
//zero_flag=0;
BTNC=0;
BTNR=0;
reset=1;
#12000
MP = 3;
MC =90;
BTNL=0;
BTNC=0;
BTNR=0;
reset=0;

#12000
BTNL=0;
BTNC=1;
BTNR=0;
//b0=1;
//zero_flag=0;
#12000
BTNL=0;
BTNC=0;
BTNR=1;

#12000
BTNL=0;
BTNC=0;
BTNR=0;
//b0=0;
//zero_flag=1;
#12000
BTNL=0;
BTNC=0;
BTNR=1;

end
endmodule
