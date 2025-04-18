
module ram_dual_port_tb;
 reg wr_clk,rd_clk,rst;
 reg [2:0] waddr,raddr;
 reg we,re;
 reg[15:0] data_in;
 wire [15:0] data_out;
 integer i;
 
 ram_dual_port DUT (.wr_clk(wr_clk),.rd_clk(rd_clk),.rst(rst),.waddr(waddr),.raddr(raddr),.we(we),
 .re(re),.data_in(data_in),.data_out(data_out));
 
 task initialize;
  begin
  {wr_clk,rd_clk,rst,waddr,raddr,we,re}=0;
  end
 endtask
 
 task reset;
  begin
   @(negedge wr_clk or negedge rd_clk)
    rst=1'b1;
   @(negedge wr_clk or negedge rd_clk)
    rst=1'b0;
  end
 endtask
 
 task write_data;
  input [2:0] write_addr;
  input [15:0] write_data;
  begin
   @(negedge wr_clk)
     begin
      we=1'b1;
      waddr=write_addr;
      data_in=write_data;
     end
   @(negedge wr_clk);
     we=1'b0;
  end
 endtask
 
 task read_data;
  input [2:0] read_addr;
   begin 
    @(negedge rd_clk );
     begin
      re=1'b1;
      raddr=read_addr;
     end
    @(negedge rd_clk );
      re=1'b0;
   end
 endtask

always #10 wr_clk=~wr_clk;
always #10 rd_clk=~rd_clk;

  initial
   begin
    initialize;
    reset;
    for(i=0;i<8;i=i+1)
     begin
     write_data(i,{$random}%128);
     end
    for(i=0;i<8;i=i+1)
     begin
      read_data(i);
     end
   end
 endmodule
    
