
module mux_4x1(d1,d0,en,i0,i1,i2,i3,z);
  input d0,d1;
  input en;
  input i0,i1,i2,i3;
  wire y0,y1,y2,y3;
  //wire b0,b1,b2,b3;
  output z;
  
  
  decoder dec1(.d1(d1),.d0(d0),.en(en),.y0(y0),.y1(y1),.y2(y2),.y3(y3));
  bufif1 buf1(z,i0,y0);
  bufif1 buf2(z,i1,y1);
  bufif1 buf3(z,i2,y2);
  bufif1 buf4(z,i3,y3);
  /*tri_buf=  t1(.a(i0),.ctrl(y0),.b(z));
  tri_buf  t2(.a(i1),.ctrl(y1),.b(z));
  tri_buf  t3(.a(i2),.ctrl(y2),.b(z));
  tri_buf  t4(.a(i3),.ctrl(y3),.b(z));
  or or1(z,b0,b1,b2,b3);*/
 
endmodule
  
  
  
