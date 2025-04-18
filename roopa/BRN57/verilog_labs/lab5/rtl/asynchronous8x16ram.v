

module ram(input we_in,enable_in,
            input[3:0] addr_in,
            inout[15:0] data);

  reg [15:0] mem [7:0];
  
  always@(data,we_in,enable_in,addr_in)
    begin
			if(we_in && !enable_in)
			mem[addr_in]=data;    
		end
   assign data=(enable_in && !we_in) ? mem[addr_in] : 16'hzz;
   
endmodule
 
