`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/07/2023 01:16:13 PM
// Design Name: 
// Module Name: Top_module
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
module Top_module(input clk, input BTNC, input BTNL, input BTNR, input [7:0] MP,input [7:0] MC, output  done, output [6:0] segments, output [3:0]anode_active );
wire bright;
wire bleft;
wire bcenter;

pushbutton_detect center_pb ( .clk(clk), .in(BTNC), .out(bcenter));
pushbutton_detect right_pb ( .clk(clk), .in(BTNR), .out(bright));
pushbutton_detect left_pb ( .clk(clk), .in(BTNL), .out(bleft));


wire load_int;
wire [15:0] product;
wire zflag; 
wire sign;

multiplier multiply ( .MP(MP) ,.MC(MC),.clk(clk),.load(load_int), .sign(sign), .zero_flag(zflag), .done(done), .product(product)); // sign tbu 7seg 

wire s1;
wire s2;

CU control( .clk(clk), .BTNL(bleft),  .BTNR(bright),  .BTNC(bcenter), .sel_1(s1), .sel_2(s2), .load(load_int)); // sle_1/2 tbu mux after bcd
//CU control( .clk(clk), .BTNL(BTNL),  .BTNR(BTNR),  .BTNC(BTNC), .sel_1(s1), .sel_2(s2), .load(load_int)); // sle_1/2 tbu mux after bcd

wire [19:0] BCD_product;

bin_to_BCD BCD (.bin(product), .bcd_output(BCD_product));  
 // MUXs after bcd
reg [3:0] digit_1;
reg [3:0] digit_2;
reg [3:0] digit_3;
always @ (*) begin
case ({s2,s1})
0: begin  
digit_1 = BCD_product [3:0];
digit_2 = BCD_product [7:4];
digit_3 = BCD_product [11:8];
end
1: begin
digit_1 = BCD_product [7:4];
digit_2 = BCD_product [11:8];
digit_3 = BCD_product [15:12];
end 
2: begin
digit_1 = BCD_product [11:8];
digit_2 = BCD_product [15:12];
digit_3 = BCD_product [19:16];
end 
default: begin
digit_1 = BCD_product [3:0];
digit_2 = BCD_product [7:4];
digit_3 = BCD_product [11:8];
end
endcase
end

wire const_zero;
assign const_zero = 1'b0;

wire clk_out;

clk_divider #(250_000) clk_inst( .clk(clk), .rst(const_zero),.clk_out(clk_out));

wire const_one;
assign const_one = 1'b1; 

wire [1:0]dis_sel;
bin_counter #( 2, 3) count_dis (.clk(clk_out), .reset(const_zero), .enable(const_one), .count(dis_sel));
//bin_counter #( 2, 3) count_dis (.clk(clk), .reset(const_zero), .enable(const_one), .count(dis_sel));
reg [3:0] num;
always @ (*) begin
case (dis_sel)
0: num = digit_1 ;
1: num = digit_2;
2: num = digit_3;
default: num = 4'b0;
endcase
end
wire [1:0]count;
bin_counter #( 2, 4) counter (.clk(clk_out), .reset(const_zero), .enable(const_one), .count(count));
//bin_counter #( 2, 4) counter (.clk(clk), .reset(const_zero), .enable(const_one), .count(count));
BCD_to_7seg segment(.en(const_one), .count(count), .num(num), .sign(sign), .segments(segments),.anode_active(anode_active)); 


endmodule 