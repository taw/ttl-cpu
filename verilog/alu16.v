module alu16(Out, Kout, OutZero, A, B, C, Ai, Bi, Kin, M);
    output [15:0] Out;
    output Kout;
    output [1:0] OutZero;
    input [15:0] A;
    input [15:0] B;
    input [15:0] C;
    input Ai;
    input Bi;
    input Kin;
    input [1:0] M;
    
    wire [2:0] K;
    
    alu4 A4_0(
    .A (A[3:0]),
    .B (B[3:0]),
    .C (C[3:0]),
    .Ai (Ai),
    .Bi (Bi),
    .M (M),
    .Kin (Kin),
    .Kout (K[0]),
    .Out(Out[3:0])
    );

    alu4 A4_1(
    .A (A[7:4]),
    .B (B[7:4]),
    .C (C[7:4]),
    .Ai (Ai),
    .Bi (Bi),
    .M (M),
    .Kin (K[0]),
    .Kout (K[1]),
    .Out(Out[7:4])
    );

    alu4 A4_2(
    .A (A[11:8]),
    .B (B[11:8]),
    .C (C[11:8]),
    .Ai (Ai),
    .Bi (Bi),
    .M (M),
    .Kin (K[1]),
    .Kout (K[2]),
    .Out(Out[11:8])
    );

    alu4 A4_3(
    .A (A[15:12]),
    .B (B[15:12]),
    .C (B[15:12]),
    .Ai (Ai),
    .Bi (Bi),
    .M (M),
    .Kin (K[2]),
    .Kout (Kout),
    .Out(Out[15:12])
    );

    ttl7430 Z0(
    .In (Out[7:0]),
    .Out (OutZero[0])
    );

    ttl7430 Z1(
    .In (Out[15:8]),
    .Out (OutZero[1])
    );    
endmodule
