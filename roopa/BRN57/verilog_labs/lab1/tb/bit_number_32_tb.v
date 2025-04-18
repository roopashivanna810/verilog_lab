
module bit_number_tb();
    reg [31:0] num;
    wire [5:0] ones_count;
    wire [5:0] zeros_count;
    
    // Instantiate the Unit Under Test (uut)
    bit_number uut(
        .num(num),
        .ones_count(ones_count),
        .zeros_count(zeros_count)
    );
     
     //initialize 
    task initialize;
       begin
         num=32'b0;
       end
    endtask
    
    //Dealy task
    task delay(input integer i);
       begin
         #i;
       end
    endtask
        
    // Task for applying test cases
    task stimulus(input [31:0] test_num);
        begin
            num = test_num;
				#10;
            $display("Input num=%b, Output ones_count=%d, zeros_count= %d", num, ones_count, zeros_count);
        end
    endtask

    // Initial block to call test cases
    initial 
     begin
       initialize;
        $display("Test Case 1: Alternating Bits");
        stimulus(32'b10101010101010101010101010101010); // Expected: 16 ones, 16 zeros
        delay(10);
        
       
        $display("Test Case 2: All Ones");
        stimulus(32'hFFFFFFFF); // Expected: 32 ones, 0 zeros
        delay(10);
       
        $display("Test Case 3: All Zeros");
        stimulus(32'h00000000); // Expected: 0 ones, 32 zeros
        delay(10);
      
      
        $display("Test Case 4: Random Pattern");
        stimulus(32'h12345678); // Expected: 13 ones, 19 zeros
        delay(10);
        
        $finish;
    end
endmodule
