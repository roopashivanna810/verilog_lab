module onebitadder(a,b,c,sum_out,carry_out);
        input a,b,c;
        output sum_out,carry_out;
        assign sum_out= a ^ b ^ c;
        assign carry_out= a&b | b&c | c&a;
       
 endmodule
