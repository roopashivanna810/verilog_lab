
module vending_machine_tb;
 reg[1:0] d_tb;
 reg clk_tb,rst_tb;
 wire x1_tb;
 wire x2_tb;
 
 vending_machine DUT(d_tb,clk_tb,rst_tb,x1_tb,x2_tb);
 
 initial
   begin
     clk_tb=1'b0;
     forever #10 clk_tb=~clk_tb;
    end
    
  task reset;
    begin
     rst_tb=1'b1;
       #15;
     rst_tb=1'b0;
    end
  endtask
  
  task in (input [1:0]k);
   begin
    @(negedge clk_tb)
      d_tb=k;
   end
  endtask

 initial 
    begin
     reset;
     in(2'b10);
     in(2'b10);
     in(2'b11);
     in(2'b10);
     in(2'b11);
     in(2'b01);
      $finish;
    end
 
 initial
  begin
   $monitor("d=%b, x1=%b,x2=%b", d_tb,x1_tb,x2_tb);
    #1000$stop;
  end
endmodule

  
    
   
