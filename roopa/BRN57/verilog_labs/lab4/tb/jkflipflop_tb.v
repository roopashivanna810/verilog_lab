module jk_ff_tb;
 reg clk,rst,j,k;
 wire q,qb;
 
 jk_ff DUT(.j(j), .k(k), .clk(clk), .rst(rst), .q(q),.qb(qb));
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
  input a,b;
   begin
    @(negedge clk);
     j=a;
     k=b;
   end
  endtask
  
  task initialize;
   begin
    {clk,j,k,rst}=3'b0;
   end
  endtask
  
 initial
  begin
   initialize;
    reset;
     stimulus(1'b0,1'b0);
     #10;
     stimulus(1'b0,1'b1);
     #10;
     stimulus(1'b1,1'b0);
     #10;
     stimulus(1'b1,1'b1);
  end    
 
 initial 
  begin
   $monitor("input clk=%b,rst=%b, j=%b, k=%b output q=%b,qb=%b", clk,rst,j,k,q,qb);
  end
  
 endmodule
