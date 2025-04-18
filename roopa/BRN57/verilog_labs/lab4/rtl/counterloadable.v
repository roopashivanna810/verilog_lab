
module counter_load(clk,rstn,data,load,count);
 input clk,rstn,load;
 input [3:0]data;
 output reg [3:0]count;
 
 always@(posedge clk)
  begin
   if(!rstn)
    count<=4'b0;
   else if(load)
    count<=data;
   else
    count<=count+1'b1;
  end
 endmodule
   
