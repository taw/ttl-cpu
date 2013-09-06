module ttl74273(Q, D, clk);
    output [7:0] Q;
    input [7:0] D;
    input clk;
    reg [7:0] Q = 0;

    // ON 74LS273, simplified
    // timing requirements ignored
    // * data needs to be on D for 20ns before and 5ns after the pulse
    always@(posedge clk)
	#(0:18:27) Q <= D;
endmodule
