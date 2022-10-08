`timescale 1ns / 1ps

module _16bits_reg(

input logic [15:0] sw_i,
input logic WE_i, 
            clk_i,
output logic [15:0] reg_o
    );
    
    always @ (posedge clk_i) begin
    if (WE_i) 
        reg_o <= sw_i;
    end
endmodule

