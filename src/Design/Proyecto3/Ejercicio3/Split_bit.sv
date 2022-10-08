`timescale 1ns / 1ps

module Split_bits #(parameter N = 16) 
    (
        input logic [N-1:0] data_i,

        output logic [N-1:0] data_o
    );

  assign data_o = {data_i[3:1],data_i[3],data_i[3:0]};
endmodule
