
module decoder_3x8(d2,d1,d0,en,y0,y1,y2,y3,y4,y5,y6,y7);
    input d2,d1,d0,en;
    output y0,y1,y2,y3,y4,y5,y6,y7;
    assign y0=en & (~d2 & ~d1 & ~d0 );
    assign y1=en & (~d2 & ~d1 & d0 );
    assign y2=en & (~d2 & d1 & ~d0 );
    assign y3=en & (~d2 & d1 & d0 );
    assign y4=en & (d2 & ~d1 & ~d0 );
    assign y5=en & (d2 & ~d1 & d0 );
    assign y6=en & (d2 & d1 & ~d0 );
    assign y7=en & (d2 & d1 & d0 );
    

endmodule
