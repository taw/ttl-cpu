/*
 * [0  0]__________[m  m]    ALU
 * [0  1]_______________     LDI
 * [1  0  0]____________     LD
 * [1  0  1]____________     ST
 * [1  1][k+ k- z+ z-]__     J
 *
 */

module control(
    Op,Op2,     // input
    Next,JEn,   // output for IP
    MWen,MAS,   // output for Mem,
    M,          // output for ALU
    OutZero,Carry, // input from ALU
    Rwen, RwdS, // output for RegBank
    IWhold,     // output for IW
    clk);       // clock

    input [1:0] Op;
    input [4:0] Op2;

    output Next;
    output JEn;

    output MWen;
    output MAS;
    
    output [1:0] M;  // as-
    
    input [1:0] OutZero;
    input Carry;
    
    output Rwen;
    output RwdS;

    output IWhold;

    input clk;

    reg FlagC = 0;
    reg FlagZ = 0;
    reg Phase2 = 0;
    
    always @(posedge clk)
	Phase2 <= IWhold;
    always @(posedge clk)
	if (!Op[0] & !Op[1])
	    FlagC <= Carry;
    always @(posedge clk)
	if (!Op[0] & !Op[1])
	    FlagC <= OutZero[0] & OutZero[1];

    wire jump_cond = (FlagC | !Op2[4]) & (!FlagC | !Op2[3]) & (FlagZ | !Op2[2]) & (!FlagZ | !Op2[1]);

    assign JEn = jump_cond & Op[0] & Op[1];

    assign MAS  = Phase2;
    assign MWen = Phase2 & Op2[4];
    assign RwdS = Phase2 & !Op2[4];
    assign Rwen = RwdS | !Op[1];
    
    assign IWhold = !Phase2 & Op[1] & !Op[0];
    assign Next = !IWhold;

    assign M[0] = (Op[0] & 1) | (!Op[0] & Op2[0]);
    assign M[1] = (Op[0] & 1) | (!Op[0] & Op2[1]);

endmodule
