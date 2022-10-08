`timescale 1ns / 1ps

module Reg_Control 
    #(
        parameter N = 32
    )
    (
        input logic            clk_10MHz_i,
        input logic            rst_i,
        input logic [N-1:0]    In1,
        input logic [N-1:0]    In2,
        input logic            WR1,
        input logic            WR2,
        
        output logic [N-1:0]   Data_o
    );
    
    always @(posedge clk_10MHz_i) begin
        if (rst_i) 
            Data_o <= 'b0;
            
        else if (WR1) 
            Data_o <= In1;
            
        else if (WR2) 
            Data_o <= In2;  
            
        else 
            Data_o <= Data_o;
            
    end

endmodule