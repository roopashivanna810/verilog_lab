module graytobinary_tb();
 
 reg x0,x1,x2,x3;
 wire y0,y1,y2,y3;
 integer i;
 
 graytobinary DUT(x0,x1,x2,x3,y0,y1,y2,y3);
 
 initial
        begin
           for(i=0;i<16;i=i+1)
             begin
               {x0,x1,x2,x3}=i;
                #10;
             end
         end

    initial
     $monitor ("Input x0=%b, x1=%b,x2=%b, x3=%b, Output y0=%b, y1=%b, y2=%b, y3=%b",x0,x1,x2,x3,y0,y1,y2,y3);

    initial #100 $finish;
   
endmodule
 
