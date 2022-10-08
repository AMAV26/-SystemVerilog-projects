`timescale 1ns / 1ps
module TB_ALU;
    parameter width = 4;
    logic [width-1:0] A;
    logic [width-1:0] B;
    logic [3:0] ALUcontrol;
    logic ALUFlagIn;
    logic Z;
    logic Cout;
    logic [width-1:0] ALUResult;
 ALU_parametrizable ALU(
    .A (A), //switches del 0 al 3
    .B (B), //switches del 4 al 7
    .ALUcontrol (ALUcontrol),//switches del 8 al 11
    .ALUFlagIn (ALUFlagIn),// switches del 12 al 13
    .ALUResult (ALUResult), //ver si se hace con el display o con leds
    //.Z (Z),// ver como lo muestro em TB
    .Cout (Cout)// ver como es posible mostrarlo
 );
 initial begin
        A = 4'b1011;
        B = 4'b0010;
        ALUFlagIn= 1'b0;
       ALUcontrol = 4'b0000;//AND
        #50
        if (ALUResult != 4'b0010)
            $display("[DISPLAY] ¡Incorrecto! %b & %b != %b", A, B, ALUResult);
            
       /* XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX*/
        ALUcontrol = 4'b0001;//OR
        #50
        if (ALUResult != 4'b1011)
            $display("[DISPLAY] ¡Incorrecto! %b | %b != %b", A, B, ALUResult);
        /* XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX*/     
        ALUcontrol = 4'b0010; //SUMA
        #50
         if (ALUFlagIn ==0)
            if (ALUResult != 4'b1101) 
            $display("[DISPLAY] ¡Incorrecto! %b + %b != %b", A, B, ALUResult);
                
        else
            if (ALUResult != 4'b1110) 
                $display("[DISPLAY] ¡Incorrecto! %b + %b != %b", A, B, ALUResult);
        /* XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX*/  
        ALUcontrol = 4'b0011; //Incremento Uno
        #50
         if (ALUFlagIn ==0)
            if (ALUResult != 4'b1100) 
                $display("[DISPLAY] ¡Incorrecto! %b + %b != %b", A, 1, ALUResult);
        else
            if (ALUResult != 4'b0011) 
                $display("[DISPLAY] ¡Incorrecto! %b + %b != %b", 1, B, ALUResult);
         /* XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX*/   
        ALUcontrol = 4'b0100; //Decremento Uno
        #50
        if (ALUFlagIn ==0)
            if (ALUResult != 4'b1010) 
                $display("[DISPLAY] ¡Incorrecto! %b - %b != %b", A, 1, ALUResult);
        else
            if (ALUResult != 4'b0001) 
               $display("[DISPLAY] ¡Incorrecto! %b - %b != %b", 1, B, ALUResult);
       
         /* XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX*/    
        ALUcontrol = 4'b0101; // NOT
        #50
          if (ALUFlagIn ==0)
            if (ALUResult != 4'b0100) 
                $display("[DISPLAY] ¡Incorrecto! ~%b != %b", A, ALUResult);
        else
            if (ALUResult != 4'b1101) 
                $display("[DISPLAY] ¡Incorrecto! ~%b != %b", B, ALUResult);
         /* XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX*/    
        ALUcontrol = 4'b0110; //Resta o Suma C2
        #50
       
       if (ALUFlagIn ==0)
            if (ALUResult != 4'b1001) 
                $display("[DISPLAY] ¡Incorrecto! %b - %b != %b", A, B, ALUResult);
        else
            if (ALUResult != 4'b1010) 
              $display("[DISPLAY] ¡Incorrecto! %b - %b != %b", A, B, ALUResult);
         /* XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX*/    
        ALUcontrol = 4'b0111; // XOR
        #50
        if (ALUResult != 4'b1001)
            $display("[DISPLAY] ¡Incorrecto! %b ^ %b != %b", A, B, ALUResult);
         /* XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX*/    
        ALUcontrol = 4'b1000; // corrimiento derecha
        #50
        
       if (ALUFlagIn ==0)
            if (ALUResult != 4'b0010) 
                $display("[DISPLAY] ¡Incorrecto! %b >> %b != %b", A, B, ALUResult);
        else
            if (ALUResult != 4'b1110) 
                $display("[DISPLAY] ¡Incorrecto! %b >> %b != %b", A, B, ALUResult);
         /* XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX*/    
        ALUcontrol = 4'b1001; //Corrimiento a la izquierda
        #50
        if (ALUFlagIn ==0)
            if (ALUResult != 4'b1100) 
               $display("[DISPLAY] ¡Incorrecto! %b << %b != %b", A, B, ALUResult);
        else
            if (ALUResult != 4'b1111) 
                $display("[DISPLAY] ¡Incorrecto! %b << %b != %b", A, B, ALUResult);
             
        #550
        $finish;     
 end
    always
        #25
        ALUFlagIn = ~ALUFlagIn;
          
endmodule
