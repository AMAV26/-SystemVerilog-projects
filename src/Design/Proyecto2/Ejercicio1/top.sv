`timescale 1ns / 1ps

module top 
    (
    input logic    CLK_100MHZ,
    input logic    [15:0] sw,


    output logic   [15:0] LED
    );

    logic [15:0] leds;
    logic CLK_1S;
    logic CLK_10MHZ;

    clk_wiz_0 Reloj
    (
        .CLK_10MHZ    (CLK_10MHZ),
        .clk_in1      (CLK_100MHZ)
    );

    Clock_divider DivClk
    (
        .clock_in_i     (CLK_10MHZ),
        .clock_out_o    (CLK_1S)
    );

    contador_prueba Conta1seg
    (
        .clk_i        (CLK_10MHZ), 
        .rst_n_i    (sw[0]), 
        .en_i       (CLK_1S), 
        .conta_o    (leds[15:8])
    );

    contador_prueba Conta10MHz
    (
        .clk_i        (CLK_10MHZ), 
        .rst_n_i    (sw[0]), 
        .en_i       (CLK_10MHZ), 
        .conta_o    (leds[7:0])
    );



    always @(posedge CLK_10MHZ) begin
        LED <= leds;
    end

endmodule