
module decoder(d0,d1,en,y0,y1,y2,y3);
    input d0,d1,en;
	 output y0,y1,y2,y3;
  	 assign y0=en & (~d1 & ~d0);
    assign y1=en & (~d1 & d0);
    assign y2=en & (d1  & ~d0);
    assign y3=en & (d1  & d0);

endmodule
