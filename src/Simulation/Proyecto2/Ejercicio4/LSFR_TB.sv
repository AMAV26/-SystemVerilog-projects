`timescale 1ns / 1ps
module LFSR_TB ();
 
    parameter clock_cycle = 10;//periodo 10ns
    parameter half_cycle = clock_cycle/2;
    parameter delay_val=1;//1 ns delay de escritura
    
    logic Clk = 1'b1;//este clock tiene que estar en uno para que sirva
    logic Rst = 1'b0;//este bicho en cero para que sirva
    logic r_Enable = 1'b1;//este da igual
    
    logic [16-1:0] w_LFSR_Data;
    logic w_LFSR_Done;
    
    always @(*)
        #(half_cycle) Clk <= ~Clk; 
        
    task wait_clk(input integer num);
        repeat(num) begin
            @(posedge Clk); #(delay_val);
        end
    endtask
   
  LFSR_individual_test_top LFSR_inst
         (.i_Clk(Clk),
          .i_Rst(Rst),
          .i_Enable(r_Enable),
          .i_Seed_Data({16{1'b0}}), // Replication
          .o_LFSR_Data(w_LFSR_Data),
          .o_LFSR_Done(w_LFSR_Done)
          );
          
  initial begin 
    wait_clk(2);
    Rst=1;
    wait_clk(5);
    r_Enable=1;
    wait_clk(100);
    r_Enable=1;
    wait_clk(10);
    r_Enable=0;
    wait_clk(10);
    repeat(15) begin
        r_Enable=~r_Enable;
        wait_clk(1);
    end
    r_Enable=0;
    wait_clk(10);
    $finish;
  end
  
  
 endmodule