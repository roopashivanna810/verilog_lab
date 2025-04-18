
module modcounter_tb;
 reg clk,rst,load;
 reg [3:0] data;
 wire [3:0] count;
 
 modcounter DUT(.clk(clk),.rst(rst),.data(data),.load(load),.count(count));
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
	       load=1'b0;
         data=4'b0000;
   end
  endtask
  
 task loadable;
 input k;
   begin
	 @(negedge clk)
	  load=k;
	end
 endtask
 
 task stimulus;
  input [3:0]d;
   begin
   @(negedge clk)
     data=d; 
	end
  endtask
  

 initial
  begin
   initialize;
    reset;
     stimulus(4'b1011);
	  loadable(1'b0);
	  #10;
     stimulus(4'b1100);
	   loadable(1'b1);
	  #10;
	  stimulus(4'b1110);
	   loadable(1'b0);
  end
  
 initial
  begin 
   $monitor("input clk=%b,rst=%b,load=%b,data=%b, output count=%d", clk,rst,load,data,count);
  end
  
 endmodule        
