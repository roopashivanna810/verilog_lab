
module ram_tb;
 wire [15:0] data;
 reg [3:0] addr;
 reg we,enable;
 reg [15:0] tempd;
 
 integer l;
  
 ram DUT (.data(data), .we_in(we), .enable_in(enable), .addr_in(addr));
 
 assign data=(we && !enable) ? tempd : 16'hzz;
 
 task initialize();
   begin
    we=1'b0;
    enable=1'b0;
    tempd=16'b0;
   end
  endtask
  
  task write();
   begin
    we=1'b1;
    enable=1'b0;
   end
  endtask
  
  task read();
   begin
    we=1'b0;
    enable=1'b1;
   end
  endtask
 
 task delay;
  begin
   #10;
  end
 endtask
 
 task stimulus;
  input [3:0] address;
  input [15:0] data_input;
   begin
    addr=address;
    tempd=data_input;
   end
  endtask
  
  initial
   begin
    initialize;
     delay;
      write;
       for(l=0;l<16;l=l+1)
        begin
         stimulus(l,l);
          delay;
        end
       
      initialize;
       delay;
       read;
        for(l=0; l<8; l=l+1)
         begin
          stimulus(l,l);
           delay;
          end
          delay;
          $finish;
       end
   endmodule
      
      
      
 
