 
module modcounter(clk,rst,data,load,count);
 input clk,rst,load;
 input [3:0]data;
 output reg [3:0]count;
 
 always@(posedge clk)
  begin
   if(rst)
    count<=4'b0000;
   else if(load)
    count<=data;
   else if(count>=4'b1011)
    count<=4'b0000;
   else
    count<=count+1'b1;
  end
 endmodule
   
