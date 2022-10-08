`timescale 1ns / 1ps

module register #(parameter N = 16) 
    (
        input logic clk_i,
        input logic en_i,
        input logic [N-1:0] data_i,

        output logic [N-1:0] data_o
    );

    always@(posedge clk_i)begin
        if(en_i)
            data_o<=data_i;

    end

endmodule