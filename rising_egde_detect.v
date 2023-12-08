`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/04/2023 04:11:39 PM
// Design Name: 
// Module Name: rising_egde_detect
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


module rising_egde_detect(input clk, rst, x, output z );
reg [1:0] state;
reg [1:0] next_state;
localparam  [1:0] A=2'b00,B=2'b01,C=2'b10;
always @ (*) begin
case (state)
A:if(x==0) 
next_state = A;
else 
next_state = B;
B:if(x==0) 
next_state = A;
else 
next_state = C;
C:if(x==0) 
next_state = A;
else 
next_state = C;
default: next_state = A;
endcase
end 
always @(posedge clk or posedge rst) begin 
if(rst)
state <= A;
else 
state <=next_state ;
end
assign z = (state == B);

endmodule

