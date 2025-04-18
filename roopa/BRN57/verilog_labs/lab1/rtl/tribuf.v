
module tri_buf(a,ctrl,b);
  
  input a,ctrl;
  output b;
  assign b=~ctrl?a:1'bz;
  assign b=ctrl?a:1'bz;
  
endmodule
   
