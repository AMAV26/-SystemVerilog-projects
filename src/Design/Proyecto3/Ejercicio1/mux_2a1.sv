module mux_2a1 (
    input logic         sel_i,
    input logic [16:0]  A_i,
    input logic [16:0]  B_i,
    
    output logic [16:0] mux_o

);
        assign mux_o = sel_i ? B_i : A_i;
endmodule