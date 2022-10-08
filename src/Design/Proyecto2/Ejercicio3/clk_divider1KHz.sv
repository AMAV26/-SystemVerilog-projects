`timescale 1ns / 1ps

module clk_divider1KHz(
input logic clk_i,
output logic clk_1KHZ_o
    );
logic [27:0] counter = 28'd0;
parameter divisor = 28'd10000;

always@(posedge clk_i) begin
    counter <= counter + 28'd1;
    if (counter >= (divisor-1))
        counter <= 28'd0;
    clk_1KHZ_o <= (counter < divisor/2)? 1'b1:1'b0;
end
endmodule
