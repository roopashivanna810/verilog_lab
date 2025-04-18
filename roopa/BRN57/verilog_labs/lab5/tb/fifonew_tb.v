
module fifo_tb();
  reg clk,rst,we,re;
  reg[7:0] data_in;
  
  wire[7:0] data_out;
  wire empty;
  wire full;
  
  fifo DUT(clk,rst,we,re,data_in,data_out,empty,full);
  
  always #10 clk=~clk;
  
  task initialize;
    begin
      {clk,rst,we,re,data_in}=0;
    end
  endtask
  
  task reset;
    begin
      @(negedge clk) rst=1'b1;
      @(negedge clk) rst=1'b0;
    end
  endtask
  
  task write;
    input[7:0] data;
      begin
        we=1'b1;
        @(negedge clk) data_in=data;
      end
    endtask
    
  task read;
    begin
      @(negedge clk) re=1'b1;
      @(negedge clk) re=1'b0;
    end
  endtask
  
  integer i;
  initial
    begin
      initialize;
      reset;
      for(i=0;i<16;i=i+1)
        begin
          write({$random}%256);
        end
        repeat(10)
          begin
            @(negedge clk);
            read;
          end
			 //write(8'hab);
			 //write(8'hdd);
          #10 $finish;
      end
      
endmodule
