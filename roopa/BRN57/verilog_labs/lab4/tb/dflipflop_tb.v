module dflip_flop_tb;
 reg clk,rst,d;
 wire q,qb;
 
 dff DUT(clk,rst,d,q,qb);
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
 
 task stimulus
  input data_in;
   begin
    @(negedge clk);
     d=data_in;
   end
  endtask
  
  task initialize;
   begin
    {clk,d,rst}=3'b0;
   end
  endtask
  
 initial
  begin
   initialize;
    reset;
     stimulus(1'b0);
     stimulus(1'b1);
  end
 endmodule        
