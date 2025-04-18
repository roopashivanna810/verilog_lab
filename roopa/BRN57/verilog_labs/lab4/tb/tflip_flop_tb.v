
module tflip_flop_tb;
 reg clk,rst,t;
 wire q,qb;
 
 tflip_flop DUT(clk,rst,t,q,qb);
  always
   #10 clk=~clk;
   
 task reset;
  begin
   @(negedge clk);
    rst=1'b1;
   @(negedge clk);
    rst=1'b0;
  end
 endtask
 
 task stimulus;
  input data_in;
   begin
    @(negedge clk);
     t=data_in;
   end
  endtask
  
  task initialize;
   begin
    {clk,t,rst}=3'b0;
   end
  endtask
  
 initial
  begin
   initialize;
    reset;
     stimulus(1'b0);
     stimulus(1'b1);
  end    
 
 initial 
  begin
   $monitor("input clk=%b,rst=%b, t=%b, output q=%b,qb=%b", clk,rst,t,q,qb);
  end
  
 endmodule