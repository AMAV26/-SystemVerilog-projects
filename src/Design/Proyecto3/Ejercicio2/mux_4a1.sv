`timescale 1ns / 1ps

module Mux_4a1
    (
        input logic all_1s_i,
        input logic all_0s_i,
        input logic [31:0] data_i,
        
        output logic [31:0] dato_o

    );
    logic [1:0] selector;
    assign selector = {all_1s_i,all_0s_i};
           always @(*)begin
            case(selector)
                2'b00: dato_o <= data_i;
                2'b01: dato_o <= 32'h0000_0000;
                2'b10: dato_o <= 32'h0000_00FF;
                2'b11: dato_o <= 32'h0000_00FF;
            endcase
        end
endmodule