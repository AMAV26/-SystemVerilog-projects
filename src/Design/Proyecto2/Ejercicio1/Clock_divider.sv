`timescale 1ns / 1ps

module Clock_divider(
    input logic clock_in_i,
    output logic clock_out_o
    );

    reg[27:0] counter=28'd0;
    parameter DIVISOR = 28'd10000000;

    always @(posedge clock_in_i) begin
     counter <= counter + 28'd1;
     if(counter>=(DIVISOR-1))
        counter <= 28'd0;
     clock_out_o <= (counter<DIVISOR/2)?1'b1:1'b0;
    end
endmodule