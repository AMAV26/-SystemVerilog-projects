`timescale 1ns / 1ps

module TOP
    (
        input logic             CLK_10MHZ,
        input logic             wr_i,
        input logic             sel_modo_i,
        input logic             reg_sel_i,
        input logic  [31: 0]    entrada_i,
        input logic  [7 : 0]    addr_in,
        input logic             ram_sel_data,
        input logic             ram_sel_addr,
        input logic             ram_sel_wr,
        
        output logic [3 : 0]    an_o,
        output logic [6 : 0]    seg_o,
        output logic [15: 0]    LED_o,
        output logic [31: 0]    salida_o 
    );
    
    logic           CLK_1KHZ;
    logic           CLK_1HZ;
    logic           MOSI_o;
    logic           cs_o;
    logic           WR2_ctrl_o;
    logic           WR2_data_o;
    logic           WR1_ctrl_o;
    logic           WR1_data_o;
    logic [31:0]    ram_data;
    logic [7:0]     ram_addr;
    logic [7:0]     modo_addr;
    logic [7:0]     super_addr;
    logic           ram_wr;
    logic [7:0]     address_o;
    logic [27:0]    count_addr;
    logic [31:0]    reg_ctrl_o;
    logic [31:0]    reg_ctrl_i;
    logic [31:0]    reg_data_o;
    logic [31:0]    reg_data_i;
    logic [31:0]    reg_data_mux;
    
    
    Clock_divider #(.DIVISOR(28'd10_000)) DivClk_1khz
    (
        .clock_in     (CLK_10MHZ),
        .clock_out    (CLK_1KHZ)
    );
    
    Clock_divider #(.DIVISOR(28'd10_000_000)) DivClk_1hz
    (
        .clock_in     (CLK_10MHZ),
        .clock_out    (CLK_1HZ)
    );
    
    dmux1a2  DEMUX
    (
        .EN_i           (wr_i),
        .sel_i          (reg_sel_i),    
        .reg1_o         (WR1_ctrl_o),
        .reg2_o         (WR1_data_o)
    );
    
    Mux_4a1 MUX_4A1
    (
        .all_1s_i(reg_ctrl_i[2]),
        .all_0s_i(reg_ctrl_i[3]),
        .data_i(reg_data_i),
        
        .dato_o(reg_data_mux)

    );
    
    Mux_2a1 #(.N(32)) MUX_SALIDA
    (
        .a_i            (reg_ctrl_i),
        .b_i            (reg_data_mux),
        .sel_i          (reg_sel_i),
        .c_o            (salida_o)
    );
    
    Mux_2a1 #(.N(32)) MUX_RAM_DATA
    (
        .a_i            (entrada_i),
        .b_i            (reg_data_o),
        .sel_i          (ram_sel_data),
        .c_o            (ram_data)
    );
    
    Mux_2a1 #(.N(8)) MUX_RAM_ADDR
    (
        .a_i            (addr_in),
        .b_i            (address_o),
        .sel_i          (ram_sel_addr),
        .c_o            (ram_addr)
    );
    
    Mux_2a1 #(.N(8)) MUX_MODO
    (
        .a_i            (ram_addr),
        .b_i            (modo_addr),
        .sel_i          (sel_modo_i),
        .c_o            (super_addr)
    );
    
    Mux_2a1 #(.N(1)) MUX_RAM_WRITE
    (
        .a_i            (WR1_data_o),
        .b_i            (WR2_data_o),
        .sel_i          (ram_sel_wr),
        .c_o            (ram_wr)
    );
    
    Top_SPI_Master SPI
    (
        .clk_i          (CLK_10MHZ),
        .rst_i          (1'b0),
        .MISO_i         (~MOSI_o),
        .reg_ctrl_i     (reg_ctrl_i),
        .reg_data_i     (reg_data_mux),
        .MOSI_o         (MOSI_o),
        .WR2_ctrl_o     (WR2_ctrl_o),
        .WR2_data_o     (WR2_data_o),
        .cs_o           (cs_o),
        .addr_o         (address_o),
        .reg_ctrl_o     (reg_ctrl_o),
        .reg_data_o     (reg_data_o)
    );
    
    Reg_Control REG_CTRL
    (
        .clk_10MHz_i    (CLK_10MHZ),
        .rst_i          (1'b0),
        .In1            (entrada_i),
        .In2            (reg_ctrl_o),
        .WR1            (WR1_ctrl_o),
        .WR2            (WR2_ctrl_o),
        .Data_o         (reg_ctrl_i)
    );
    
    dist_mem_gen_0 Reg_Data
    (
        .a              (super_addr),      
        .d              (ram_data),      
        .clk            (CLK_10MHZ),  
        .we             (ram_wr),    
        .spo            (reg_data_i)  
    );
    
    counter Count_Modo
    (
        .en_i           (CLK_1HZ),
        .count_i        (reg_ctrl_o[12:4]),
        .flag_o         (),
        .count_o        (count_addr)
    );
    
    display_7seg Disp_7seg
    (
        .clk_i     (CLK_1KHZ),
        .data_i    (reg_data_i[15:0]),
        .an_o      (an_o),
        .seg_o     (seg_o)
    );
    
    always @(posedge CLK_10MHZ) begin
        modo_addr <= count_addr[7:0];
        LED_o <= modo_addr;
        
    end
    
    
    
    
    
endmodule
