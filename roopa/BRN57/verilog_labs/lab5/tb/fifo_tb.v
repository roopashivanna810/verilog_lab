
module fifo_tb;
 reg clk;
 reg rst;
 reg write_en;
 reg read_en;
 reg [7:0] data_in;
 
 wire [7:0] data_out;
 wire empty;
 wire full;
 
 fifo DUT(.clk(clk), .rst(rst), .write_en(write_en), .read_en(read_en), .data_in(data_in), .data_out(data_out), .empty(empty), .full(full));
 
always #10 clk=~clk;
 
  task initialize;
   begin
    {clk,rst,write_en,read_en,data_in}=0;
   end
  endtask
  
  task reset;
   begin
    @(negedge clk)
     rst=1'b1;
    @(negedge clk)
     rst=1'b0;
   end
   endtask
   
   task write_data;
    input [7:0] data;
     begin
     write_en=1'b1;
     @(negedge clk)
     data_in=data;
	  @(negedge clk)
		write_en=1'b0;
     end
    endtask
    
    task read_data;
     begin
      @(negedge clk)
       read_en=1'b1;
		@(negedge clk)
			read_en=1'b0;
     end
    endtask
 always #10 clk=~clk;
    integer i;
     initial 
      begin
		/*
      clk=0;
       rst=0;
       write_en=0;
       read_en=0;
       data_in=0;*/
       initialize;
        reset;
        for(i=0;i<16;i=i+1)
         begin
          write_data({$random}%256);
         end
			
        for(i=0;i<16;i=i+1)
         begin
          read_data;
         end
			/*
         repeat(10)
         @(negedge clk)
         repeat(2)
         @(negedge clk)
         read_data;*/
		#10 $finish;
      end
   endmodule
