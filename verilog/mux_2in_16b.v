module mux_2in_16b(Out, S, A, B);
    output [15:0] Out;
    input S;
    input [15:0] A;
    input [15:0] B;

    ttl74157 M0 (
	.A (A[3:0]),
	.B (B[3:0]),
	.Out (Out[3:0]),
	.S (S)
    );

    ttl74157 M1 (
	.A (A[7:4]),
	.B (B[7:4]),
	.Out (Out[7:4]),
	.S (S)
    );

    ttl74157 M2 (
	.A (A[11:8]),
	.B (B[11:8]),
	.Out (Out[11:8]),
	.S (S)
    );

    ttl74157 M3 (
	.A (A[15:12]),
	.B (B[15:12]),
	.Out (Out[15:12]),
	.S (S)
    );
endmodule
