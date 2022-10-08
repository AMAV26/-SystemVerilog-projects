`timescale 1ns / 1ps

module MUX_v2#(parameter ancho = 4)(
input [ancho-1:0] D0,
input [ancho-1:0] D1,
input [ancho-1:0] D2,
input [ancho-1:0] D3,
input [1:0] sel,
output reg [ancho-1:0] Y
    );
    always@ (sel, D0,D1,D2,D3)
        case(sel)
                2'b00: Y[ancho-1:0] = D0;
                2'b01: Y[ancho-1:0] = D1;
                2'b10: Y[ancho-1:0] = D2;
                2'b11: Y[ancho-1:0] = 30;
        endcase
endmodule
