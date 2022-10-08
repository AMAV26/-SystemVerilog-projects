`timescale 1ns / 1ps

module PLL_TB;
    parameter period = 5;
    logic [15:0] aux1;
    logic [15:0] aux2;
    logic clk_100MHz;
    logic clk_10MHz;
    logic [15:0] contador=-1;
    logic [15:0] contador2=0;
always #period 
    clk_100MHz=~clk_100MHz; 


clk_wiz_0 instance_name
   (
    // Clock out ports
    .CLK_10MHZ(clk_10MHz),     // output clk_10MHz
   // Clock in ports
    .clk_in1(clk_100MHz));      // input clk_in1
   


 always@(posedge clk_10MHz)begin
 aux1<=0;
   
    contador2 <= 0;
    
 end
 always@(negedge clk_10MHz)begin
     
    contador2 <= contador2+1;
    #1;
    aux1 <= contador2;
 end
 
always @(posedge clk_100MHz) begin
        contador <= contador + 1;
        aux2 <= aux2+1 ;
        if(contador!=aux2)
            $display("[DISPLAY] ¡Incorrecto! %b != %b", contador, contador2);
        end
always @(posedge clk_10MHz )begin
        contador<=1;
        aux2<= 1;
        
end


 initial begin
  
    clk_100MHz=0;
 end
endmodule 