`timescale 1ns / 1ps

module Control_SPI
    (
        input logic         clk_i,
        input logic         rst_i,
        input logic         send_i,
        input logic         unbyte_i,
        input logic         fin_i,
        
        output logic        WR2_ctrl,
        output logic        WR2_data,
        output logic        send_o,
        output logic        rst_o,
        output logic [1:0]  ctrl_MOSI,
        output logic [1:0]  ctrl_MISO,
        output logic        en_unbyte,
        output logic        en_fin  
    );
    
    typedef enum
        {
            inicio,
            rev_send,
            inicio_ciclo,
            rev_unbyte,
            wait_1,
            rev_termino,
            termino
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
                WR2_ctrl    = 1'b0;
                WR2_data    = 1'b0;
                send_o      = 1'b0;
                rst_o       = 1'b0;
                ctrl_MOSI   = 2'b10;
                ctrl_MISO   = 2'b10;
                en_unbyte   = 1'b0;
                en_fin      = 1'b0;
                
                state_next  = rev_send;
            end
            
            rev_send: begin
                WR2_ctrl    = 1'b0;
                WR2_data    = 1'b0;
                send_o      = 1'b0;
                rst_o       = 1'b0;
                ctrl_MOSI   = 2'b10;
                ctrl_MISO   = 2'b01;
                en_unbyte   = 1'b0;
                en_fin      = 1'b0;
                
                if (send_i)
                    state_next  = inicio_ciclo; 
                
                else
                    state_next  = inicio;   
            
            end
            
            inicio_ciclo: begin
                WR2_ctrl    = 1'b0;
                WR2_data    = 1'b0;
                send_o      = 1'b0;
                rst_o       = 1'b0;
                ctrl_MOSI   = 2'b01;
                ctrl_MISO   = 2'b01;
                en_unbyte   = 1'b1;
                en_fin      = 1'b0;
                
                state_next  = rev_unbyte;
            
            end
            
            rev_unbyte: begin
                WR2_ctrl    = 1'b0;
                WR2_data    = 1'b1; //0
                send_o      = 1'b0;
                rst_o       = 1'b0;
                ctrl_MOSI   = 2'b00;
                ctrl_MISO   = 2'b00;
                en_unbyte   = 1'b0;
                en_fin      = 1'b0;
                
                if (unbyte_i)
                    state_next  = wait_1; 
                
                else
                    state_next  = inicio_ciclo; 
            
            end
            
            wait_1: begin
                WR2_ctrl    = 1'b0;
                WR2_data    = 1'b0; //0
                send_o      = 1'b0;
                rst_o       = 1'b0;
                ctrl_MOSI   = 2'b00;
                ctrl_MISO   = 2'b00;
                en_unbyte   = 1'b0;
                en_fin      = 1'b0;
                state_next  = rev_termino;
                
                 
            
            end
            
            rev_termino: begin
                WR2_ctrl    = 1'b0;
                WR2_data    = 1'b0; //0
                send_o      = 1'b0;
                rst_o       = 1'b0;
                ctrl_MOSI   = 2'b00;
                ctrl_MISO   = 2'b00;
                en_unbyte   = 1'b0;
                en_fin      = 1'b1;
                
                if (fin_i)
                    state_next  = termino; 
                
                else
                    state_next  = inicio;
            
            end
            
            termino: begin
                WR2_ctrl    = 1'b1;
                WR2_data    = 1'b0;
                send_o      = 1'b0;
                rst_o       = 1'b1;
                ctrl_MOSI   = 2'b00;
                ctrl_MISO   = 2'b00;
                en_unbyte   = 1'b0;
                en_fin      = 1'b0;
                
                state_next  = inicio;
            
            end
        endcase
    
    end
    
    
endmodule