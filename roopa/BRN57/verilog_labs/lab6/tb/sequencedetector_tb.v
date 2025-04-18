
module seq_det_tb();
 reg din,clock,reset;
 wire out;
 
 parameter CYCLE=10;
 
 seq_det SqD(.seq_in(din), .clk(clock), .rst(reset), .det_0(dout));
  always
   begin
    #(CYCLE/2);
     clock=1'b0;
    #(CYCLE/2);
     clock=~clock;
    end
  
  task initialize();
    begin
     din=0;
    end
  endtask
  
  task delay(input integer i);
     begin
       #i;
     end
  endtask
  
  task RESET();
    begin
      delay(5);
        reset=1'b1;
      delay(10);
        reset=1'b0;
    end
   endtask
  
  task stimulus(input data);
    begin
     @(negedge clock);
       din=data;
     end
    endtask
    
	 initial
	   begin
    $monitor("reset=%b, state=%b,din=%b, output dout=%b", reset,SqD.present_state,din,dout);
      end
		
    always@(SqD.present_state or dout)
      begin
       $display("correct output at state%b",SqD.present_state);
      end
      
      
      initial 
        begin
         initialize;
          RESET;
          stimulus(0);
          stimulus(1);
          stimulus(0);
          stimulus(1);
          stimulus(0);
          stimulus(1);
          stimulus(1);
          RESET;
          stimulus(1);
          stimulus(0);
          stimulus(1);
          stimulus(1);
          delay(10);
          $finish;
        end
       endmodule
