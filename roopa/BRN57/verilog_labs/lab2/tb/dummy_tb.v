
 `timescale  1ns/1ns
module clk_gen;
  reg clk;
parameter  CYCLE=15;

initial
 begin 
   #2;
   clk=0;
   forever
   #(CYCLE/2.0)clk=~clk;
 end
endmodule
