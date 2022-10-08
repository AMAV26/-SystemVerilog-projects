`timescale 1ns / 1ps
module D_FF(
input logic clk, rst,
input logic en,
input logic d,
output logic q
    );
    
 always@ (posedge clk, posedge rst)
    if (rst)
        q <= 1'b0;
    else if (en)
        q <= d;
endmodule
