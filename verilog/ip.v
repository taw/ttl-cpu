module ip(IP, JumpAddr, JumpEn, Next, clk);
    output [15:0] IP;
    input [15:0] JumpAddr;
    input JumpEn;
    input Next;
    input clk;

    wire [15:0] M;

    ttl7483 S0 (
	.A (IP[3:0]),
	.B (0),
	.Out (M[3:0]),
	.Kin (Next)
    );
    ttl7483 S1 (
	.A (IP[7:4]),
	.B (0),
	.Out (M[7:4]),
	.Kin (S0.Kout)
    );
    ttl7483 S2 (
	.A (IP[11:8]),
	.B (0),
	.Out (M[11:8]),
	.Kin (S1.Kout)
    );
    ttl7483 S3 (
	.A (IP[15:12]),
	.B (0),
	.Out (M[15:12]),
	.Kin (S2.Kout)
    );
    mux_2in_16b JM (
	.A (M),
	.B (JumpAddr),
	.S (JumpEn)
    );
    ttl74273 D0 (
	.Q (IP[7:0]),
	.D (JM.Out[7:0]),
	.clk (clk)
    );
    ttl74273 D1 (
	.Q (IP[15:8]),
	.D (JM.Out[15:8]),
	.clk (clk)
    );
endmodule
