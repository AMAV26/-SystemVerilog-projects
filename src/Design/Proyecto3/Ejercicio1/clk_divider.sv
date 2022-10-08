`timescale 1ns / 1ps

module clk_divider#(parameter div =10)(
    input logic clk_10MHz_i,
    output logic clk_div_o
    );
    
    logic [27:0] counter;
    
    // Initialization
    initial begin
        counter = 0;
        clk_div_o = 0;
    end
    
    always @(posedge clk_10MHz_i) begin
        if(counter == div) begin
            counter <= 0;
            clk_div_o = ~clk_div_o;
        end
        else
            counter = counter + 1;
    end
endmodule
