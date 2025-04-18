
module updowncounter_tb;
 reg clk,rst,load,mode;
 reg [3:0] data;
 wire [3:0] count;
 
 updowncounter DUT(.clk(clk),.rst(rst),.data(data),.load(load),.mode(mode),.count(count));
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
			 mode=1'b0;
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
 
 task model;
  input m;
   begin
    @(negedge clk)
      mode=m;
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
	  model(1'b0);
	  #50;
     stimulus(4'b1100);
	   loadable(1'b1);
	   model(1'b1);
	  #50;
	  stimulus(4'b1110);
	   loadable(1'b0);
	   model(1'b0);
  end
  
 initial
  begin 
   $monitor("input clk=%b,rst=%b,load=%b,data=%b,mode=%b, output count=%d", clk,rst,load,data,mode,count);
  end
  
 endmodule        
