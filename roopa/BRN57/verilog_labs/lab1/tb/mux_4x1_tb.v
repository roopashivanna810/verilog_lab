 module mux_4x1_tb();
    
	 reg i0,i1,i2,i3;
    reg s0,s1;
    wire y;
    integer i,j;

 mux_4x1 DUT(.a(i0),.b(i1),.c(i2),.d(i3),.s0(s0),.s1(s1),.y(y));
 
   /*initial
      begin
         for(i=0;i<4;i=i+1)
           begin
             {s0,s1}=i;
               for(j=0;j<16;j=j+1)
                 begin
                  {i0,i1,i2,i3}=j;
                  #10;
                 end
             end
		  end*/
		  
		  initial begin
		  s0=0 ; s1=0 ; i0 =0 ;i1 =1 ; i2 = 0; i3 =1;
		  #10;
		  s0=0; s1=1 ; i0 =0 ;i1 =1 ; i2 = 0; i3 =1;
		  #10;
		  s0=1 ; s1=0 ; i0 =0 ;i1 =1 ; i2 = 0; i3 =1;
		  #10;
		  s0=1; s1=1 ; i0 =0 ;i1 =1 ; i2 = 0; i3 =1;
		  
		  end

    initial
	     begin
     $monitor ("Input i0=%b, i1=%b,i2=%b, i3=%b, s0=%b, s1=%b,Output y=%b", i0,i1,i2,i3,s0,s1,y);
	 
	  #100 $finish;
        end
 endmodule    
