`timescale 1ns / 1ps


module TB_clk_divider;
    logic clk_100MHz_i;
    logic clk_10MHz;
    logic clk_medio_s;
        clk_wiz_0 instance_name(
                        .clk_10MHz      (clk_10MHz),     
                        .clk_in1        (clk_100MHz_i)
                    );
        clk_divider #( .div (5)) Medio_seg
            (
                .clk_10MHz_i     (clk_10MHz),
                .clk_div_o    (clk_medio_s)
            );

initial begin
         
         clk_100MHz_i = 0;
         forever #5  clk_100MHz_i = ~clk_100MHz_i;
end
endmodule
