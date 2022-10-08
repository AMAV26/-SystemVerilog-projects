`timescale 1ns / 1ps

module TB_TOP_7seg_ext;
    logic [1:0] sw;
    logic clk;
    logic [3:0] an;
    logic [0:6] seg;
    logic clk_10MHz;
    logic datoslfsr;
    logic lfsrdone;
    
    TB_TOP_pruebas DUT(
        .sw     (sw),
        .clk    (clk),
        .an     (an),
        .seg    (seg)
        );
   
    initial begin
        #2395;
        sw[0]=1'b0;
        sw[1]=1'b1;
        #100;
        sw[0]=1'b1;
        sw[1]=1'b1;
        #100;
        sw[0]=1'b0;
        sw[1]=1'b1;
        #200
        sw[0]=1'b1;
        sw[1]=1'b1;
        #200;  
        sw[0]=1'b0;
        sw[1]=1'b1;
        #100;
        sw[0]=1'b1;
        sw[1]=1'b1;
        #300;      
        $finish;
    end    
    
    initial begin
         clk = 0;
         forever #5  clk = ~clk;
    end
endmodule
