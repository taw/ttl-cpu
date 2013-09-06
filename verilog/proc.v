module proc(Ma, Mrd, Mwd, Mwen, clk);
    output [15:0] Ma;
    input  [15:0] Mrd;
    output [15:0] Mwd;
    output Mwen;
    input  clk;
    
    wire [15:0] ALUout;
    wire [15:0] IW;
    reg  [15:0] IWshadow = 0;
    reg  IWhold = 0;

    control C (
	.Op  (IW[9:8]),
	.Op2 (IW[7:3]),
	.MWen (Mwen),
	.clk  (clk)
    );

    always @(posedge clk)
	IWshadow <= IW;
    always @(posedge clk)
	IWhold <= C.IWhold;

    mux_2in_16b IWMux (
	.Out(IW),
	.A(Mrd),
	.B(IWshadow),
	.S(IWhold)
    );
    regbank R (
	.R1a (IW[12:10]),
	.R2a (IW[ 2: 0]),
	.Wa  (IW[15:13]),
	.Wd1 (ALUout),
	.Wd2 (Mrd),
	.WS  (C.RwdS),
	.Wen (C.Rwen),
	.clk (clk)
    );
    alu16 ALU (
	.Out(ALUout),
	.A  (R.R1d),
	.B  (R.R2d),
	.C  ({R.R1d[7:0],IW[7:0]}),
	.Ai (IW[7]),
	.Bi (IW[6]),
	.Kin(IW[5]),
	.M  (C.M)
    );
    ip IP (
	.Next    (C.Next),
	.JumpEn  (C.JEn),
	.JumpAddr(R.R1d),
	.clk     (clk)
    );
    mux_2in_16b MM (
        .A (IP.IP),
	.B (R.R1d),
	.Out (Ma),
	.S (C.MAS)
    );
    assign Mwd = R.R2d;
endmodule
