`timescale 1ns / 1ps

module TB_antirebotes;

logic clk, reset;
logic btnC;
logic pulse;
logic db_btn_o;
logic [3:0] contador2;
antirebotes_sinc DUT(
.clk_i (clk),
.btn_i (btnC),
.rst_i (reset),

.db_btn_o (db_btn_o) 
    );
    
 initial begin
 clk = 0;
 forever #5 clk = ~clk;
 end
 /* como hago un test bench autochekeable metiendo un contador cada que duira mas de 5 ciclos de reljo?*/
 initial begin
 contador2=0;
 reset=1;
 btnC = 0;
 #100;
btnC = 1;
  #20;
btnC = 0;
  #10;
btnC = 1;
  #30; 
btnC = 0;
  #10;
 btnC = 1;
  #40;
 btnC = 0;
  #10;
  btnC=1;
  #30; 
  btnC = 0;
  #10;
  btnC =1; 
  #500; 
  btnC = 0;
  #10;
 btnC =1;
  #20;
 btnC = 0;
  #10;
  btnC =1;
  #30; 
 btnC = 0;
  #10;
 btnC =1;
  #40;
 btnC = 0; 
 #100;
 
 

btnC = 1;
  #20;
btnC = 0;
  #10;
btnC = 1;
  #30; 
btnC = 0;
  #10;
 btnC = 1;
  #40;
 btnC = 0;
  #10;
  btnC=1;
  #30; 
  btnC = 0;
  #10;
  btnC =1; 
  #500; 
  btnC = 0;
  #10;
 btnC =1;
  #20;
 btnC = 0;
  #10;
  btnC =1;
  #30; 
 btnC = 0;
  #10;
 btnC =1;
  #40;
 btnC = 0; 
 #200;
 

btnC = 1;
  #20;
btnC = 0;
  #10;
btnC = 1;
  #30; 
btnC = 0;
  #10;
 btnC = 1;
  #40;
 btnC = 0;
  #10;
  btnC=1;
  #30; 
  btnC = 0;
  #10;
  btnC =1; 
  #300; 
  btnC = 0;
  #10;
 btnC =1;
  #20;
 btnC = 0;
  #10;
  btnC =1;
  #30; 
 btnC = 0;
  #10;
 btnC =1;
  #40;
 btnC = 0; 
 #150;
 
 
 $finish;
 end 
 


  always@(posedge db_btn_o)
    begin 
   contador2 <= 0;
    
    
 end 
 always@(negedge db_btn_o)
   begin 
  
   
    contador2 <= contador2+1;
   
       
end
always@(negedge db_btn_o)
    pulse=1;
always@(posedge db_btn_o)
    pulse=0;
    
    
always@(posedge db_btn_o)
   begin 
    #1;
   if(pulse)
        if(contador2 != 4'b0001)
            $display("[DISPLAY] ¡Incorrecto! %b != %b", contador2, 4'b0001);
   end
endmodule

