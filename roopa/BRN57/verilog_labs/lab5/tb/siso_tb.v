
 module siso_tb;
 reg clk,rst,sin;
// wire d1,d2,d3,d4;
 wire sout;
 
 siso DUT(.clk(clk),.rst(rst),.sin(sin),.sout(sout));
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
 
  
  task initialize;
   begin
           clk=1'b0;
	       rst=1'b0;
	       sin=1'b0;
   end
  endtask
  
     
 task stimulus;
  input d;
   begin
   @(negedge clk)
     sin=d; 
	end
  endtask
  

 initial
  begin
   initialize;
    reset;
     stimulus(1'b1);
	  #50;
     stimulus(1'b0);
	  #50;
	  stimulus(1'b1);
	 #100$finish;
  end
 /*
 initial
  begin 
   $monitor("input clk=%b,rst=%b,sin=%b, output d1=%b,d2=%b,d3=%b,d4=%b,sout=%b", clk,rst,sin,d1,d2,d3,d4,sout);
  end*/
  
 endmodule        
