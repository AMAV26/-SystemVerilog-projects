`timescale 1ns / 1ps
module TOP_PC(
input logic clk_100MHz, 

input logic [15:0] sw,
output logic [15:0] LED
    );
logic clk_1Hz,
      clk_10MHz;
logic [15:0] leds;
clk_wiz_0 instance_name
   (
    // Clock out ports
     .clk_10MHz     (clk_10MHz),     // output clk_10MHz
   // Clock in ports
     .clk_in1       (clk_100MHz)
    ); 
    
    divisor_frecuencia DUT
    (
     .clock_in_i     (clk_10MHz), 
     .clock_out_o    (clk_1Hz)
    );
    
    program_counter PC
    (
        .clk_i        (clk_1Hz), 
        .reset_i      (sw[3]),
        .PC_i       (sw[15:12]), //PC_i = direccion de salto
        .PC_op_i    (sw[1:0]),
        .PC_o       (leds[15:12]),
        .PC_inc_o   (leds[7:4])
    );
    always @(posedge clk_10MHz)begin
        LED<=leds;
    end
endmodule
