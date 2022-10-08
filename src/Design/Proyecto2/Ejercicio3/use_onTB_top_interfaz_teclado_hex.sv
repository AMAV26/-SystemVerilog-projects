`timescale 1ns / 1ps

module TB_top_interfaz_teclado_hex();
    logic           CLK_100MHZ;
    logic [2:0]     JB;//PMOD
    logic [15:0]    sw;
             
    logic [7:0]    JC;//PMod
    logic [3:0]    an;
    logic [6:0]    seg;
    logic [15:0]   LED;
    logic          CLK_10MHZ ;
    logic [1:0] count_2b_comp = 2'b00;
    logic [3:0] concat;
TOP_interfaz_teclado_hex  top
    (
        .CLK_100MHZ  (CLK_100MHZ),
        .JB          (JB),//PMOD
        .sw          (sw),
        .JC          (JC),//PMod
        .an          (an),
        .seg         (seg),
        .LED         (LED)
    );
 clk_wiz_0 Reloj
    (
        .CLK_10MHZ    (CLK_10MHZ),     
        .clk_in1      (CLK_100MHZ)
    );
initial begin
#2395;

sw[0]=1'b1;
JB[0]=1'b1;
JB[2:1]=2'b01;
concat = {JB[2:1], count_2b_comp};
#100;
sw[0]=1'b1;
JB[0]=1'b0;
JB[2:1]=2'b01;
concat = {JB[2:1], count_2b_comp};
//{JB[2:1],count_2b} = {01_00}
#100;
sw[0]=1'b1;
JB[0]=1'b1;
JB[2:1]=2'b01;
concat = {JB[2:1], count_2b_comp};
#100;
sw[0]=1'b1;
JB[0]=1'b0;
JB[2:1]=2'b01;
concat = {JB[2:1], count_2b_comp};
#100;
sw[0]=1'b1;
JB[0]=1'b0;
JB[2:1]=2'b01;
concat = {JB[2:1], count_2b_comp};
#100;
sw[0]=1'b1;
JB[0]=1'b1;
JB[2:1]=2'b01;
concat = {JB[2:1], count_2b_comp};
#100;



sw[0]=1'b1;
JB[0]=1'b1;
JB[2:1]=2'b11;
concat = {JB[2:1], count_2b_comp};
#100;
sw[0]=1'b1;
JB[0]=1'b0;
JB[2:1]=2'b11;
concat = {JB[2:1], count_2b_comp};
//{JB[2:1],count_2b} = {01_00}
#100;
sw[0]=1'b1;
JB[0]=1'b1;
JB[2:1]=2'b11;
concat = {JB[2:1], count_2b_comp};
#100;
sw[0]=1'b1;
JB[0]=1'b0;
JB[2:1]=2'b11;
concat = {JB[2:1], count_2b_comp};
#100;
sw[0]=1'b1;
JB[0]=1'b0;
JB[2:1]=2'b11;
concat = {JB[2:1], count_2b_comp};
#100;
sw[0]=1'b1;
JB[0]=1'b1;
JB[2:1]=2'b11;
concat = {JB[2:1], count_2b_comp};
#100;
end

always @(posedge CLK_10MHZ) begin//al contador le entra el reloj de 1KHz o el de 10MHz
        if (JB[0])
            count_2b_comp <= count_2b_comp + 1'b0;     
        else
            count_2b_comp <= count_2b_comp + 1'b1;
    end
 
 always @(negedge JB[0])
 begin
    case(concat)
           4'b0101:
                    if(seg!= 4)
                        $display("[DISPLAY1] ¡Incorrecto! %b != %b", seg, 4);
           4'b0111:
                    if(seg != 15)
                        $display("[DISPLAY2] ¡Incorrecto! %b != %b", seg, 15);
           4'b0110:
                    if(seg != 0)
                        $display("[DISPLAY3] ¡Incorrecto! %b != %b", seg, 0);
           4'b0100:
                    if(seg != 72)
                        $display("[DISPLAY4] ¡Incorrecto! %b != %b", seg, 72);
                        
                        
                        
           4'b1101://arregla
                    if(seg!= 6)
                        $display("[DISPLAY1] ¡Incorrecto! %b != %b", seg, 4);
           4'b1111:
                    if(seg != 7'b1001111)
                        $display("[DISPLAY2] ¡Incorrecto! %b != %b", seg, 15);
           4'b1110:
                    if(seg != 12)
                        $display("[DISPLAY3] ¡Incorrecto! %b != %b", seg, 0);
           4'b1100:
                    if(seg != 8)
                        $display("[DISPLAY4] ¡Incorrecto! %b != %b", seg, 72);
                        
           
  endcase
 end   
 
initial begin
 CLK_100MHZ = 0;
 forever #5 CLK_100MHZ = ~CLK_100MHZ;
 end
endmodule
