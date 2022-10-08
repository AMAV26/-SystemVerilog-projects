`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.08.2022 17:29:19
// Design Name: 
// Module Name: RCA_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module RCA_tb();
    parameter ANCHO = 8;
    logic clk;
    logic [1:0] cin2;
    logic [ANCHO:0] s2, a2, b2, resultado;
    logic cout2;
    assign resultado = a2 + b2 + cin2;
    
    RCA RCA_DUT (.a2(a2[ANCHO-1:0]), .b2(b2[ANCHO-1:0]), .cin2(cin2[0]), .s2(s2[ANCHO-1:0]), .cout2(cout2));
    initial begin
        for (a2 = 1'b0; a2 <= {ANCHO{1'b1}}; a2 = a2 + 1'b1) begin
        
            for (b2 = 1'b0; b2 <= {ANCHO{1'b1}}; b2 = b2 + 1'b1) begin
            
               for (cin2 = 2'b00; cin2 < 2'b10; cin2 = cin2 + 1'b1) begin
                #0.01;
                
                if (resultado == {cout2, s2[ANCHO-1:0]})
                    $display ("[$display] Correct %b == %b%b time = %0t", resultado, cout2, s2[ANCHO-1:0], $time);
                    
                else
                    $display ("[$display] Inorrect %b != %b%b time = %0t", resultado, cout2, s2[ANCHO-1:0], $time);
                    
                    break;
                end
             end
        end
     end
endmodule
