
module graytobinary( x0,x1,x2,x3,z0,z1,z2,z3);
 
 input x0,x1,x2,x3;
 output z0,z1,z2,z3;
 
 assign z0=x0;
 assign z1=x0^x1;
 assign z2=z1^x2;
 assign z3=z2^x3;
 
endmodule
