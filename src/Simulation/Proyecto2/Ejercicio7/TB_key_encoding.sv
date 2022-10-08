`timescale 1ns / 1ps
module TB_key_encoding;
//logic clk_i;
//logic  data_available;//no estoy seguro de si esto lleva esto
logic  [4:0] dato_i;
logic  [15:0] dato_o;

key_encoding a1(
//data_available
dato_i,
dato_o
);

initial begin
//clk_i=0;
//data_available=1;
dato_i = 4'b0000;
#10;
dato_i = 4'b0001;
#10;
dato_i = 4'b0010;
#10;
dato_i = 4'b0011;
#10;
dato_i = 4'b0100;
#10
$finish;
end
/*
initial begin
 clk_i = 0;
 forever #10 clk_i = ~clk_i;
 end
*/

endmodule
