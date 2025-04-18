module mux4_1_tb();
 reg [3:0] d;
 reg [1:0] s;
 wire y;
 
 mux4_1 DUT(d,s,y);
 
 task initialize;
  begin
   {d,s}=0;
  end
 endtask
 
 task stimulus;
  input [3;0] a;
  input [1:0] b;
   begin
    d=a;
    s=b;
   end
  endtask
  
  initial
   begin
    initialize;
    #10;
    stimulus(3'b1010, 2'b10);
    #10;
   end
  
  initial
   $monitor("input d=%b,s=%b, output y=%b",d,s,y);
   
   initial
   #100 $finish;
endmodule
