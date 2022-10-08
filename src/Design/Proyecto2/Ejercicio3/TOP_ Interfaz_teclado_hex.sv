`timescale 1ns / 1ps

module TOP_interfaz_teclado_hex 
    (
        input logic           CLK_100MHZ,
        //input logic           data_available,
        input logic [5:0]     JB,//PMOD/ del circuito a la fpga// Nor
        input logic [15:0]    sw,
             
        output logic [7:0]    JC,//PMod
        output logic [3:0]    an,
        output logic [6:0]    seg,
        output logic [15:0]   LED
    );
    
    logic CLK_1KHZ;
    logic CLK_10MHZ;
    logic [1:0] count_2b = 2'b00;
    logic [3:0] teclado;
    logic [3:0] ke_tec;
    logic db_btn_o;
    
    
    clk_wiz_0 Reloj
    (
        .CLK_10MHZ    (CLK_10MHZ),     
        .clk_in1      (CLK_100MHZ)
    );
    
    antirebotes_sinc ANTIREBOTES
    (
        .clk_i       (CLK_10MHZ),
        .btn_i       (JB[0]), //jb=1 preesiono boton
        .rst_i       (sw[0]),
        
        .db_btn_o    (db_btn_o) 
    );
    
    reg_tec RegistroTeclado
    (
        .clk_i      (CLK_10MHZ),
        .en_i       (JB[0]),
        .data_i     ({JB[2:1],count_2b}),
        
        .data_o     (teclado)
    );
    
    key_encoding KeyEnc
    (
        //.data_available_i   (data_available),   
        .dato_i           (teclado),//entrada de 4 bits
        .dato_o           (ke_tec)//salida de 16 bits
    );
    
    clk_divider1KHz DivClk_1khz
    (
        .clk_i     (CLK_10MHZ),
        .clk_1KHZ_o    (CLK_1KHZ)
    );
    
    display_7seg Disp_7seg
    (
        .clk_i     (CLK_1KHZ),
        .data_i    (ke_tec),
        .an_o      (an),
        .seg_o     (seg)
    );     
    
    
    always @(posedge CLK_10MHZ) begin//al contador le entra el reloj de 1KHz o el de 10MHz
        if (JB[0])
            count_2b <= count_2b + 1'b0;     
        else
            count_2b <= count_2b + 1'b1;
    end
    
    always @(posedge CLK_10MHZ) begin
        JC[1:0] <= count_2b;
        JC[3:2] <= count_2b;
        LED[0] <= JB[0];
        LED[1] <= db_btn_o; 
    end    
    
endmodule    