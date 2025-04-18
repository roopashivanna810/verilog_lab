module mux4_1(d,s,y);
 input [3:0] d;
 input [1:0] s;
 output reg y;
 
 always@(d,s)
  begin
   case(s)
    2'd0:y=d[0];
    2'd1:y=d[1];
    2'd2:y=d[2];
    2'd3:y=d[3];
    default:y= 'bz;
   endcase
  end  
 endmodule  
