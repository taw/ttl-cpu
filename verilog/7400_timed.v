module ttl7400(Out, A, B);
    output [3:0] Out;
    input [3:0] A;
    input [3:0] B;

    // ON 74LS00 datasheets (turn-on, turn-off)
    nand #(0:10:15,0:9:15) (Out[0], A[0], B[0]);
    nand #(0:10:15,0:9:15) (Out[1], A[1], B[1]);
    nand #(0:10:15,0:9:15) (Out[2], A[2], B[2]);
    nand #(0:10:15,0:9:15) (Out[3], A[3], B[3]);
endmodule
