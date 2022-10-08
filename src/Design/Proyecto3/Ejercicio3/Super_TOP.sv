`timescale 1ns / 1ps

module Super_TOP
    (
        input logic CLK_100MHZ,
        input logic [15:0] sw,
        input logic SDO,
        
        output logic CS,
        output logic SCK,
        output logic [3:0] an,
        output logic [6:0] seg
//        output logic [15:0] LED       
    );
    
    logic CLK_10MHZ;
    logic CLK_2MHZ;
    logic CLK_1KHZ;
    logic en;
    logic [15:0] reg_data_o;
    logic [15:0] split_data_o;
    logic [15:0] data_7seg;
    
    
    clk_wiz_0 Reloj
    (
        .CLK_10MHZ    (CLK_10MHZ),     
        .clk_in1      (CLK_100MHZ)
    );
    
    counter Count_16bits
    (
        .en_i           (CLK_10MHZ),
        .count_i        (28'd10_000_000),
        .flag_o         (en),
        .count_o        ()
    );
    
    Clock_divider #(.DIVISOR(5)) DivClk_2Mhz
    (
        .clock_in     (CLK_10MHZ),
        .clock_out    (SCK)
    );
    
    Clock_divider #(.DIVISOR(10000)) DivClk_1Khz
    (
        .clock_in     (CLK_10MHZ),
        .clock_out    (CLK_1KHZ)
    );
    
    Top_SPI_Master DUT_MASTER
    (
        .clk_i          (SCK),
        .rst_i          (sw[0]),
        .rd_i           (sw[1]),
        .cs_o           (CS),
        .SDO_i          (SDO),
        .MOSI_o         (),
        .reg_data_o     (reg_data_o)
    );
    
    register #(.N(16)) DATA_REG
    (
        .clk_i          (CLK_10MHZ),
        .en_i           (en),
        .data_i         (reg_data_o),
        .data_o         (split_data_o)
    );
        Split_bits #(.N(16)) DATA_SPLIT
    (
        .data_i         (split_data_o),
        .data_o         (data_7seg)
    );
    display_7seg Disp_7seg
    (
        .clk_i     (CLK_1KHZ),
        .data_i    (data_7seg),
        .an_o      (an),
        .seg_o     (seg)
    );
    
//    always @(posedge CLK_10MHZ)
//        CS = 1'b0;
    
endmodule
