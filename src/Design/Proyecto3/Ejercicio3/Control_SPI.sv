`timescale 1ns / 1ps

module Control_SPI
    (
        input logic         clk_i,
        input logic         rst_i,
        input logic         unbyte_i,
        input logic         rd_i,
        
        output logic        cs_o,
        output logic        rst_o,
        output logic        en_unbyte_o,
        output logic [1:0]  ctrl_MOSI_o,
        output logic [1:0]  ctrl_MISO_o,
        output logic        we_o
    );
    
    typedef enum
        {
            inicio,
            rev_cs,
            inicio_ciclo,
            rev_unbyte,
            write_reg,
            fin 
        } state_t;
        
    state_t state_reg,
            state_next;
            
    always_ff @(posedge clk_i, posedge rst_i)
        if(rst_i)
            state_reg <= inicio;
        else
            state_reg <= state_next;
            
    always_comb begin
        state_next = state_reg;
        unique case (state_next)
            inicio: begin
                rst_o           = 1'b0;
                en_unbyte_o     = 1'b0;
                ctrl_MOSI_o     = 2'b10;
                ctrl_MISO_o     = 2'b10;
                we_o            = 1'b0;
                cs_o            = 1'b1;
                
                state_next = rev_cs;
            end
            
            rev_cs: begin
                rst_o           = 1'b0;
                en_unbyte_o     = 1'b0;
                ctrl_MOSI_o     = 2'b10;
                ctrl_MISO_o     = 2'b10;
                we_o            = 1'b0;
                cs_o            = 1'b1;
                
                if (rd_i)
                    state_next = inicio_ciclo;
                else
                    state_next = inicio;
            end
            
            inicio_ciclo: begin
                rst_o           = 1'b0;
                en_unbyte_o     = 1'b0;
                ctrl_MOSI_o     = 2'b10;
                ctrl_MISO_o     = 2'b01;
                we_o            = 1'b0;
                cs_o            = 1'b0;
                
                state_next = rev_unbyte; 
            end
            
            rev_unbyte: begin
                rst_o           = 1'b0;
                en_unbyte_o     = 1'b1;
                ctrl_MOSI_o     = 2'b10;
                ctrl_MISO_o     = 2'b00;
                we_o            = 1'b0;
                cs_o            = 1'b0;
                
                if (unbyte_i)
                    state_next = write_reg;
                else
                    state_next = inicio_ciclo;  
            end
            
            write_reg: begin
                rst_o           = 1'b0;
                en_unbyte_o     = 1'b0;
                ctrl_MOSI_o     = 2'b10;
                ctrl_MISO_o     = 2'b01;
                we_o            = 1'b1;
                cs_o            = 1'b1;
                
                state_next = fin;
            end
            
            fin: begin
                rst_o           = 1'b1;
                en_unbyte_o     = 1'b0;
                ctrl_MOSI_o     = 2'b00;
                ctrl_MISO_o     = 2'b00;
                we_o            = 1'b0;
                cs_o            = 1'b1;
                
                state_next = inicio;
            end
            
        endcase
    end
        
endmodule
