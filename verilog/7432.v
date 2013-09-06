module ttl7432(Out, A, B);
    output [3:0] Out;
    input [3:0] A;
    input [3:0] B;

    or #15 (Out[0], A[0], B[0]);
    or #15 (Out[1], A[1], B[1]);
    or #15 (Out[2], A[2], B[2]);
    or #15 (Out[3], A[3], B[3]);
endmodule
