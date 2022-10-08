module reg_parametrizable #(parameter width=16)(

        input logic                 clk_10MHz_i,
        input logic [width-1:0]     sw_i,
        input logic                 WE_i,
        
        output logic [width-1:0]    reg_o
);
        always @(posedge clk_10MHz_i) begin
            if (WE_i)
                reg_o <= sw_i;
        end
endmodule