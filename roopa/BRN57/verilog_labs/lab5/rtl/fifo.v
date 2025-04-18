
module fifo(clk,rst,write_en,read_en,data_in,data_out,empty,full);
	parameter width=8;
	parameter depth=16;
 
	input clk,rst,write_en,read_en;
	input [width-1:0] data_in;
	output reg [width-1:0] data_out;
	output empty,full;
 
	reg [width-1:0] mem [depth-1:0];
	reg [4:0] wr_ptr,rd_ptr;
 
	assign empty=(wr_ptr==rd_ptr)?1'b1:1'b0;
	assign full= ((wr_ptr[4]!=rd_ptr[4])&&(wr_ptr[3:0]==rd_ptr[3:0]))?1'b1:1'b0;
 
	integer i;
	always@(posedge clk)
		begin
			if(rst)
				begin
					for(i=0;i<depth;i=i+1)
						begin
							mem[i]<=8'b0;
							wr_ptr<=5'b0;
						end
				end
			else if(write_en && !full)
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
				 rd_ptr<=5'b0;
				end
			else if(read_en && !empty)
				begin
				 data_out<=mem[rd_ptr[3:0]];
				 rd_ptr<= rd_ptr+1'b1;
				end
			else
				data_out<=data_out;
		end
endmodule
