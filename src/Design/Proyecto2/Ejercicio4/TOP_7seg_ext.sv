`timescale 1ns / 1ps

module TOP_7seg_ext#( parameter Dos_seg= 20000000,
                                Kilo_Hz= 10000)(
input logic [1:0] sw,
input logic clk,
output logic [3:0] an,
output logic [0:6] seg
    );
    logic clk_10MHz;
    logic clk_1KHz;
    logic clk_2seg;
    logic [15:0] datoslfsr, registro;
    logic lfsrdone;
    
   clk_wiz_0 instance_name
   (
    // Clock out ports
    .clk_10MHz(clk_10MHz),     // output clk_10MHz
   // Clock in ports
    .clk_in1(clk));
   
    
    LFSR #(.NUM_BITS(16)) LFSR_inst(
    
              .i_Clk       (clk_2seg),//le entra un reloj de dos seg
              .i_Rst       (sw[0]),
              .i_Enable    (1'b1),
              .i_Seed_Data (16'b0001001000101000), 
              .o_LFSR_Data (datoslfsr),
              .o_LFSR_Done (lfsrdone)
          );
          
          _16bits_reg reg1(
          
              .sw_i     (datoslfsr),
              .WE_i     (sw[1]),
              .clk_i    (clk_10MHz),
              .reg_o    (registro)
          );
          
          
          clk_divider_2seg #(.div(Dos_seg)) div1 (
              .clk_i    (clk_10MHz),
              .clk_o    (clk_2seg)
          );
          
          clk_divider_2seg #(.div(Kilo_Hz)) div2 (
              .clk_i    (clk_10MHz),
              .clk_o    (clk_1KHz)
          );
          
          Deco_Hex_7seg_ext disp1 (
              .clk_i      (clk_1KHz),
              .h0_i       (registro),
              .an_o       (an),
              .seg_o      (seg)
          );
          

endmodule