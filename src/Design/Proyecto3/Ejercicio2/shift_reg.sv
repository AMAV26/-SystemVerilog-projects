`timescale 1ns / 1ps

module shift_reg
    #(parameter N = 8)
    (
        input logic clk_i,
        input logic rst_i,
        input logic s_i,
        input logic [1:0] ctrl_i,
        input logic [N-1:0] d_i,
        
        output logic [N-1:0] q_o,
        output logic s_o
    );
    
    logic [N-1:0] r_reg, r_next;
    
    always_ff @(posedge clk_i, posedge rst_i)
        if(rst_i)
            r_reg <= 'b0;
            
        else 
            r_reg <= r_next;
            
    always_comb
        unique case (ctrl_i)
            2'b00: r_next = r_reg;
            2'b01: r_next = {s_i, r_reg[N-1:1]};
            2'b10: r_next = d_i;
        endcase
        
    assign q_o = r_reg;
    assign s_o = r_reg[0];
endmodule
