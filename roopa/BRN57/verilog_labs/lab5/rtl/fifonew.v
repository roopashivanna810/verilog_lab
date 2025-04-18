
module fifo(clk,rst,we,re,data_in,data_out,empty,full);
 input clk,rst,we,re;
 input [7:0] data_in;
 output reg [7:0] data_out;
 output full,empty;
 
 reg [7:0] mem [15:0];
 reg [4:0] wr_ptr,rd_ptr;
 integer i;
 
 
 assign empty=(wr_ptr==rd_ptr)?1'b1:1'b0;
 assign full=((wr_ptr[4]!=rd_ptr[4])&&(wr_ptr[3:0]==rd_ptr[3:0]))?1'b1:1'b0;
 
 always@(posedge clk)
   begin
     if(rst)
       begin
         for(i=0;i<16;i=i+1)
           begin
             mem[i]<=8'b0;
             wr_ptr<=5'b0;
           end
        end
      else if(we && !full)
      	begin
      	  mem[wr_ptr[3:0]]<=data_in;
      	  wr_ptr<=wr_ptr+1'b1;
      	end	  	
      else
        mem[wr_ptr[3:0]]<=mem[wr_ptr[3:0]];
    end
    
  always@(posedge clk)
    begin
      if(rst)
        begin
          data_out<=8'b0;
          rd_ptr<=8'b0;
        end
      else if(re && !empty)
        begin
          data_out<=mem[rd_ptr[3:0]];
          rd_ptr<=rd_ptr+1'b1;
        end
      else
        data_out<=data_out;
     end
endmodule

