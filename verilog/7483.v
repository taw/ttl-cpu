module ttl7483(Out, Kout, A, B, Kin);
    output [3:0] Out;
    output Kout;
    input [3:0] A;
    input [3:0] B;
    input Kin;

    assign #50 {Kout,Out} = A + B + Kin;

endmodule
