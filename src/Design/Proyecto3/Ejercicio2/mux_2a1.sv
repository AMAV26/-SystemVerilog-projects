`timescale 1ns / 1ps

module Mux_2a1 
    #(
        parameter N = 1
    )
    (
        input logic [N-1:0] a_i,
        input logic [N-1:0] b_i,
        input logic sel_i,
        output logic [N-1:0] c_o
    );
    
    assign c_o=(sel_i)?a_i:b_i;
    
endmodule
