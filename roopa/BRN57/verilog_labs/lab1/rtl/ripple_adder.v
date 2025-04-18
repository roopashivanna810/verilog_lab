module ripple_adder(a,b,cin,s,cout);
        input [3:0] a,b;
        input cin;
        output [3:0] s;
        output cout;
        wire c0,c1,c2;
      onebitadder o1(.a(a[0]), .b(b[0]), .c(cin), .sum_out(s[0]), .carry_out(c0));
      onebitadder o2(.a(a[1]), .b(b[1]), .c(c0), .sum_out(s[1]), .carry_out(c1));
      onebitadder o3(.a(a[2]), .b(b[2]), .c(c1), .sum_out(s[2]), .carry_out(c2));
      onebitadder o4(.a(a[3]), .b(b[3]), .c(c2), .sum_out(s[3]), .carry_out(cout));
 endmodule                            
