`timescale 1ns / 1ps

module dmux1a2 
    (
        input logic EN_i,
        input logic  sel_i,
            
        output logic reg1_o,
        output logic reg2_o
    );
    
    always_comb begin
        unique case (sel_i)
            0: begin 
                reg1_o = EN_i; 
                reg2_o = 1'b0;
            end
            
            1: begin 
                reg2_o = EN_i; 
                reg1_o = 1'b0;
            end
        endcase
    
    end
    
endmodule