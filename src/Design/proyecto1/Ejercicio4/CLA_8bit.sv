`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.08.2022 18:05:24
// Design Name: 
// Module Name: CLA_8bit
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


module CLA_8bit(
    input [7:0] a,
    input [7:0] b,
    input cin,
    output [7:0] s,
    output cout
    );
    logic c1;
    CLA_4bit cla1(.a(a[3:0]), .b(b[3:0]), .cin(cin), .s(s[3:0]), .cout(c1));
    CLA_4bit cla2(.a(a[7:4]), .b(b[7:4]), .cin(c1), .s(s[7:4]), .cout(cout));

endmodule