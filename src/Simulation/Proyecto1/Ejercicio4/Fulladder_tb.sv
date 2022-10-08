`timescale 1 ns / 1 ps
module Fulladder_tb;

logic a1, b1, cin1;
logic s1, cout1;

Full_Adder DUT (.a1(a1), .b1(b1), .cin1(cin1), .s1(s1), .cout1(cout1));
initial begin
a1 = 1'b0;
b1 = 1'b0;
cin1 = 1'b0;
#50;

a1 = 1'b1;
b1 = 1'b0;
cin1 = 1'b0;
#25;

end
endmodule
