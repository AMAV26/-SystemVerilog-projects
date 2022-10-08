`timescale 1ns / 1ps

module SPI_Master
    (
        input logic         sclk_100MHZ_i,
        input logic         rst_i,
        input logic  [1:0]  ctrl_MOSI,
        input logic  [1:0]  ctrl_MISO,
        input logic         s_MOSI_i,
        input logic         s_MISO_i,
        input logic  [7:0]  d_MOSI_i,
        input logic  [7:0]  d_MISO_i,
        
        output logic [7:0]  q_MOSI_o,
        output logic [7:0]  q_MISO_o,
        output logic        s_MOSI_o,
        output logic        s_MISO_o
    );
    
    shift_reg #(.N(8)) MOSI
    (
        .clk_i      (sclk_100MHZ_i),
        .rst_i      (rst_i),
        .s_i        (s_MOSI_i),
        .ctrl_i     (ctrl_MOSI),
        .d_i        (d_MOSI_i),
        .q_o        (q_MOSI_o),
        .s_o        (s_MOSI_o)
    );
    
    shift_reg #(.N(8)) MISO
    (
        .clk_i      (~sclk_100MHZ_i),
        .rst_i      (rst_i),
        .s_i        (s_MISO_i),
        .ctrl_i     (ctrl_MISO),
        .d_i        (d_MISO_i),
        .q_o        (q_MISO_o),
        .s_o        (s_MISO_o)
    );
    
endmodule
