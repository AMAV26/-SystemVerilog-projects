`timescale 1ns / 1ps

module display_7seg(
input logic clk_i,
input logic [3:0] data_i,
output logic [0:6]seg_o,
output logic [3:0] an_o
    );
assign an_o = 4'b1110; 

always @*
                 
                case(data_i)     
                
                 4'b0000: seg_o = 7'b000_0001; // 0
                 4'b0001: seg_o = 7'b100_1111; // 1
                 4'b0010: seg_o = 7'b001_0010; // 2
                 4'b0011: seg_o = 7'b000_0110; // 3
         
             
                 4'b0100: seg_o = 7'b100_1100; // 4
                 4'b0101: seg_o = 7'b010_0100; // 5
                 4'b0110: seg_o = 7'b010_0000; // 6
                 4'b0111: seg_o = 7'b000_1111; // 7
            
               
                 4'b1000: seg_o = 7'b000_0000; // 8
                 4'b1001: seg_o = 7'b000_0100; // 9
                 4'b1010: seg_o = 7'b000_1000; // A
                 4'b1011: seg_o = 7'b110_0000;  // B
               
                 4'b1100: seg_o = 7'b111_0010; // C
                 4'b1101: seg_o = 7'b100_0010; // D
                 4'b1110: seg_o = 7'b011_0000; // E
                 4'b1111: seg_o = 7'b011_1000; // F
                 endcase
    
endmodule
