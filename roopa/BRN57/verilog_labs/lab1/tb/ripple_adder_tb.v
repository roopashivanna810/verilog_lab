module ripple_adder_tb();

        reg [3:0] a,b;
        reg cin;
        wire [3:0] sum;
        wire carry;
        
    integer i;

      ripple_adder DUT(.a(a),.b(b),.cin(cin),.s(sum),.cout(carry));
   
    initial 
       begin 
      a= 1'b0;
	   b= 1'b0;
	  cin= 1'b0;
       end
		 

    initial
        begin
           for(i=0;i<4;i=i+1)
             begin
            a[i] =i;
				#10;
				b[i] =i;
				//cin[i] =i;
                #10;
             end
          end

    initial
	   begin
     $monitor ("Input a=%b, b=%b,c=%b, Output sum=%b, carry=%b", a,b,cin,sum,carry);
    #100;
	 $finish;
	   end  
endmodule    
