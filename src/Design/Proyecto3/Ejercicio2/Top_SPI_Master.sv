`timescale 1ns / 1ps

module Top_SPI_Master
    (
        input logic             clk_i,
        input logic             rst_i,
        input logic             MISO_i,
        input logic  [31: 0]    reg_ctrl_i,
        input logic  [31: 0]    reg_data_i,
        
        output logic            MOSI_o,
        output logic            WR2_ctrl_o,
        output logic            WR2_data_o,
        output logic            cs_o,
        output logic [7:  0]    addr_o,
        output logic [31: 0]    reg_ctrl_o,
        output logic [31: 0]    reg_data_o
    );
    
    logic           rst_o;
    logic [1:0]     ctrl_MOSI; 
    logic [1:0]     ctrl_MISO;
    logic           s_MISO_o ;
    logic           unbyte;
    logic           fin;
    logic           send_o;
    logic           en_unbyte;
    logic           en_fin;
    logic [7:0]     q_MOSI_o;
    logic [7:0]     q_MISO_o;
    logic [27:0]    address;
    
    Control_SPI CONTROL_MAESTRO
    (
        .clk_i          (clk_i),
        .rst_i          (rst_i),
        .send_i         (reg_ctrl_i[0]),
        .unbyte_i       (unbyte),
        .fin_i          (fin),
        .WR2_ctrl       (WR2_ctrl_o),
        .WR2_data       (WR2_data_o),
        .send_o         (send_o),
        .rst_o          (rst_o),
        .ctrl_MOSI      (ctrl_MOSI),
        .ctrl_MISO      (ctrl_MISO),
        .en_unbyte      (en_unbyte),
        .en_fin         (en_fin)  
    );
    
    SPI_Master MAESTRO
    (
        .sclk_100MHZ_i  (clk_i),
        .rst_i          (rst_o),
        .ctrl_MOSI      (ctrl_MOSI),
        .ctrl_MISO      (ctrl_MISO),
        .s_MOSI_i       (1'b0),
        .s_MISO_i       (MISO_i),
        .d_MOSI_i       (reg_data_i[7:0]),
        .d_MISO_i       (8'h00),
        .q_MOSI_o       (q_MOSI_o),
        .q_MISO_o       (q_MISO_o),
        .s_MOSI_o       (MOSI_o),
        .s_MISO_o       (s_MISO_o)
    );
    
    counter Count_8bits
    (
        .en_i           (en_unbyte),
        .count_i        (9'b000000111),
        .flag_o         (unbyte),
        .count_o        ()
    );
    
    counter Count_Bytes
    (
        .en_i           (en_fin),
        .count_i        (reg_ctrl_i [12:4]),
        .flag_o         (fin),
        .count_o        (address)
    );
    
    always @(posedge clk_i) begin
        reg_ctrl_o = {6'b000000,addr_o,3'b000,reg_ctrl_i [12:1],send_o};
        reg_data_o = {reg_data_i[31:8],q_MISO_o};
        cs_o = ~reg_ctrl_i[1];
        addr_o = address[7:0];
    end
    
    
    
endmodule
