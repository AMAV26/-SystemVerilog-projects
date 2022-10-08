`timescale 1ns / 1ps

module TB_Top_unidad_calculo;
     logic CLK_100MHZ;
     logic btnC;
     //logic btnR;
     logic [15:0]sw_i; 
     
     logic [15:0] LED;                        
     logic an_o;
     logic seg_o;
   
     logic flag_in;
     /*
     logic we;
     logic we_7seg;
    
     logic mux_sel;
     logic [3:0] alu_cont;*/
     
     Top_Unidad_calculo prueba(
     .CLK_100MHZ    (CLK_100MHZ),
     .btnC          (btnC),
     //.btnR          (btnR),
     .sw_i          (sw_i), 
     
     .LED           (LED),
     .an_o          (an_o),
     .seg_o         (seg_o)
     
    );
    
    initial begin
        #2395;
        sw_i[2] = 0;//rest
        sw_i[0] = 0;//modo calculador
        flag_in = 0;
 
        
        btnC = 1'b0;//key_detect
        #300;
        sw_i[15:12] = 4'b0110;//data_switch
        btnC=1'b1;
     
        
        btnC = 1'b0;
                #300;

        sw_i[15:12] = 4'b1010;
       
       
        
        btnC = 1'b0;
                #300;

        sw_i[15:12] = 4'b0011;
        btnC=1'b1;

        btnC = 1'b0;
                #300;

        sw_i[15:12] = 4'b1111;
        btnC = 1'b1;
        #200;
    end
    initial begin
         CLK_100MHZ = 0;
         forever #5  CLK_100MHZ = ~CLK_100MHZ;
    end
    
endmodule
