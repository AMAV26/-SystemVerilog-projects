`timescale 1ns / 1ps

module Super_Top
    (
        input logic             CLK_100MHZ,
        input logic  [15: 0]    sw,
        
        output logic [3 : 0]    an,
        output logic [6 : 0]    seg,
        output logic [15: 0]    LED
    );
    
    logic           CLK_10MHZ;
    logic           termino_o;
    logic           wr_i;
    logic           reg_sel_i;
    logic [31: 0]   entrada_i;
    logic [7 : 0]   addr_in;
    logic           ram_sel_data;
    logic           ram_sel_addr;
    logic           ram_sel_wr;
    logic [31: 0]   salida_o;
    
    clk_wiz_0 Reloj
    (
        .CLK_10MHZ      (CLK_10MHZ),    
        .clk_in1        (CLK_100MHZ)
    );
    
    Super_Control Sup_Ctrl
    (
        .clk_i          (CLK_10MHZ),
        .rst_i          (sw[0]),
        .termino_i      (termino_o),
        .wr_i           (wr_i),
        .reg_sel_i      (reg_sel_i),
        .entrada_i      (entrada_i),
        .addr_in        (addr_in),
        .ram_sel_data   (ram_sel_data),
        .ram_sel_addr   (ram_sel_addr),
        .ram_sel_wr     (ram_sel_wr),
        .termino_o      (termino_o)
    );
    
    
    TOP DUT_TOP
    (
        .CLK_10MHZ      (CLK_10MHZ),
        .wr_i           (wr_i),
        .sel_modo_i     (sw[1]),
        .reg_sel_i      (reg_sel_i),
        .entrada_i      (entrada_i),
        .addr_in        (addr_in),
        .ram_sel_data   (ram_sel_data),
        .ram_sel_addr   (ram_sel_addr),
        .ram_sel_wr     (ram_sel_wr),
        .an_o           (an),
        .seg_o          (seg),
        .LED_o          (LED),
        .salida_o       (salida_o)    
    );
endmodule
