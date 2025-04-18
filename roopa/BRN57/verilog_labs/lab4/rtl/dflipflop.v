
module dflip_flop(clk,rst,d,q,qb);
  input clk,rst,d;
  output reg q;
  output qb;
  
  always@(posedge clk)
   begin
    if(rst)
      q<=1'b0;
     else
      q<=d;  
   end
  assign qb=~q;
 endmodule
