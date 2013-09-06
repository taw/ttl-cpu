module ttl74153(Out, S, A, B, C, D);
    output [1:0] Out;
    input [1:0] S;
    input [1:0] A;
    input [1:0] B;
    input [1:0] C;
    input [1:0] D;

    assign #30 Out[0] =
	  ( S[1] &  S[0] & D[0])
	| ( S[1] & !S[0] & C[0])
	| (!S[1] &  S[0] & B[0])
	| (!S[1] & !S[0] & A[0]);

    assign #30 Out[1] =
	  ( S[1] &  S[0] & D[1])
	| ( S[1] & !S[0] & C[1])
	| (!S[1] &  S[0] & B[1])
	| (!S[1] & !S[0] & A[1]);

endmodule
