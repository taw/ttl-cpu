module Test_Bench1;
    reg clk = 0;
    wire [15:0] MEMBUS_data;
    
    always
	#500 clk = !clk;

    proc PROC (
	.clk(clk),
	.Mrd(MEMBUS_data)

    );
    rom_plusloop ROM (
	.Ma(PROC.Ma),
	.Md(MEMBUS_data)
    );
    
    initial begin
        $dumpfile ("add_loop.vcd");
	$dumpvars;
    end

    initial #50000 $finish;

endmodule
