module regbank(R1a,R1d,R2a,R2d,Wa,Wd1,Wd2,Wen,WS,clk);
    input [2:0] R1a;
    input [2:0] R2a;
    input [2:0] Wa;
    output [15:0] R1d;
    output [15:0] R2d;
    input [15:0] Wd1;
    input [15:0] Wd2;
    input Wen;
    input WS;
    input clk;

    wire [15:0] Wd;

    mux_2in_16b WdM (
	.A  (Wd1),
	.B  (Wd2),
	.Out(Wd),
	.S  (WS)
    );

    ttl7442 WM(.In (Wa), .En (Wen));

    reg16 R1(.D (Wd), .Wen (WM.Out[1]), .clk (clk));
    reg16 R2(.D (Wd), .Wen (WM.Out[2]), .clk (clk));
    reg16 R3(.D (Wd), .Wen (WM.Out[3]), .clk (clk));
    reg16 R4(.D (Wd), .Wen (WM.Out[4]), .clk (clk));
    reg16 R5(.D (Wd), .Wen (WM.Out[5]), .clk (clk));
    reg16 R6(.D (Wd), .Wen (WM.Out[6]), .clk (clk));
    reg16 R7(.D (Wd), .Wen (WM.Out[7]), .clk (clk));

    mux_8in_8b R1m0(
    .Out (R1d[7:0]),
    .S (R1a),
    .A (0),
    .B (R1.Q[7:0]),
    .C (R2.Q[7:0]),
    .D (R3.Q[7:0]),
    .E (R4.Q[7:0]),
    .F (R5.Q[7:0]),
    .G (R6.Q[7:0]),
    .H (R7.Q[7:0])
    );

    mux_8in_8b R1m1(
    .Out (R1d[15:8]),
    .S (R1a),
    .A (0),
    .B (R1.Q[15:8]),
    .C (R2.Q[15:8]),
    .D (R3.Q[15:8]),
    .E (R4.Q[15:8]),
    .F (R5.Q[15:8]),
    .G (R6.Q[15:8]),
    .H (R7.Q[15:8])
    );

    mux_8in_8b R2m0(
    .Out (R2d[7:0]),
    .S (R2a),
    .A (0),
    .B (R1.Q[7:0]),
    .C (R2.Q[7:0]),
    .D (R3.Q[7:0]),
    .E (R4.Q[7:0]),
    .F (R5.Q[7:0]),
    .G (R6.Q[7:0]),
    .H (R7.Q[7:0])
    );

    mux_8in_8b R2m1(
    .Out (R2d[15:8]),
    .S (R2a),
    .A (0),
    .B (R1.Q[15:8]),
    .C (R2.Q[15:8]),
    .D (R3.Q[15:8]),
    .E (R4.Q[15:8]),
    .F (R5.Q[15:8]),
    .G (R6.Q[15:8]),
    .H (R7.Q[15:8])
    );
endmodule
