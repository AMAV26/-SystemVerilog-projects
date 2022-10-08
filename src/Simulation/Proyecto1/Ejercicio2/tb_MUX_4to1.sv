`timescale 1ns / 1ps

module tb_MUX_4to1();

    logic [1:0]  sel_i;
    logic [3:0]  a_i;
    logic [3:0]  b_i;
    logic [3:0]  c_i;
    logic [3:0]  d_i;
    logic [3:0]  y_o;
    int          A;
    int          B;
    int          C;
    int          D;
    MUX_4to1 MUX_DUT 
    (
    .sel (sel_i),
    .D0 (a_i), 
    .D1  (b_i), 
    .D2  (c_i), 
    .D3  (d_i),
    .Y  (y_o)
    );


    initial begin

    sel_i = 2'b00;
    #5;
    for (A=0; A < 50; A = A + 1) begin

        a_i = $random();
        b_i = $random();
        c_i = $random();
        d_i = $random();
        #1;
        if (y_o == a_i) 
            $display("[DISPLAY] ¡Correcto! Y:%b = A:%b", y_o, a_i);
        else
            $display("[DISPLAY] ¡Incorrecto! Y:%b != A:%b", y_o, a_i);

    end

    sel_i = 2'b01;
    #5;
    for (B=0; B < 50; B = B + 1) begin

        a_i = $random();
        b_i = $random();
        c_i = $random();
        d_i = $random();
        #1;
        if (y_o == b_i) 
            $display("[DISPLAY] ¡Correcto! Y:%b = B:%b", y_o, b_i);
        else
            $display("[DISPLAY] ¡Incorrecto! Y:%b != B:%b", y_o, b_i);

    end

    sel_i = 2'b10;
    #5;
    for (C=0; C < 50; C = C + 1) begin

        a_i = $random();
        b_i = $random();
        c_i = $random();
        d_i = $random();
        #1;
        if (y_o == c_i) 
            $display("[DISPLAY] ¡Correcto! Y:%b = C:%b", y_o, c_i);
        else
            $display("[DISPLAY] ¡Incorrecto! Y:%b != C:%b", y_o, c_i);

    end    

    sel_i = 2'b11;
    #5;
    for (D=0; D < 50; D = D + 1) begin

        a_i = $random();
        b_i = $random();
        c_i = $random();
        d_i = $random();
        #1;
        if (y_o == d_i) 
            $display("[DISPLAY] ¡Correcto! Y:%b = D:%b", y_o, d_i);
        else
            $display("[DISPLAY] ¡Incorrecto! Y:%b != D:%b", y_o, d_i);

    end    

    end
    
endmodule