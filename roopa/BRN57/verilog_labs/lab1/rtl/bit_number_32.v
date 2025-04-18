
module bit_number (
    input [31:0] num,
    output reg [5:0] ones_count,
    output reg [5:0] zeros_count
);
    integer i;
    
    always @(*) 
     begin
        ones_count = 0;
        zeros_count = 0;
        
        for (i = 0; i < 32; i = i + 1) 
          begin
            if (num[i] == 1)
                ones_count = ones_count + 1;
            else
                zeros_count = zeros_count + 1;
        end
    end
endmodule
