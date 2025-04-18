module full_adder_tb();

    reg a,b,cin,en;
    wire sum,carry;

    integer i;

    full_adder DUT(a,b,cin,sum,carry);
   
    initial 
       begin 
			a=1'b0;
			b=1'b0;
			cin= 1'b0;
			end
			
	initial
		begin
			en=0;
			#10;
			en=1;
			#10;
           for(i=0;i<8;i=i+1)
             begin
               {a,b,cin}=i;
                #10;
             end
				#100 $finish;
         end

    initial
     $monitor ("Input a=%b, b=%b,c=%b, Output sum=%b, carry=%b", a,b,cin,sum,carry);

    //initial #100 $finish;
  
 endmodule    
