module encoder_8x3 (x,v,y);
input [7:0]x;
output reg v;
output reg [2:0]y;

 always@(x)
  begin
   
   if(x[0]==1)
	 begin
    y=3'b000;
    v=1;
	 end
    
   else if(x[1]==1)
	 begin
    y=3'b001;
    v=1;
	 end
    
   else if(x[2]==1)
	 begin
    y=3'b010;
    v=1;
	 end
    
   else if(x[3]==1)
	 begin
    y=3'b011;
    v=1;
	 end
    
   else if(x[4]==1)
	 begin
    y=3'b100;
    v=1;
	 end
    
   else if(x[5]==1)
	 begin
    y=3'b101;
    v=1;
	 end
    
   else if(x[6]==1)
	 begin
    y=3'b110;
    v=1;
	 end
    
   else if(x[7]==1)
	 begin
    y=3'b111;
    v=1;
	 end
	 
	else
	 begin
    y=3'bzzz;
    v=0;
	 end
	 
  end
endmodule 
 
