`timescale 1ns / 1ps

module tb_sw_buttons_leds_v3;
logic  [15:0]sw;
logic btnR;
logic btnL;
logic btnU;
logic btnD;
logic led;

sw_buttons_leds_v2 DUT(
.sw      (sw),
.btnR    (btnR),
.btnL    (btnL),
.btnU    (btnU),
.btnD    (btnD),
.led     (led)
);
initial begin
  sw[3:0] = 4'b1;
  btnR = 1'b1;
  btnL = 1'b0;
  btnU = 1'b0;
  btnD = 1'b0;
  #10
    if(led != 1'b1)
    $display("[DISPLAY] ¡Incorrecto! %b & %b != %b", sw, btnL, led);
  sw[15:12] = 4'b1;
  btnR = 1'b0;
  btnL = 1'b1;
  btnU = 1'b0;
  btnD = 1'b0;
  #10
    if(led != 1'b1)
    $display("[DISPLAY] ¡Incorrecto! %b & %b != %b", sw, btnD, led);
    
  sw [7:4] = 4'b1;
  btnR = 1'b0;
  btnL = 1'b0;
  btnU = 1'b1;
  btnD = 1'b0;
  #10
  if(led != 1'b0)
    $display("[DISPLAY] ¡Incorrecto! %b & %b != %b", sw, btnU, led);
    
  sw [11:8] = 4'b1;
  btnR = 1'b0;
  btnL = 1'b0;
  btnU = 1'b0;
  btnD = 1'b1;
  #10
  if(led != 1'b1)
    $display("[DISPLAY] ¡Incorrecto! %b & %b != %b", sw, btnR, led);
    
  sw [15:12] = 4'b1;
  btnR = 1'b0;
  btnL = 1'b0;
  btnU = 1'b0;
  btnD = 1'b0;
  #10
  if(led != 1'b1)
    $display("[DISPLAY] ¡Incorrecto! %b & %b != %b", sw, btnD, led);
    
  sw[7:4] = 4'b1;
  btnR = 1'b1;
  btnL = 1'b0;
  btnU = 1'b0;
  btnD = 1'b0;
  #10
  if(led != 1'b1)
    $display("[DISPLAY] ¡Incorrecto! %b & %b != %b", sw, btnU, led);
    
  sw [3:0]= 4'b1;
  btnR = 1'b0;
  btnL = 1'b1;
  btnU = 1'b0;
  btnD = 1'b0;
  #10
  if(led != 1'b0)
    $display("[DISPLAY] ¡Incorrecto! %b & %b != %b", sw, btnL, led);
    
  sw[7:4] = 4'b1;
  btnR = 1'b0;
  btnL = 1'b0;
  btnU = 1'b1;
  btnD = 1'b0;
  #10
  if(led != 1'b0)
    $display("[DISPLAY] ¡Incorrecto! %b & %b != %b", sw, btnU, led);
    
  sw [3:0]= 4'b1;
  btnR = 1'b0;
  btnL = 1'b0;
  btnU = 1'b0;
  btnD = 1'b1;
  #10
  if(led != 1'b1)
    $display("[DISPLAY] ¡Incorrecto! %b & %b != %b", sw, btnL, led);
  
  sw [11:8]= 4'b1;
  btnR = 1'b1;
  btnL = 1'b0;
  btnU = 1'b0;
  btnD = 1'b1;
  #10
  if(led != 1'b0)
    $display("[DISPLAY] ¡Incorrecto! %b & %b != %b", sw, btnR, led);
    
  sw [15:12]= 4'b1;
  btnR = 1'b1;
  btnL = 1'b1;
  btnU = 1'b1;
  btnD = 1'b1;
  #10
  if(led != 1'b0)
    $display("[DISPLAY] ¡Incorrecto! %b & %b != %b", sw, btnD, led);
 #10
  $finish;
end
endmodule
