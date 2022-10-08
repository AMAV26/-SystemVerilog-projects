`timescale 1ns / 1ps

module TB_SUPER_TOP();

    parameter PERIOD = 5;
        
    logic            CLK_100MHZ;
    logic [15: 0]    sw;
    logic [3 : 0]    an;
    logic [6 : 0]    seg;
    logic [15: 0]    LED;
    
    always #PERIOD CLK_100MHZ=~CLK_100MHZ;
   
    
    Super_Top DUT_SUPER_TOP
    (
        .CLK_100MHZ (CLK_100MHZ),
        .sw         (sw),
        .an         (an),
        .seg        (seg),
        .LED        (LED)
    );
    
    initial begin
        CLK_100MHZ = 1'b1;
        #2395;
        
        sw = 16'b0000_0000_0000_0010;
        
        #(PERIOD*3000);
        sw = 16'b0000_0000_0000_0000;
        
    
    end

endmodule
