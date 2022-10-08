`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.08.2022 18:09:17
// Design Name: 
// Module Name: Full_Adder
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


module Full_Adder(
    input   a1,
    input   b1,
    input   cin1,
    output  s1,
    output  cout1
    );
    
   assign   s1 = a1 ^ b1 ^ cin1;
   assign cout1 = a1 & b1 | a1 & cin1 | b1 & cin1;
  
endmodule



