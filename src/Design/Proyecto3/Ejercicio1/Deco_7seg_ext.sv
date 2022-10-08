`timescale 1ns / 1ps


module Deco_7seg_ext (
    input logic          clk_i,
    input logic  [15:0]  hex_i,
    
    output logic [0:6]   seg_o,
    output logic [3:0]   an_o
    );
    
    logic [1:0] count_2b = 2'b00;
    logic [3:0] patito;
    always @(posedge clk_i) begin
            count_2b <= count_2b + 1'b1;
    end        
    always @(*) begin
        case (count_2b)
            2'b00:
                begin
                     an_o=4'b1110;
                     patito = hex_i[3:0];
                    
                end
        
            2'b01:
                begin
                    an_o=4'b1101;
                    patito = hex_i[7:4];
      
                end
        
            2'b10:
                begin
                    an_o = 4'b1011;
                    patito = hex_i[11:8];
                end
        
            2'b11:
                    begin
                        an_o = 4'b0111;
                        patito = hex_i [15:12];
                       
                    end
        endcase
    end
        always @(*) begin
        case (patito)
            4'h0: seg_o = 7'b0000001;
            4'h1: seg_o = 7'b1001111;
            4'h2: seg_o = 7'b0010010;
            4'h3: seg_o = 7'b0000110;
            4'h4: seg_o = 7'b1001100;
            4'h5: seg_o = 7'b0100100;
            4'h6: seg_o = 7'b0100000;
            4'h7: seg_o = 7'b0001111;
            4'h8: seg_o = 7'b0000000;
            4'h9: seg_o = 7'b0000100;
            4'ha: seg_o = 7'b0001000;
            4'hb: seg_o = 7'b1100000;
            4'hc: seg_o = 7'b0110001;
            4'hd: seg_o = 7'b1000010;
            4'he: seg_o = 7'b0110000;
            4'hf: seg_o = 7'b0111000;
        endcase
   end
endmodule
    