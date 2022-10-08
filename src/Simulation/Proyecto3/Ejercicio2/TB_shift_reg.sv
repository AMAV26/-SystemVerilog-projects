`timescale 1ns / 1ps

module TB_shift_reg();


    parameter N      = 8,
              PERIOD = 50;
    

    
    logic             clk_i;
    logic             rst_i;
    logic             MISO_i;
    logic  [31: 0]    reg_ctrl_i;
    logic  [31: 0]    reg_data_i;
       
    logic            MOSI_o;
    logic            WR2_ctrl_o;
    logic            WR2_data_o;
    logic [5:  0]    addr_o;
    logic [31: 0]    reg_ctrl_o;
    logic [31: 0]    reg_data_o;
    
    
    
    Top_SPI_Master DUT_TSPIM
    (
        .clk_i          (clk_i),
        .rst_i          (rst_i),
        .MISO_i         (~MOSI_o),
        .reg_ctrl_i     (reg_ctrl_i),
        .reg_data_i     (reg_data_i),
        .MOSI_o         (MOSI_o),
        .WR2_ctrl_o     (WR2_ctrl_o),
        .WR2_data_o     (WR2_data_o),
        .addr_o         (addr_o),
        .reg_ctrl_o     (reg_ctrl_o),
        .reg_data_o     (reg_data_o)
    );
    
    always #PERIOD clk_i=~clk_i;
    
    initial  begin
    
        clk_i = 1'b1;
        rst_i = 1'b1;
        #(PERIOD*2);
        rst_i = 1'b0;
        reg_ctrl_i = 32'b000000_0000000000_000_000000000_0_0_0_1;
        reg_data_i = 32'h0000AA;
        
    end
    
    
     


endmodule
