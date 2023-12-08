`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Create Date: 12/04/2023 04:11:39 PM
// Module Name: BCD_to_7seg
// Module Description : It taks the BCD values, and the sign of the result and outputs it on the 7 seg 
//////////////////////////////////////////////////////////////////////////////////

module BCD_to_7seg(
input en, input [1:0]count,
input [3:0] num, input sign,
output reg [6:0] segments,
output reg [3:0] anode_active);

always @ (*) begin
//2x4 dec begin
    if(en) begin
    case(count)
    0: anode_active = 4'b1110;
    1: anode_active = 4'b1101;
    2: anode_active = 4'b1011;
    3: if(sign) anode_active = 4'b0111;
    else
    anode_active = 4'b1111;
    endcase
    end 
    else begin
        anode_active = 4'b1111;
    end
// end
if (count < 3)
begin 
 case(num)
0: segments =7'b0000001;
1: segments =7'b1001111;
2: segments =7'b0010010;
3: segments =7'b0000110;
4: segments =7'b1001100;
5: segments =7'b0100100;
6: segments =7'b0100000;
7: segments =7'b0001111;
8: segments =7'b0000000;
9: segments =7'b0000100;
default: segments = 7'd0;
endcase
end
else
begin
case (sign)
0: segments =7'b1111111; //pos
1: segments =7'b1111110; // neg 
default: segments = 7'd0;
endcase
end
end
endmodule

