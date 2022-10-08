`timescale 1ns / 1ps

module TB_RAM();
    parameter PERIOD = 50;
    
    logic [5:0] a;
    logic [31:0] d;
    logic CLK_10MHZ;
    logic we;
    logic [31:0] spo;
    
    
    always #PERIOD CLK_10MHZ=~CLK_10MHZ;


    
    dist_mem_gen_0 your_instance_name 
    (
        .a       (a),      // input wire [5 : 0] a
        .d       (d),      // input wire [31 : 0] d
        .clk     (CLK_10MHZ),  // input wire clk
        .we      (we),    // input wire we
        .spo     (spo)  // output wire [31 : 0] spo
    );
   
    initial begin
    CLK_10MHZ = 1'b1;
    we = 1'b1;
    a = 6'b000000;
    d = 32'hAAAAAAAA;
    #(PERIOD*2);
    
    a = a + 1'b1;
    d = 32'hBBBBBBBB;
    #(PERIOD*2);
    
    a = a + 1'b1;
    d = 32'hCCCCCCCC;
    #(PERIOD*2);
    
    a = a + 1'b1;
    d = 32'hDDDDDDDD;
    #(PERIOD*2);
    
    a = a + 1'b1;
    d = 32'hEEEEEEEE;
    #(PERIOD*2);
    
    a = a + 1'b1;
    d = 32'hFFFFFFFF;
    #(PERIOD*2);
    
    a = a + 1'b1;
    d = 32'h11111111;
    #(PERIOD*2);
    
    we = 1'b0;
    a = 6'b000000;
//    d = 32'hAAAAAAAA;
    #(PERIOD*2);
    
    a = a + 1'b1;
//    d = 32'hBBBBBBBB;
    #(PERIOD*2);
    
    a = a + 1'b1;
//    d = 32'hCCCCCCCC;
    #(PERIOD*2);
    
    a = a + 1'b1;
//    d = 32'hDDDDDDDD;
    #(PERIOD*2);
    
    a = a + 1'b1;
//    d = 32'hEEEEEEEE;
    #(PERIOD*2);
    
    a = a + 1'b1;
//    d = 32'hFFFFFFFF;
    #(PERIOD*2);
    
    a = a + 1'b1;
//    d = 32'h11111111;
    #(PERIOD*2);
    
   
    end
    
endmodule
