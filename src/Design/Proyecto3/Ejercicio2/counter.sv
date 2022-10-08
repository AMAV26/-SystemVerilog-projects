`timescale 1ns / 1ps

module counter
    (
        input logic             en_i,
        input logic  [8:0]     count_i,
        
        output logic            flag_o,
        output logic [27:0]     count_o
    );
    
    logic [27:0] counter = 28'd0;
    logic        bandera = 1'b0;
    
    always_ff @(posedge en_i) begin
        counter <= counter + 28'd1;
        bandera <= 1'b0;
        if (counter == count_i) begin
            counter <= 28'd0;
            bandera <= 1'b1;
        end    
    end
    
    assign count_o = counter;
    assign flag_o  = bandera;
    
endmodule
