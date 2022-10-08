`timescale 1ns / 1ps

module antirebotes_sinc
    (
    input logic     clk_i,
    input logic     btn_i,
    input logic     rst_i,

    output logic    db_btn_o 
    );
    typedef enum
    {
        zero    , 
        wait1_1 , 
        wait1_2 , 
        wait1_3 , 
        wait1_4 , 
        wait1_5 ,
        one     ,
        wait0_1  
    } state_t;
    
    state_t state_reg,
            state_next;

    always_ff @(posedge clk_i, negedge rst_i)
        if (!rst_i)
            state_reg <= zero;
        else
            state_reg <= state_next;


    always_comb begin

        state_next = state_reg;
        db_btn_o = 1'b0;
        case (state_reg)
            zero:
                if (btn_i)
                    state_next = wait1_1;

                else
                    state_next = zero;
            wait1_1:
                if (btn_i)
                    state_next = wait1_2;

                else
                    state_next = zero;

            wait1_2:
                if (btn_i)
                    state_next = wait1_3;

                else
                    state_next = zero;
           wait1_3:
                if (btn_i)
                    state_next = wait1_4;

                else
                    state_next = zero;
           wait1_4:
                if (btn_i)
                    state_next = wait1_5;

                else
                    state_next = zero;
                    
           wait1_5:
                if (btn_i)
                    state_next = one;

                else
                    state_next = zero;
                    
           one: begin
                db_btn_o = 1'b1;
                if (btn_i)
                    state_next = wait0_1;
            end

           wait0_1: begin
                db_btn_o = 1'b1;
                if (btn_i)
                    state_next = one;
                else
                    state_next = zero;
           end
            
    
            default: state_next = zero; 

        endcase

    end
endmodule