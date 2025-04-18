
module mux_4x1(a,b,c,d,s0,s1,y);
input a,b,c,d;
input s0,s1;
output y;
wire w1,w2;
  mux_2x1 m1(.i0(a),.i1(b),.sel(s1),.y(w1));
  mux_2x1 m2(.i0(c),.i1(d),.sel(s1),.y(w2));
  mux_2x1 m3(.i0(w1),.i1(w2),.sel(s0),.y(y));
endmodule

/*module mux_4x1(i,s,y);
input [3:0] i;
input [1:0] s;
output y;
wire w1,w2;
  mux_2x1 m1(.i0(i[0]),.i1(i[1]),.sel(s[0]),.y(w1));
  mux_2x1 m2(.i0(i[2]),.i1(i[3]),.sel(s[0]),.y(w2));
  //mux_2x1 m2(.i0(i2),.i1(i3),.sel(s1),.y(w2));
  mux_2x1 m3(.i0(w1),.i1(w2),.sel(s[1]),.y(y));
endmodule*/