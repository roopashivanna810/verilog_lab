
module clk_buff(mclk,bclk);
 input mclk;
 output bclk;
 
 buf buff(bclk,mclk);
endmodule
