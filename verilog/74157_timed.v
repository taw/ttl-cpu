module ttl74157(Out, S, A, B);
    output [3:0] Out;
    input S;
    input [3:0] A;
    input [3:0] B;

    // ON 74LS157, simplified
    // Motorola 74LS157's delay is similar
    assign #(0:18:27) Out[0] = (S & B[0]) | (!S & A[0]);
    assign #(0:18:27) Out[1] = (S & B[1]) | (!S & A[1]);
    assign #(0:18:27) Out[2] = (S & B[2]) | (!S & A[2]);
    assign #(0:18:27) Out[3] = (S & B[3]) | (!S & A[3]);
endmodule
