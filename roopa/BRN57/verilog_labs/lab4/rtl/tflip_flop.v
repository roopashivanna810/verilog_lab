

module tflip_flop(clk,rst,t,q,qb);
  input clk,rst,t;
  inout q;
  wire d;
  output qb;

  xor x1(d,t,q);
  dflip_flop dff(.clk(clk), .rst(rst), .d(d), .q(q), .qb(qb));
endmodule
