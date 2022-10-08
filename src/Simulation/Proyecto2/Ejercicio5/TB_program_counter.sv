`timescale 1ns / 1ps

module TB_program_counter;
    parameter width=4;
    logic clk_100MHz, reset;
    logic [width-1:0] jumpdir;
    logic [1:0] PC_op_i;
    logic [width-1:0] PC_o, PC_inc_o;
    logic [width-1:0] aux;
    logic [width-1:0] aux2;
    
    program_counter #(.width(width)) U0(
                        .clk_i    (clk_100MHz),
                        .reset_i  (reset),
                        .PC_i   (jumpdir),
                        .PC_op_i    (PC_op_i),
                        .PC_o   (PC_o),
                        .PC_inc_o   (PC_inc_o)
                        );
                        
always begin
     #5 clk_100MHz=~clk_100MHz;
end
     
initial begin
    aux=0;
    aux2=0;
    clk_100MHz=0;
    reset=1;
    jumpdir=4'b0000;
    
    PC_op_i=2'b00;
    repeat(3)begin
    @(posedge clk_100MHz);
    #1;
    end
    aux = PC_o;
    if(aux != 0)
            $display("[DISPLAY1a] ¡ERROR! %b != %b", aux, 0);
            
    PC_op_i=2'b10;
  
    repeat(3)begin
    @(posedge clk_100MHz);
    #1;
    aux = PC_o;
    end
    
    if((aux+ 4'b0100) != (PC_o + 4'b0100) )
             $display("[DISPLAY3a] ¡ERROR! %b != %b", aux , PC_o);
             
    jumpdir= 4'b0010;
    
    @(posedge clk_100MHz);
    #1
    aux = PC_o;
    PC_op_i=2'b11;
    
    repeat(2)begin
    @(posedge clk_100MHz);
    #1;
    end
    aux2 = PC_o;
    if(PC_inc_o != ( aux2 + 4'b0100) )
             $display("[DISPLAY4] ¡ERROR! %b != %b", PC_inc_o , (PC_o+4'b0100));
    if(aux2 != jumpdir )
             $display("[DISPLAY4.1] ¡ERROR! %b != %b", aux2 , jumpdir);
    PC_op_i=2'b10;
    repeat(2)begin
    @(posedge clk_100MHz);
    #1;
    aux = PC_o;
    end
    
    if((aux + 4'b0100) != (PC_o + 4'b0100) )
             $display("[DISPLAY3b] ¡ERROR! %b != %b", (aux + 4'b0100) , (PC_o+4'b0100));
    
    aux = PC_o;
    PC_op_i=2'b01;
    repeat(2)begin
    @(posedge clk_100MHz);
    #1;
    aux2 = PC_o;
    end
    
    if(aux2 != aux)
             $display("[DISPLAY2] ¡ERROR! %b != %b", aux2, aux);
             
             
    PC_op_i=2'b00;
    repeat(2)begin
    @(posedge clk_100MHz);
    #1;
    end
    aux = PC_o;
    if(aux != 0)
            $display("[DISPLAY1b] ¡ERROR! %b != %b", aux, 0);
            
    PC_op_i=2'b10;
    repeat(2)begin
    @(posedge clk_100MHz);
    #1;
    aux = PC_o;
    end
    if((aux+ 4'b0100) != (PC_o + 4'b0100) )
             $display("[DISPLAY3c] ¡ERROR! %b != %b",(aux+ 4'b0100) , (PC_o+4'b0100));
    #10
    $finish;
end

endmodule

