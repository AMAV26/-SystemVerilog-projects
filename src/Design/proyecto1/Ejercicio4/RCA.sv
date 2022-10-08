`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.08.2022 18:07:09
// Design Name: 
// Module Name: RCA
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


module RCA #(parameter ANCHO = 8)(
    input logic [ANCHO-1:0] a2,
    input logic [ANCHO-1:0] b2,
    input logic cin2,
    input logic [ANCHO-1:0] s2,
    output logic cout2
    
    );

    
    wire [ANCHO:0] carry;
    wire [ANCHO-1:0] resultado;
    
    assign carry[0] = cin2;
    
    
    generate
        genvar  i;
            for (i = 0; i < ANCHO; i = i+1) begin
                Full_Adder FA (.a1(a2[i]), .b1(b2[i]), .cin1(carry[i]), .s1(resultado[i]), .cout1(carry[i+1]));
            end
    endgenerate
    
    assign s2 = resultado;
    assign cout2 = carry[ANCHO];
    
    
endmodule