module ttl7486(Out, A, B);
    output [3:0] Out;
    input [3:0] A;
    input [3:0] B;

    // ON 74LS86, simplified assumptions
    xor #(0:20:30) (Out[0], A[0], B[0]);
    xor #(0:20:30) (Out[1], A[1], B[1]);
    xor #(0:20:30) (Out[2], A[2], B[2]);
    xor #(0:20:30) (Out[3], A[3], B[3]);
endmodule
