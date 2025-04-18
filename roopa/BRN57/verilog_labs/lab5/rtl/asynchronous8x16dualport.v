
module ram_dual_port(wr_clk,rd_clk,rst,waddr,raddr,we,re,data_in,data_out);
	 input wr_clk,rd_clk,rst,we,re;
	 input [2:0] waddr,raddr;
	 input [15:0] data_in;
	 output reg [15:0] data_out;
	 integer i;
	 reg [15:0] mem [7:0];
 
	always@(posedge wr_clk)
		begin
		 if(rst)
		  begin 
		    for(i=0;i<8;i=i+1)
			 mem[i]<=8'b0;
		  end
		 else 
		  begin
		    if(we)
		      mem[waddr]<=data_in;
		    else
		      mem[waddr]<=mem[waddr];
		  end	
		end	
						
	always@(posedge rd_clk)		
	       begin
	         if(rst)
	            data_out<=8'b0;
		 else if(re)
		   data_out<=mem[raddr];
		 else
	           data_out<=data_out;
	       end
		
 endmodule
