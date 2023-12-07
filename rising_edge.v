`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/21/2023 03:36:34 PM
// Design Name: 
// Module Name: rising_edge
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


module rising_edge(
input clk,reset, x, 
output z);
reg [1:0] state, nextstate;
parameter [1:0] A=2'b00,B=2'b01,C=2'b10;

always @ * begin
    case(state)
    A: if(x==0)
    nextstate = A;
    else nextstate = B;
    B: if(x==0) nextstate = A;
    else nextstate = C;
    C: if(x==0) nextstate = A;
    else nextstate =C;
    default: nextstate=A;
    endcase
end 
always @ (posedge clk or posedge reset) begin
    if(reset) state <= A;
    else state <= nextstate;
end 

assign z = (reset == 0 && state == B);

endmodule
