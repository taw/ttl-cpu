module alu4_tb;
    reg [1:0] M = 0;
    reg Ai = 0;
    reg Bi = 0;
    reg Kin = 0;
    reg [3:0] A = 0;
    reg [3:0] B = 0;
    
    wire Kout;
    wire [3:0] Out;
    
    alu4 ALU4(
	.M (M),
	.Ai (Ai),
	.Bi (Bi),
	.A (A),
	.B (B),
	.Kin (Kin),
	.Out (Out),
	.Kout (Kout)
    );
    
    initial begin
	$dumpfile ("alu4.vcd");
        $dumpvars;
    end
    
    always #100 {A,B,Kin,Ai,Bi,M} = {A,B,Kin,Ai,Bi,M} + 1;

    initial #10000 $finish;

endmodule
