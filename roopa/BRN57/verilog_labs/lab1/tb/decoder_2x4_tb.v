module decoder_2x4_tb();
    reg en,d0,d1;
    wire y0,y1,y2,y3;
    integer i;

decoder_2x4 DUT(.en(en),.d0(d0),.d1(d1),.y0(y0),.y1(y1),.y2(y2),.y3(y3));
  initial
    begin
     {d0,d1,en}=0;
	 end 
	  
  initial
   begin
     en=1;
	  #10;
    for(i=0;i<4;i=i+1)
     begin
        {d0,d1}=i;
		  #10;
     end
    end
    initial
     $monitor ("Input d0=%b, d1=%b,en=%b, Output y0=%b, y1=%b, y2=%b, y3=%b", d0,d1,en,y0,y1,y2,y3);
    initial #100 $finish;

 endmodule    
