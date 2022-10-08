`timescale 1ns / 1ps

module ALU_parametrizable #(parameter width = 4)(
    input logic [width-1:0] A, //switches del 0 al 3
    input logic [width-1:0] B, //switches del 4 al 7
    input logic [3:0] ALUcontrol,//switches del 8 al 11
    input logic ALUFlagIn,// switches del 12 al 13
    output logic [width-1:0] ALUResult, //ver si se hace con el display o con leds
    output logic Z,// ver como lo muestro posiblemente led
   
    output logic Cout// ver como es posible mostrarlo
 );
    logic [width-1:0] sra;
    logic [width-1:0] sla;
    logic [width-1:0] slf;
    logic [width-1:0] srf;
    
    assign sla = A << B;
    assign sra = A >> B;
    assign srf = {width {ALUFlagIn}} << width - B;
    assign slf = {width {ALUFlagIn}} >> width - B;
    always@* begin
        ALUResult=0;
        Z=0;
        Cout=0;
        case(ALUcontrol) 
            4'b0000: // and
            
                ALUResult = A & B;
                
            4'b0001: //or
            
                ALUResult = A | B;
                
            4'b0010: //suma
            
               {Cout,ALUResult} = A + B + ALUFlagIn;//ALUFlagIN es un Cin
                
            4'b0011: //incremento uno
            
                if (ALUFlagIn == 0) begin
                  {Cout,ALUResult} = A + 1;
                end
                else 
                    if (ALUFlagIn == 1) begin
                        {Cout,ALUResult} = B + 1;
                    end
                    
            4'b0100: //decremento uno
            
                if (ALUFlagIn == 0) begin
                     ALUResult = A - 1;
                end
                else 
                 if (ALUFlagIn == 1) begin
                     ALUResult = B - 1;
                end
                
            4'b0101: //not
            
                if (ALUFlagIn == 0) begin
                    ALUResult = ~A;
                end
                else 
                    if (ALUFlagIn == 1) begin
                        ALUResult = ~B;
                    end
                    
            4'b0110: //resta
            
                {Cout,ALUResult} = A - B + ALUFlagIn;//duda con el Cin = ALUFlagIn
                 
            4'b0111: //xor
            
                ALUResult = A ^ B;
               
            4'b1000://corrimiento derecha
                     ALUResult [width-1:0] = srf | sra;
             
           
                      
            4'b1001://corrimiento izquierda
                     ALUResult [width-1:0] = slf | sla;
                    
                 
        endcase  
               
     if ( ALUResult==0) begin
        Z=1;
     end
     else begin
        Z=0;
     end
   end
endmodule

