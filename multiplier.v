//`timescale 1ns / 1ps
////////////////////////////////////////////////////////////////////////////////////
//// Create Date: 12/04/2023 04:11:39 PM
//// Module Name: multiplier
//// Description: 
////////////////////////////////////////////////////////////////////////////////////



module multiplier(
    input  [7:0] MP,
    input [7:0]MC,
    input clk,
    input load, 
    output  sign,
    output   zero_flag,
    output   done,
    output reg  [15:0] product
    );
// 2's complement 
wire [7:0] MP_middle;
wire [7:0] MC_middle;
assign MP_middle = (MP[7] == 1'b1)? ~MP+1: MP;
assign MC_middle = (MC[7] == 1'b1)? ~MC+1:MC;
// end 2's comp


reg [15:0]Shift_Left;
reg [7:0]Shift_Right;
initial 
begin
Shift_Left =16'b0;
Shift_Right =8'b1;
product=16'b0;
end

always @(posedge clk ) begin
if(load)
begin
Shift_Left <={8'd0,MC_middle};
Shift_Right<=MP_middle;
end

else if(~zero_flag)
begin
Shift_Left <=Shift_Left <<1;
Shift_Right <=Shift_Right >>1;
if(b0) begin
product <=product +Shift_Left; 
end
else begin
product <=product; 
end
end

end
assign zero_flag=!Shift_Right;   
assign b0=Shift_Right[0];
assign sign = MC[7]^MP[7];
assign done = zero_flag ;

endmodule
