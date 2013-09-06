module reg16(D, Q, Wen, clk);
    input [15:0] D;
    input Wen;
    input clk;
    output [15:0] Q;

    wire [15:0] M;

    ttl74273 D0 (
	.Q (Q[7:0]),
	.D (M[7:0]),
	.clk (clk)
    );

    ttl74273 D1 (
	.Q (Q[15:8]),
	.D (M[15:8]),
	.clk (clk)
    );
    
    mux_2in_16b M0 (
	.Out (M),
	.A (Q),
	.B (D),
	.S (Wen)
    );
endmodule
