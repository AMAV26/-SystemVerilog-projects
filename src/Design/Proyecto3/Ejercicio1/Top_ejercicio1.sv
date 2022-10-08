`timescale 1ns / 1ps

module Top_ejercicio1(
    input logic clk_100MHz_i,
    input logic EN_i,//bntD
    input logic sel_i,//btnC
    input logic [1:0] sel_velocidad_i,//btnL y btnR 00/11--> medio seg, 01-->un seg,  10-->dos seg
    input logic [15:0] sw_i,
    
    output logic [2:0] LED,
    output logic [3:0] an_o,
    output logic [0:6] seg_o
    );  
        logic [15:0]reg1_o;
        logic [15:0]reg2_o;
        logic sel_mux;
        logic [15:0]mux_o;
        logic clk_10MHz;
        logic clk_1KHz;
        logic clk_un_s;
        logic clk_dos_s;
        logic clk_medio_s;
        
        clk_wiz_0 instance_name(
            .clk_10MHz      (clk_10MHz),     
            .clk_in1        (clk_100MHz_i)
        );
         dmux1a2 Elegir_reg_escribir (
             .clk_10MHz_i      (clk_10MHz),
             .sw_i           (sw_i),
             .EN_i           (EN_i),
             .sel_i          (sel_i),
                        
             .reg1_o         (reg1_o),
             .reg2_o         (reg2_o)
        );
        
       selector_velocidades Vel_selmux(
             .clk_10MHz_i       (clk_10MHz),
             .sel_velocidad_i   (sel_velocidad_i),
             .LED_o              (LED),//revisar esto con el profe
             .velocidad_sal_o   (sel_mux)
                
            );
        mux_2a1 EscogeReg(
             .sel_i  (sel_mux),
             .A_i    (reg1_o),
             .B_i    (reg2_o),
    
            .mux_o  (mux_o)
        );
        
        clk_divider #( .div (10000)) DivClk_1khz
            (
                .clk_10MHz_i     (clk_10MHz),
                .clk_div_o     (clk_1KHz)
            );
            
        Deco_7seg_ext DisplayReg(
                .clk_i      (clk_1KHz),
                .hex_i      (mux_o),
        
                .seg_o      (seg_o),
                .an_o       (an_o)
       );
endmodule
