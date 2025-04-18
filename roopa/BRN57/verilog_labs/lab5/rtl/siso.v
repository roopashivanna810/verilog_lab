
module siso(clk,rst,sin,sout);
 input clk,rst,sin;
 output sout;
 reg d1,d2,d3,d4;
 always@(posedge clk)
  begin
   if(rst)
		begin
			d1<=1'b0;
			d2<=1'b0;
			d3<=1'b0;
			d4<=1'b0;
		end
   else 
    begin
     d1<=sin;
     d2<=d1;
     d3<=d2;
     d4<=d3; 
   end
  end
   assign sout=d4;
 endmodule
