`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/04/2023 04:11:39 PM
// Design Name: 
// Module Name: bin_to_BCD
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


//module bin_to_BCD (input[15:0] bin, output[19:0] bcd_output);


//  integer i,j;
//  reg [20:0] BCD;

//  always @(bin) begin
//      BCD = 21'b0000000000000000000000;
//      BCD[15:0] = bin;
//      for(i = 0; i <= 12; i = i+1)
//        for(j = 0; j <= i/3; j = j+1)
//          if (BCD[16-i+4*j -: 4] > 4)
//            BCD[16-i+4*j -: 4] = BCD[16-i+4*j -: 4] + 4'd3; 
//  end
  
//  assign bcd_output= BCD[19:0]; 


//endmodule
module bin_to_BCD (
    input [15:0] bin,
    output reg [19:0] bcd_output
);

  integer i, j;
  reg [20:0] BCD;

  always @* begin
    BCD = 21'b000_0000_0000_0000_0000_0000;
    BCD[15:0] = bin;

    for (i = 0; i <= 12; i = i + 1)
      for (j = 0; j <= i / 3; j = j + 1)
        if (BCD[16 - i + 4 * j -: 4] > 4)
          BCD[16 - i + 4 * j -: 4] = BCD[16 - i + 4 * j -: 4] + 4'd3;
  end

  always @* begin
    bcd_output = BCD[19:0];
  end

endmodule
