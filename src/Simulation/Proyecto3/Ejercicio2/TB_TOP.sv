`timescale 1ns / 1ps

module TB_TOP();
    
    parameter PERIOD = 5;

    logic            CLK_100MHZ;
    logic            wr_i;
    logic            reg_sel_i;
    logic  [31:0]    entrada_i;
    logic  [7:0]     addr_in;
    logic            ram_sel_data;
    logic            ram_sel_addr;
    logic            ram_sel_wr;
      
    logic [31:0]    salida_o;
    
    always #PERIOD CLK_100MHZ=~CLK_100MHZ;
    
    TOP DUT_TOP
    (
        .CLK_100MHZ   (CLK_100MHZ),
        .wr_i           (wr_i),
        .reg_sel_i      (reg_sel_i),
        .entrada_i      (entrada_i),
        .addr_in        (addr_in),
        .ram_sel_data   (ram_sel_data),
        .ram_sel_addr   (ram_sel_addr),
        .ram_sel_wr     (ram_sel_wr),
        .salida_o       (salida_o)    
    );
    
    initial begin
        CLK_100MHZ    = 1'b1;
        #2395;
        
        
        wr_i            = 1'b1;
        reg_sel_i       = 1'b1;
        entrada_i       = 32'h000000AA;
        addr_in         = 8'b0000_0000;
        ram_sel_data    = 1'b1;
        ram_sel_addr    = 1'b1;
        ram_sel_wr      = 1'b1;
        #(PERIOD*20);
        
        wr_i            = 1'b1;
        reg_sel_i       = 1'b1;
        entrada_i       = 32'h000000BB; //1011_1011 => 0100_0100
        addr_in         = 8'b0000_0001;
        ram_sel_data    = 1'b1;
        ram_sel_addr    = 1'b1;
        ram_sel_wr      = 1'b1;
        #(PERIOD*20);
        
        wr_i            = 1'b1;
        reg_sel_i       = 1'b1;
        entrada_i       = 32'h000000CC; // 1100_1100 => 0011_0011
        addr_in         = 8'b0000_0010;
        ram_sel_data    = 1'b1;
        ram_sel_addr    = 1'b1;
        ram_sel_wr      = 1'b1;
        #(PERIOD*20);
        
        wr_i            = 1'b1;
        reg_sel_i       = 1'b0;
        entrada_i       = 32'b000000_0000000000_000_000000010_0_0_0_1;
        addr_in         = 8'b0000_0000;
        ram_sel_data    = 1'b0;
        ram_sel_addr    = 1'b0;
        ram_sel_wr      = 1'b0;
        #(PERIOD*20);
        
        wr_i            = 1'b0;
        #(PERIOD*20);
        
        #(PERIOD*20000);    
    
    end
    
endmodule