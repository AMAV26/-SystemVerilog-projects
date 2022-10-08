`timescale 1ns / 1ps

module TB_Dmux_elegir_reg;
        logic clk_10MHz;
        logic clk_100MHz_i;
        logic [15:0] sw_i;
        logic EN_i;
        logic  sel_i;
            
        logic [15:0]reg1_o;
        logic [15:0]reg2_o;
clk_wiz_0 instance_name(
            .clk_10MHz      (clk_10MHz),     
            .clk_in1        (clk_100MHz_i)
        );

dmux1a2 Elegir_reg_escribir (
            .clk_10MHz_i (clk_10MHz),
            .sw_i(sw_i),
            .EN_i(EN_i),
            .sel_i(sel_i),
                
            .reg1_o(reg1_o),
            .reg2_o(reg2_o)
);
initial begin
    #2395;
    sw_i = 16'b1000000000000000;
    sel_i=1;
    EN_i=1;
    #100;
    sw_i = 16'b1000000000000001;
    sel_i=0;
    EN_i=1;
    #100;
    sw_i = 16'b0000000000000000;
    sel_i=1;
    EN_i=1;
    #100;
    sw_i = 16'b1111111111111111;
    sel_i=0;
    EN_i=1;
end

initial begin
         
         clk_100MHz_i = 0;
         forever #5  clk_100MHz_i = ~clk_100MHz_i;
end
endmodule
