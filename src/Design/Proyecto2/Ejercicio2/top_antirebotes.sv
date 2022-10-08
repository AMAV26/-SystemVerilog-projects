`timescale 1ns / 1ps

module top
    (
        input logic     CLK_100MHZ,
        input logic     btnC,
        input logic     [15:0] sw,

        output logic    [15:0] LED
    );

    logic db_btn_o;
    logic [15:0] leds;
    logic CLK_10MHZ;

    clk_wiz_0 Reloj
    (
        .CLK_10MHZ    (CLK_10MHZ),
        .clk_in1      (CLK_100MHZ)
    ); 

    antirebotes_sinc ANTIREBOTES
    (
        .clk_i(CLK_10MHZ),
        .btn_i(btnC),
        .rst_i(sw[0]),

        .db_btn_o(db_btn_o) 
    );

    contador_prueba ContaRebotes
    (
        .clk_i        (CLK_10MHZ), 
        .rst_n_i    (sw[0]), 
        .en_i       (btnC), 
        .conta_o    (leds[15:8])
    );

    contador_prueba ContaSinRebotes
    (
        .clk_i        (CLK_10MHZ), 
        .rst_n_i    (sw[0]), 
        .en_i       (db_btn_o), 
        .conta_o    (leds[7:0])
    );


    always @(posedge CLK_10MHZ) begin
        LED <= leds;
    end
endmodule