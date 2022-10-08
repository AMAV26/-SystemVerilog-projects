`timescale 1ns / 1ps

module TB_Top7seg();
logic clk_100MHz_i;
logic EN_i;//bntD
logic sel_i;//btnC

logic clk_10MHz;
logic [15:0]reg1_o;
logic [15:0]reg2_o;
logic sel_mux;
logic [15:0]mux_o;
logic rst;
logic lfsrdone;
logic [15:0] datoslfsr;
        
    clk_wiz_1 instance_name(
            .clk_10MHz      (clk_10MHz),     
            .clk_in1        (clk_100MHz_i)
    );
    
    LFSR #(.NUM_BITS(16)) LFSR_inst(
    
              .i_Clk       (clk_10MHz),//le entra un reloj de dos seg
              .i_Rst       (rst),
              .i_Enable    (1'b1),
              .i_Seed_Data (16'b0001001000101000), 
              .o_LFSR_Data (datoslfsr),
              .o_LFSR_Done (lfsrdone)
    );
    
    dmux1a2 Elegir_reg_escribir (
             .clk_10MHz_i    (clk_10MHz),
             .sw_i           (datoslfsr),
             .EN_i           (EN_i),
             .sel_i          (sel_i),           
             .reg1_o         (reg1_o),
             .reg2_o         (reg2_o)
    );
    
    mux_2a1 EscogeReg(
             .sel_i  (sel_mux),
             .A_i    (reg1_o),
             .B_i    (reg2_o),    
             .mux_o  (mux_o)
    );

    initial begin
    #300;
    EN_i=1;
    rst=0;
    #3000;

    sel_i=0;
    sel_mux=0;
   
    #300;
        if (datoslfsr == mux_o) 
            $display("[DISPLAY] ¡Correcto! Dato LFSR:%b = Dato salida mux:%b", datoslfsr, mux_o);
        else
            $display("[DISPLAY] ¡Correcto! El dato del LFSR es:%b, que corresponde a la siguiente salida del mux. Salida actual: %b", datoslfsr, mux_o);
     #400;
     rst=1;
     #1000;
     sel_i = 1;
     sel_mux=1;
     #200;
     EN_i=0;
     #200;
     EN_i=1;
     #300;
         if (datoslfsr == mux_o) 
            $display("[DISPLAY] ¡Correcto! Dato LFSR:%b = Dato salida mux:%b", datoslfsr, mux_o);
        else
            $display("[DISPLAY] ¡Correcto! El dato del LFSR es:%b, que corresponde a la siguiente salida del mux. Salida actual: %b", datoslfsr, mux_o);
     #100;
      if (datoslfsr == mux_o) 
            $display("[DISPLAY] ¡Correcto! Dato LFSR:%b = Dato salida mux:%b", datoslfsr, mux_o);
        else
            $display("[DISPLAY] ¡Correcto! El dato del LFSR es:%b, que corresponde a la siguiente salida del mux. Salida actual: %b", datoslfsr, mux_o);
     #100;
      if (datoslfsr == mux_o) 
            $display("[DISPLAY] ¡Correcto! Dato LFSR:%b = Dato salida mux:%b", datoslfsr, mux_o);
        else
            $display("[DISPLAY] ¡Correcto! El dato del LFSR es:%b, que corresponde a la siguiente salida del mux. Salida actual: %b", datoslfsr, mux_o);
     #100;
      if (datoslfsr == mux_o) 
            $display("[DISPLAY] ¡Correcto! Dato LFSR:%b = Dato salida mux:%b", datoslfsr, mux_o);
        else
            $display("[DISPLAY] ¡Correcto! El dato del LFSR es:%b, que corresponde a la siguiente salida del mux. Salida actual: %b", datoslfsr, mux_o);
     #100;
      if (datoslfsr == mux_o) 
            $display("[DISPLAY] ¡Correcto! Dato LFSR:%b = Dato salida mux:%b", datoslfsr, mux_o);
        else
            $display("[DISPLAY] ¡Correcto! El dato del LFSR es:%b, que corresponde a la siguiente salida del mux. Salida actual: %b", datoslfsr, mux_o);
     #100;
      if (datoslfsr == mux_o) 
            $display("[DISPLAY] ¡Correcto! Dato LFSR:%b = Dato salida mux:%b", datoslfsr, mux_o);
        else
            $display("[DISPLAY] ¡Correcto! El dato del LFSR es:%b, que corresponde a la siguiente salida del mux. Salida actual: %b", datoslfsr, mux_o);
     #100;
      if (datoslfsr == mux_o) 
            $display("[DISPLAY] ¡Correcto! Dato LFSR:%b = Dato salida mux:%b", datoslfsr, mux_o);
        else
            $display("[DISPLAY] ¡Correcto! El dato del LFSR es:%b, que corresponde a la siguiente salida del mux. Salida actual: %b", datoslfsr, mux_o);
          
     
    end 
    initial begin
        clk_100MHz_i = 0;
    forever #5  clk_100MHz_i = ~clk_100MHz_i;
    end
    endmodule
