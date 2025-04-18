
module updowncounter(clk,rst,data,load,mode,count);
 input clk,rst,load,mode;
 input [3:0]data;
 output reg [3:0]count;
 
 always@(posedge clk)
  begin
   if(rst)
    count<=4'b0000;
   else if(load)
    count<=data;
   else if(mode)
     count<=count+1'b1;
   else
    count<=count-1'b1;
  end
 endmodule
   
