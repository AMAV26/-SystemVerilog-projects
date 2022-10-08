`timescale 1ns / 1ps

module digitos(
    input clk_10Hz,
    input reset,
    output reg [3:0] unidades
    );
    //registro de control para unidades
    always@ (posedge clk_10Hz or posedge reset)
        if(reset)
            unidades <= 0;
        else
            if(unidades == 4)
                unidades <= 0;
            else
                unidades <= unidades + 1;
endmodule
