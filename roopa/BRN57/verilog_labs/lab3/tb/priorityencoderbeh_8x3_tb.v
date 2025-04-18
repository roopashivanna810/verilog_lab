module encoder_8x3_tb();
 reg [7:0] d;
 wire v;
 wire [2:0]y;
 
 encoder_8x3 DUT(.x(d),.y(y),.v(v));
 
 task initialize;
  begin
   {d}=0;
  end
 endtask
 
 task stimulus;
  input [7:0] a;
   begin
    d=a;
   end
  endtask
  
 task delay;
  input [7:0] del;
  begin
   #del;
  end
 endtask
 
  initial
   begin
    initialize;
    delay(10);
    stimulus(8'b00000001);
    delay(10);
    stimulus(8'b00000010);
    delay(10);
    stimulus(8'b00000100);
    delay(10);
    stimulus(8'b00001000);
    delay(10);
    stimulus(8'b00010000);
    delay(10);
    stimulus(8'b00100000);
    delay(10);
    stimulus(8'b01000000);
    delay(10);
    stimulus(8'b10000000);
   end
  
  initial
   $monitor("input d=%b, outputy=%b, v=%b",d,y,v);
   
   initial
   #200 $finish;
endmodule
