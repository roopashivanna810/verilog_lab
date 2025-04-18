module decoder_3x8_tb();
 reg [2:0] d;
 reg en;
 wire [7:0]y;
 
 decoder_3x8 DUT(d,en,y);
 
 task initialize;
  begin
   {d,en}=0;
  end
 endtask
 
 task stimulus;
  input [2:0] a;
  input b;
   begin
    d=a;
    en=b;
   end
  endtask
  
  initial
   begin
    initialize;
    #10;
    stimulus(3'b000, 1);
    #10;
    stimulus(3'b001, 1);
    #10;
    stimulus(3'b010, 1);
    #10;
    stimulus(3'b011, 1);
    #10;
    stimulus(3'b100, 1);
    #10;
    stimulus(3'b101, 1);
    #10;
    stimulus(3'b110, 1);
    #10;
    stimulus(3'b111, 1);
    #10;
   end
  
  initial
   $monitor("input d=%b,en=%b, output y=%b",d,en,y);
   
   initial
   #100 $finish;
endmodule
