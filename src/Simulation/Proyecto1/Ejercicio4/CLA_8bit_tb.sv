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


module CLA_8bit_tb();
    parameter ANCHO = 8;
    logic clk;
    logic [1:0] cin;
    logic [ANCHO:0] s, a, b;
    logic cout;
    assign resultado = a + b + cin;
    CLA_8bit CLA_DUT (.a(a[ANCHO-1:0]), .b(b[ANCHO-1:0]), .cin(cin), .s(s[ANCHO-1:0]), .cout(cout));
    initial begin
        for (a = 1'b0; a <= {ANCHO{1'b1}}; a = a + 1'b1) begin
        
            for (b = 1'b0; b <= {ANCHO{1'b1}}; b = b + 1'b1) begin
            
               for (cin = 2'b00; cin < 2'b10; cin = cin + 1'b1) begin
                #0.01;
                
                if (resultado == {cout, s[ANCHO-1:0]})
                    $display ("[$display] Correct %b == %b%b time = %0t", resultado, cout, s[ANCHO-1:0], $time);
                    
                else
                    $display ("[$display] Inorrect %b != %b%b time = %0t", resultado, cout, s[ANCHO-1:0], $time);
                    
                    break;
                end
             end
        end
     end
endmodule
