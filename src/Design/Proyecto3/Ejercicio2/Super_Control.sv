`timescale 1ns / 1ps

module Super_Control
    (
        input logic clk_i,
        input logic rst_i,
        input logic termino_i,
        
        output logic wr_i,
        output logic reg_sel_i,
        output logic [31:0] entrada_i,
        output logic [7:0] addr_in,
        output logic ram_sel_data,
        output logic ram_sel_addr,
        output logic ram_sel_wr,
        output logic termino_o
    );
    
    typedef enum
        {
            inicio,
            wr_ram_1,
            wr_ram_2,
            wr_ram_3,
            wr_ctrl_1,
            fin
        } state_t;
        
    state_t state_reg, 
            state_next;
            
    always_ff @(posedge clk_i, posedge rst_i) 
        if(rst_i)
            state_reg <= inicio;
        else    
            state_reg <= state_next;
            
    always_comb  begin
    
        state_next = state_reg;
        unique case (state_next)
            inicio: begin
                wr_i            = 1'b0;
                reg_sel_i       = 1'b0;
                entrada_i       = 32'h00000000;
                addr_in         = 8'b0000_0000;
                ram_sel_data    = 1'b1;
                ram_sel_addr    = 1'b1;
                ram_sel_wr      = 1'b1;
                termino_o       = 1'b0;
                
                
                state_next  = wr_ram_1; 
                
                
            
            end
            
            wr_ram_1: begin
                wr_i            = 1'b1;
                reg_sel_i       = 1'b1;
                entrada_i       = 32'h000000AA;
                addr_in         = 8'b0000_0000;
                ram_sel_data    = 1'b1;
                ram_sel_addr    = 1'b1;
                ram_sel_wr      = 1'b1;
                termino_o       = 1'b0;
                
                state_next      = wr_ram_2;
            
            end
            
            wr_ram_2: begin
                wr_i            = 1'b1;
                reg_sel_i       = 1'b1;
                entrada_i       = 32'h000000BB; //1011_1011 => 0100_0100
                addr_in         = 8'b0000_0001;
                ram_sel_data    = 1'b1;
                ram_sel_addr    = 1'b1;
                ram_sel_wr      = 1'b1;
                termino_o       = 1'b0;
                
                state_next      = wr_ram_3;
            end
            
            wr_ram_3: begin
                wr_i            = 1'b1;
                reg_sel_i       = 1'b1;
                entrada_i       = 32'h000000CC; // 1100_1100 => 0011_0011
                addr_in         = 8'b0000_0010;
                ram_sel_data    = 1'b1;
                ram_sel_addr    = 1'b1;
                ram_sel_wr      = 1'b1;
                termino_o       = 1'b0;
                
                state_next      = wr_ctrl_1;
            
            end
            
            wr_ctrl_1: begin
                wr_i            = 1'b1;
                reg_sel_i       = 1'b0;
                entrada_i       = 32'b000000_0000000000_000_000000010_0_0_0_1;
                addr_in         = 8'b0000_0000;
                ram_sel_data    = 1'b0;
                ram_sel_addr    = 1'b0;
                ram_sel_wr      = 1'b0;
                termino_o       = 1'b1;
                
                state_next      = fin;
            
            end
            
            fin: begin
                wr_i            = 1'b0;
                reg_sel_i       = 1'b0;
                entrada_i       = 32'h00000000;
                addr_in         = 8'b0000_0000;
                ram_sel_data    = 1'b0;
                ram_sel_addr    = 1'b0;
                ram_sel_wr      = 1'b0;
                termino_o       = 1'b0;
                
                
                state_next  = fin; 
                
                
            
            end
            
        endcase
    end
    
    
             
            
endmodule
