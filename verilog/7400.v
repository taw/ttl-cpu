module ttl7400(Out, A, B);
    output [3:0] Out;
    input [3:0] A;
    input [3:0] B;

    nand #10 (Out[0], A[0], B[0]);
    nand #10 (Out[1], A[1], B[1]);
    nand #10 (Out[2], A[2], B[2]);
    nand #10 (Out[3], A[3], B[3]);
endmodule
