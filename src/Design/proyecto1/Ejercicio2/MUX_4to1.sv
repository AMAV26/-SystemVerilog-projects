`timescale 1ns / 1ps


module MUX_4to1 #(parameter ancho = 4)
(
input logic [ancho-1:0] D0,
input logic [ancho-1:0] D1,
input logic [ancho-1:0] D2,
input logic [ancho-1:0] D3,
input logic sel,
output logic [ancho-1:0] Y
    );
always @(D0 or D1 or D2 or D3 or sel) begin
    case (sel)
        2'b00: Y <= D0;
        2'b01: Y <= D1;
        2'b10: Y <= D2;
        2'b11: Y <= D3;
    endcase
end
endmodule
