`timescale 1ns / 1ps

module TB_deco_to_7segmentos;
logic [15:0] sw;
logic [1:0] select;
logic [6:0] seg;
logic [3:0] bcd;
logic btnL;
logic btnR;
deco_to_7sgmentos_v3 DUT(
.sw (sw),
.seg (seg),
.btnL (btnL),
.btnR (btnR)
);

initial begin
    btnL = 1'b0;
    btnR = 1'b0;
    select = {btnL , btnR};
    sw = 4'b0000;
    bcd = sw [15:12];
    #100
    if (seg != 7'b000_0001)
        $display("[DISPLAY] ¡Incorrecto! %b != %b", seg,7'b000_0001 );
    btnL = 1'b0;
    btnR = 1'b0;
    select = {btnL , btnR};
    sw = 4'b0001;
    bcd = sw [15:12];
    #100
    if (seg != 7'b100_1111)
        $display("[DISPLAY] ¡Incorrecto! %b != %b", seg,7'b100_1111 );
        
    btnL = 1'b0;
    btnR = 1'b0;
    select = {btnL , btnR};
    sw = 4'b0010;
    bcd = sw [15:12];
    #100
    if (seg != 7'b001_0010)
        $display("[DISPLAY] ¡Incorrecto! %b != %b", seg,7'b001_0010); 
        
    btnL = 1'b0;
    btnR = 1'b0;
    select = {btnL , btnR};
    sw = 4'b0011;
    bcd = sw [15:12];
    #100
    if (seg != 7'b000_0110)
        $display("[DISPLAY] ¡Incorrecto! %b != %b", seg,7'b000_0110); 
    
    btnL = 1'b0;
    btnR = 1'b0;
    select = {btnL , btnR};
    sw = 4'b0100;
    bcd = sw [15:12];
    #100
    if (seg != 7'b100_1100)
        $display("[DISPLAY] ¡Incorrecto! %b != %b", seg,7'b100_1100); 
        
    btnL = 1'b0;
    btnR = 1'b0;
    select = {btnL , btnR};
    sw = 4'b0101;
    bcd = sw [15:12];
    #100
    if (seg != 7'b010_0100)
        $display("[DISPLAY] ¡Incorrecto! %b != %b", seg,7'b010_0100); 
    
     btnL = 1'b0;
    btnR = 1'b0;
    select = {btnL , btnR};
    sw = 4'b0110;
    bcd = sw [15:12];
    #100
    if (seg != 7'b010_0000)
        $display("[DISPLAY] ¡Incorrecto! %b != %b", seg,7'b010_0000); 
        
     btnL = 1'b0;
    btnR = 1'b0;
    select = {btnL , btnR};
    sw = 4'b0111;
    bcd = sw [15:12];
    #100
    if (seg != 7'b000_1111)
        $display("[DISPLAY] ¡Incorrecto! %b != %b", seg,7'b000_1111);
        
    btnL = 1'b0;
    btnR = 1'b0;
    select = {btnL , btnR};
    sw = 4'b1000;
    bcd = sw [15:12];
    #100
    if (seg != 7'b000_0000)
        $display("[DISPLAY] ¡Incorrecto! %b != %b", seg,7'b000_0000);
    
    btnL = 1'b0;
    btnR = 1'b0;
    select = {btnL , btnR};
    sw = 4'b1001;
    bcd = sw [15:12];
    #100
    if (seg != 7'b000_0100)
        $display("[DISPLAY] ¡Incorrecto! %b != %b", seg,7'b000_0100);
        
    btnL = 1'b0;
    btnR = 1'b0;
    select = {btnL , btnR};
    sw = 4'b1010;
    bcd = sw [15:12];
    #100
    if (seg != 7'b000_1000)
        $display("[DISPLAY] ¡Incorrecto! %b != %b", seg,7'b000_1000);
        
    btnL = 1'b0;
    btnR = 1'b0;
    select = {btnL , btnR};
    sw = 4'b1011;
    bcd = sw [15:12];
    #100
    if (seg != 7'b110_0000)
        $display("[DISPLAY] ¡Incorrecto! %b != %b", seg,7'b110_0000);
        
     btnL = 1'b0;
    btnR = 1'b0;
    select = {btnL , btnR};
    sw = 4'b1100;
    bcd = sw [15:12];
    #100
    if (seg != 7'b111_0010)
        $display("[DISPLAY] ¡Incorrecto! %b != %b", seg,7'b111_0010);
        
         btnL = 1'b0;
    btnR = 1'b0;
    select = {btnL , btnR};
    sw = 4'b1101;
    bcd = sw [15:12];
    #100
    if (seg != 7'b100_0010)
        $display("[DISPLAY] ¡Incorrecto! %b != %b", seg,7'b100_0010);
    
      btnL = 1'b0;
    btnR = 1'b0;
    select = {btnL , btnR};
    sw = 4'b1110;
    bcd = sw [15:12];
    #100
    if (seg != 7'b011_0000)
        $display("[DISPLAY] ¡Incorrecto! %b != %b", seg,7'b011_0000);
        
     btnL = 1'b0;
    btnR = 1'b0;
    select = {btnL , btnR};
    sw = 4'b1111;
    bcd = sw [15:12];
    #100
    if (seg != 7'b011_1000)
        $display("[DISPLAY] ¡Incorrecto! %b != %b", seg,7'b011_1000);
 end
endmodule
