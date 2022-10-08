`timescale 1ns / 1ps

module deco_to_7sgmentos_v3(
input logic [15:0] sw,
input logic btnL,
input logic btnR,
output logic [0:6]seg,
output logic [3:0] an
    );
    
logic [1:0] select;
logic [3:0] bcd;
assign select = {btnL, btnR};
assign an = 4'b1110; 

MUX_4to1 muxito(
.D0 (sw[15:12]), 
.D1 (sw[11:8]), 
.D2 (sw[7:4]), 
.D3 (sw[3:0]), 
.sel (select), 
.Y (bcd)
);

always @*
                 
                case(bcd)     
                
                 4'b0000: seg = 7'b000_0001;
                 4'b0001: seg = 7'b100_1111;
                 4'b0010: seg = 7'b001_0010;
                 4'b0011: seg = 7'b000_0110;
         
             
                 4'b0100: seg = 7'b100_1100;
                 4'b0101: seg = 7'b010_0100;
                 4'b0110: seg = 7'b010_0000;
                 4'b0111: seg = 7'b000_1111;
            
               
                 4'b1000: seg = 7'b000_0000;
                 4'b1001: seg = 7'b000_0100;
                 4'b1010: seg = 7'b000_1000;
                 4'b1011: seg = 7'b110_0000; 
               
                 4'b1100: seg = 7'b111_0010;
                 4'b1101: seg = 7'b100_0010;
                 4'b1110: seg = 7'b011_0000;
                 4'b1111: seg = 7'b011_1000;
                 endcase
    
endmodule