`timescale 1ns / 1ps

module clk_divider_2seg #(parameter div = 28'd20_000_000)
(
input logic clk_i,
output logic clk_o
    );
    
    logic [27:0] cnt = 28'd0;
    always @(posedge clk_i) begin
        cnt <= cnt + 28'd1;
    if(cnt >= (div - 1))
        cnt <= 28'd0;
    clk_o <= (cnt < div / 2) ? 1'b1 : 1'b0;
    end
    
endmodule
