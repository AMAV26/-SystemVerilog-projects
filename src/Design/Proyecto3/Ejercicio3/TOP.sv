`timescale 1ns / 1ps

module Top_SPI_Master
    (
        input logic             clk_i,
        input logic             rst_i,
        input logic             rd_i,
        input logic             SDO_i,
        
        output logic            cs_o,
        output logic            MOSI_o,
        output logic [15: 0]    reg_data_o
    );
    
    logic           we_o;
    logic           rst_o;
    logic [1:0]     ctrl_MOSI_o; 
    logic [1:0]     ctrl_MISO_o;
    logic           s_MISO_o ;
    logic           unbyte;
    logic           fin;
    logic           send_o;
    logic           en_unbyte;
    logic           en_fin;
    logic [15:0]    q_MOSI_o;
    logic [15:0]    q_MISO_o;

    
    Control_SPI CONTROL
    (
        .clk_i          (clk_i),
        .rst_i          (rst_i),
        .unbyte_i       (unbyte),
        .rd_i           (rd_i),
        .cs_o           (cs_o),
        .rst_o          (rst_o),
        .en_unbyte_o    (en_unbyte),
        .ctrl_MOSI_o    (ctrl_MOSI_o),
        .ctrl_MISO_o    (ctrl_MISO_o),
        .we_o           (we_o)
    );
    
    SPI_Master MAESTRO
    (
        .sclk_i         (clk_i),
        .rst_i          (rst_o),
        .ctrl_MOSI      (ctrl_MOSI_o),
        .ctrl_MISO      (ctrl_MISO_o),
        .s_MOSI_i       (1'b1),
        .s_MISO_i       (SDO_i),
        .d_MOSI_i       (16'h0000),
        .d_MISO_i       (16'h0000),
        .q_MOSI_o       (q_MOSI_o),
        .q_MISO_o       (q_MISO_o),
        .s_MOSI_o       (MOSI_o),
        .s_MISO_o       (s_MISO_o)
    );
    
    counter Count_16bits
    (
        .en_i           (en_unbyte),
        .count_i        (28'd15),
        .flag_o         (unbyte),
        .count_o        ()
    );
    
    register #(.N(16)) DATA_REG
    (
        .clk_i          (clk_i),
        .en_i           (we_o),
        .data_i         (q_MISO_o),
        .data_o         (reg_data_o)
    );
    
    
    
    
endmodule