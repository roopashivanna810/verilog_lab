module bi_buf ( inout a,b, input ctrl);
   bufif0(b,a,ctrl);
   bufif1(a,b,ctrl);
endmodule
