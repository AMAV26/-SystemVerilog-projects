`timescale 1ns / 1ps


module TB_selector_velocidades;
    logic clk_100MHz_i;
    logic clk_10MHz;
    logic [1:0]sel_velocidad;
    logic velocidad_sal;
    logic [2:0]LED;
    
            clk_wiz_0 instance_name(
                .clk_10MHz      (clk_10MHz),     
                .clk_in1        (clk_100MHz_i)
            );
            selector_velocidades Vel_selmux(
                .clk_10MHz_i (clk_10MHz),
                .sel_velocidad_i (sel_velocidad),
                .LED_o              (LED),
                .velocidad_sal_o(velocidad_sal)
                
            );
initial begin
        #2395;
        sel_velocidad=2'b00;
        #1500
        sel_velocidad=2'b01;
        #1500
        sel_velocidad=2'b10;
        #1500                                                                                                    
        $finish;
end

initial begin
         clk_100MHz_i = 0;
         forever #5  clk_100MHz_i = ~clk_100MHz_i;
end

endmodule
