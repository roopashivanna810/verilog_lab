
module counter_load_tb;
 reg clk,rstn,load;
 reg [3:0] data;
 wire [3:0] count;
 
 counter_load DUT(.clk(clk),.rstn(rstn),.data(data),.load(load),.count(count));
  always
   #10 clk=~clk;
   
 task reset;
  begin
   @(negedge clk);
    rstn=1'b0;
   @(negedge clk);
    rstn=1'b1;
  end
 endtask
 
  
  task initialize;
   begin
    clk=0;
	 rstn=0;
	 load=0;
    data=4'b0;
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
   $monitor("input clk=%b,rstn=%b,load=%b,data=%b, output count=%d", clk,rstn,load,data,count);
  end
  
 endmodule        
