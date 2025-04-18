module encoder_8x3_tb();
	reg [7:0]x;
	wire v;
	wire[2:0]y;
	//integer i;

	encoder_8x3 DUT(x,v,y);
	
	 initial
		begin
		   x=8'b00000001;
		  #20;
		   x=8'b0000001x;
		  #20;
		   x=8'b000001xx;
		  #20;
		   x=8'b00001xxx;
		  #20;
		   x=8'b0001xxxx;
		  #20;
		  x=8'b001xxxxx;
		  #20;
		  x=8'b01xxxxxx;
		  #20;
		  x=8'b1xxxxxxx;
		  #20;
		  
			/*for(i=1;i<257;i=i*2)
				begin
					x=i;
					#10;
				end*/
			 #400 $finish;
		 end
	 
   initial
		begin
			$monitor ("Input x=%b, Output v=%b, y=%b,",x,v,y);
		end
  
endmodule    
