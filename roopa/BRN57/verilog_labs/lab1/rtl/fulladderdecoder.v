
module full_adder(a,b,c,sum,carry);
        input a,b,c;
		  output sum,carry;
        wire w0,w1,w2,w3,w4,w5,w6,w7;
        decoder_3x8 dec1(.d2(a),.d1(b),.en(1),.d0(c),.y0(w0),.y1(w1),.y2(w2),.y3(w3),.y4(w4),.y5(w5),.y6(w6),.y7(w7));
        or or1(sum,w1,w2,w4,w7);
        or or2(carry,w3,w5,w6,w7);
        
endmodule

