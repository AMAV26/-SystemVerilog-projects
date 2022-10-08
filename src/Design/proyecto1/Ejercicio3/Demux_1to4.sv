`timescale 1ns / 1ps


module Demux_1to4#(parameter ancho = 4)(
output reg [ancho-1:0] E0,
output reg [ancho-1:0] E1,
output reg [ancho-1:0] E2,
output reg [ancho-1:0] E3,
input logic [1:0]sel,
input logic[ancho-1:0] X
    );
    always @(E0 or E1 or E2 or E3 or sel) begin
    case (sel)
        2'b00:  E0 <= X;
        2'b01:  E1 <= X;
        2'b10:  E2 <= X;
        2'b11:  E3 <= X;
    endcase
end
endmodule
