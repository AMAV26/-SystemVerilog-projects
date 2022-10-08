`timescale 1ns / 1ps

module sw_buttons_leds_v2(
input logic [15:0]sw,
input logic btnR,
input logic btnL,
input logic btnU,
input logic btnD,

output logic [15:0]led
    );
    assign led[15] = (sw[15] & ~btnD);
    assign led[14] = (sw[14] & ~btnD);
    assign led[13] = (sw[13] & ~btnD);
    assign led[12] = (sw[12] & ~btnD);
    
    assign led[11] = (sw[11] & ~btnR);
    assign led[10] = (sw[10] & ~btnR);
    assign led[9]  = (sw[9]  & ~btnR);
    assign led[8]  = (sw[8]  & ~btnR);
    
    assign led[7]  = (sw[7]  & ~btnU);
    assign led[6]  = (sw[6]  & ~btnU);
    assign led[5]  = (sw[5]  & ~btnU);
    assign led[4]  = (sw[4]  & ~btnU);
   
    assign led[3]  = (sw[3]  & ~btnL);
    assign led[2]  = (sw[2]  & ~btnL);
    assign led[1]  = (sw[1]  & ~btnL);
    assign led[0]  = (sw[0]  & ~btnL);
    
   
endmodule

