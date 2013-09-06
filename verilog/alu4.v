module alu4(Out, Kout, A, B, C, Ai, Bi, Kin, M);
    output [3:0] Out;
    output Kout;
    input [3:0] A;
    input [3:0] B;
    input [3:0] C;
    input Ai;
    input Bi;
    input Kin;
    input [1:0] M;
    
    wire [3:0] Ax;
    wire [3:0] Bx;

    wire [3:0] M0;
    wire [3:0] M1;
    wire [3:0] M2;

    ttl7486 AX(
	.A (A),
	.B ({Ai,Ai,Ai,Ai}),
	.Out (Ax)    
    );

    ttl7486 BX(
	.A (B),
	.B ({Bi,Bi,Bi,Bi}),
	.Out (Bx)    
    );
    
    ttl7400 NA(
	.A (Ax),
	.B (Bx),
	.Out (M0)
    );

    ttl7402 NO(
	.A (Ax),
	.B (Bx),
	.Out (M1)
    );
    
    ttl7483 NS(
	.A (Ax),
	.B (Bx),
	.Kin (Kin),
	.Out (M2),
	.Kout (Kout)
    );

    ttl74153 Mx1(
	.A (M0[1:0]),
	.B (M1[1:0]),
	.C (M2[1:0]),
	.D (C[1:0]),
	.S (M),
	.Out ({Out[1:0]})
    );

    ttl74153 Mx2(
	.A (M0[3:2]),
	.B (M1[3:2]),
	.C (M2[3:2]),
	.D (C[3:2]),
	.S (M),
	.Out ({Out[3:2]})
    );

endmodule
