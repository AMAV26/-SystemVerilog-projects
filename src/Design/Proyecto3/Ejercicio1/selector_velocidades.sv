module selector_velocidades (
    input logic clk_10MHz_i,
    input logic [1:0]sel_velocidad_i,
    
    output logic [2:0] LED_o,
    output logic velocidad_sal_o
    
);
     
        logic clk_medio_s;
        logic clk_un_s;
        logic clk_dos_s;

        //para que sea medio seg div=5_000_000, TB f=10Mh;
       //para que sea un seg div2=10_000_000, TB f=1000khz
        //para que sean dos seg div3=20_000_000TB, f=100khz
        //no puedo probar en TB con esos div por lo tanto tengo unos que den KHz
        //parameter div=5000000;
        clk_divider #( .div (5000000)) Medio_seg//si quiero probar en tb .div (1)5000000
            (
                .clk_10MHz_i     (clk_10MHz_i),
                .clk_div_o       (clk_medio_s)
            );
       clk_divider #( .div (10000000)) Un_seg//si quiero probar en tb .div (3)10000000
            (
                .clk_10MHz_i     (clk_10MHz_i),
                .clk_div_o       (clk_un_s)
            );
       clk_divider #( .div (20000000)) Dos_seg//si quiero probar en tb .div (5)20000000
            (
                .clk_10MHz_i     (clk_10MHz_i),
                .clk_div_o       (clk_dos_s)
            );
       always @(posedge clk_10MHz_i)begin
            case(sel_velocidad_i)
                2'b00: velocidad_sal_o <= clk_medio_s;
                2'b01: velocidad_sal_o <= clk_un_s;
                2'b10: velocidad_sal_o <= clk_dos_s;
                2'b11: velocidad_sal_o <= clk_medio_s;//esta no deberia usarse
            endcase
        end
       
      always @(posedge clk_10MHz_i)begin
            case(sel_velocidad_i)
                2'b00: LED_o <= 3'b001; 
                2'b01: LED_o <= 3'b010;
                2'b10: LED_o <= 3'b100;
                2'b11: LED_o <= 3'b001;//esta no deberia usarse
            endcase
        end
endmodule
