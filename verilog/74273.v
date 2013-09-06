module ttl74273(Q, D, clk);
    output [7:0] Q;
    input [7:0] D;
    input clk;
    reg [7:0] Q = 0;

    always@(posedge clk)
	#0 Q <= D;
endmodule
