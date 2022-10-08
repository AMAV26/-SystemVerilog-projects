`timescale 1ns / 1ps

module dmux1a2  (
input logic clk_10MHz_i,
input logic [15:0] sw_i,
input logic EN_i,
input logic  sel_i,
    
output logic [15:0]reg1_o,
output logic [15:0]reg2_o
);
        
        logic EN_reg1_o;
        logic EN_reg2_o;

    always @(*) begin
        case(sel_i)
            0: begin
                 EN_reg1_o = EN_i;
                 EN_reg2_o =0;
             end
            1: begin 
                EN_reg2_o = EN_i;  
                EN_reg1_o=0;
            end      
        endcase
    end
/////////////////////////////////////////////////////////////////////////////////////DATOi
        reg_parametrizable #(.width(16)) RegDos(
            .clk_10MHz_i    (clk_10MHz_i),
            .sw_i           (sw_i),
            .WE_i           (EN_reg2_o),
            .reg_o          (reg2_o)
        ); 
        reg_parametrizable #(.width(16)) RegUno(
            .clk_10MHz_i    (clk_10MHz_i),
            .sw_i           (sw_i),
            .WE_i           (EN_reg1_o),
            .reg_o          (reg1_o)
        );
endmodule
