`timescale 1ns / 1ps
module contador_prueba(
    input logic         clk_i, 
    input logic         rst_n_i, 
    input logic         en_i, 
    output logic [7:0]  conta_o);

//para detectar el flanco de la se?al en_i
logic [1:0] registro_en_r;

always_ff@(posedge clk_i) begin
    registro_en_r <= {registro_en_r[0], en_i};
end

always_ff@(posedge clk_i) begin
    if(!rst_n_i) conta_o <= 0;
    else begin
       //detectando s?lo el flanco positivo de en_i 
       if(registro_en_r == 2'b01) conta_o <= conta_o + 8'd1;
    end
end

endmodule