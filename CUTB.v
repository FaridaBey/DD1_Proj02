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
reg clk,BTNL,BTNR,BTNC,zflag, b0;   
wire sel1,sel2,enable,load,Psel,reset1,done;
reg PDreset;

wire BTNCD, BTNLD, BTNRD;
Push_Button_Detector PD1(.x(BTNC),.clk(clk),.reset(PDreset),.z(BTNCD));
Push_Button_Detector PD2(.x(BTNR),.clk(clk),.reset(PDreset),.z(BTNLD));
Push_Button_Detector PD3(.x(BTNL),.clk(clk),.reset(PDreset),.z(BTNRD));
wire [1:0]sel={sel1 ,sel2};
CU CONTU(.clk(clk),.BTNL(BTNLD),.BTNR(BTNRD),.sel_1(sel1),.sel_2(sel2),.BTNC(BTNCD),.z_flag(zflag),.b0(b0),.done(done),.rst(reset1),.load(load),.enable(enable),.Psel(Psel));
initial begin
 clk = 1;
 forever #25 clk=~clk;
end
initial begin
PDreset=1;
BTNL=0;
BTNC=0;
BTNR=0;
zflag=0;
b0=0;
#1000
PDreset=0;
BTNL=0;
BTNC=0;
BTNR=0;
zflag=0;
b0=0;
#1000
BTNL=0;
BTNC=1;
BTNR=0;
zflag=0;
b0=0;
#1000
BTNL=0;
BTNC=0;
BTNR=1;
zflag=0;
b0=0;
#1000
BTNL=0;
BTNC=0;
BTNR=0;
zflag=1;
b0=1;
#1000
BTNL=0;
BTNC=0;
BTNR=1;
zflag=0;
b0=0;
end
endmodule
