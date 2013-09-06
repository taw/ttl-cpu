module ttl74157(Out, S, A, B);
    output [3:0] Out;
    input S;
    input [3:0] A;
    input [3:0] B;

    assign #20 Out[0] = (S & B[0]) | (!S & A[0]);
    assign #20 Out[1] = (S & B[1]) | (!S & A[1]);
    assign #20 Out[2] = (S & B[2]) | (!S & A[2]);
    assign #20 Out[3] = (S & B[3]) | (!S & A[3]);
endmodule
