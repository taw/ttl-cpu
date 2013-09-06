module mux_8in_8b(Out, S, A, B, C, D, E, F, G, H);
    output [7:0] Out;
    input [2:0] S;
    input [7:0] A;
    input [7:0] B;
    input [7:0] C;
    input [7:0] D;
    input [7:0] E;
    input [7:0] F;
    input [7:0] G;
    input [7:0] H;

    ttl74151 M0 (
    .S (S),
    .Out (Out[0]),
    .In ({H[0], G[0], F[0], E[0], D[0], C[0], B[0], A[0]})
    );

    ttl74151 M1 (
    .S (S),
    .Out (Out[1]),
    .In ({H[1], G[1], F[1], E[1], D[1], C[1], B[1], A[1]})
    );

    ttl74151 M2 (
    .S (S),
    .Out (Out[2]),
    .In ({H[2], G[2], F[2], E[2], D[2], C[2], B[2], A[2]})
    );

    ttl74151 M3 (
    .S (S),
    .Out (Out[3]),
    .In ({H[3], G[3], F[3], E[3], D[3], C[3], B[3], A[3]})
    );

    ttl74151 M4 (
    .S (S),
    .Out (Out[4]),
    .In ({H[4], G[4], F[4], E[4], D[4], C[4], B[4], A[4]})
    );

    ttl74151 M5 (
    .S (S),
    .Out (Out[5]),
    .In ({H[5], G[5], F[5], E[5], D[5], C[5], B[5], A[5]})
    );

    ttl74151 M6 (
    .S (S),
    .Out (Out[6]),
    .In ({H[6], G[6], F[6], E[6], D[6], C[6], B[6], A[6]})
    );

    ttl74151 M7 (
    .S (S),
    .Out (Out[7]),
    .In ({H[7], G[7], F[7], E[7], D[7], C[7], B[7], A[7]})
    );
endmodule
