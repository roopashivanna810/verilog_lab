module encoder_8x3 (x,v,y);
input [7:0]x;
output v;
output[2:0]y;
or or1(y[0],x[1],x[3],x[5],x[7]);
or or2(y[1],x[2],x[3],x[6],x[7]);
or or3(y[2],x[4],x[5],x[6],x[7]);
or or4(v,x[0],x[1],x[2],x[3],x[4],x[5],x[6],x[7]);
endmodule
