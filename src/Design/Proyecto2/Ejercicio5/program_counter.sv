`timescale 1ns / 1ps
module program_counter #(parameter width=4) //width es el ancho
(
    input logic clk_i,
    input logic reset_i,
    input logic [width-1:0] PC_i, //PC_i = direccion de salto
    input [1:0] PC_op_i,
    output logic [width-1:0] PC_o,
    output logic [width-1:0] PC_inc_o
    
    );
logic [width-1:0] next_PC_o;
logic clk_out;

always @(posedge clk_i) begin
	if(!reset_i) 
	   PC_o <=0;
	else
	   PC_o <= next_PC_o;
	   
end//logica de siguiente estado

always @(*) begin
	if (PC_op_i == 2'b00) begin
	   next_PC_o = 0;
	   PC_inc_o <= PC_inc_o;
	end
	else if (PC_op_i == 2'b01) begin
		next_PC_o = PC_o;
		PC_inc_o <= PC_inc_o;
	end
	else if (PC_op_i == 2'b10) begin
	   next_PC_o = PC_o + 4;
	   PC_inc_o <= PC_inc_o;
	end
	else  begin
	   next_PC_o = PC_i;
	   PC_inc_o <= PC_o+4'b0100;
	  
	end
end

endmodule