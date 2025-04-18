module half_sub_tb();

    reg a,b;
    wire dif,bor;

    integer i;

      half_sub DUT(a,b,dif,bor);
   
    initial 
       begin 
           a= 1'b0;
	   b= 1'b0;
       end

    initial
        begin
           for(i=0;i<4;i=i+1)
             begin
               {a,b}=i;
                #10;
             end
         end

    initial
     $monitor ("Input a=%b, b=%b,Output dif=%b, bor=%b", a,b,dif,bor);

    initial #100 $finish;
  
 endmodule    
