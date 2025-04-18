
module srlatch_tb;
 reg s,r;
 wire q,qb;
 
 srlatch DUT(.s(s),.r(r),.q(q),.qb(qb));
  
 task initialize;
  begin
   r=1'b0;
	s=1'b0;
  end
 endtask
  
   
 task stimulus;
  input a,b;
   begin
   s=a;
   r=b;
   end
 endtask
  
  
 initial
  begin
   initialize;
     stimulus(1'b0,1'b0);
     #10;
     stimulus(1'b0,1'b1);
     #10;
     stimulus(1'b1,1'b0);
     #10;
      stimulus(1'b1,1'b1);
  end
  
  initial 
   begin
	 $monitor("input s=%b, r=%b, output q=%b, qb=%b",s,r,q,qb);
	end 
	 
 endmodule        

