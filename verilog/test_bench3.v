module Bench2;
    reg clk = 0;
    wire [15:0] memory_data_bus;
    
    always
	#500 clk = !clk;

    proc PROC (
	.Mrd(memory_data_bus),
	.clk(clk)
    );
    ram RAM (
	.Ma(PROC.Ma),
	.Mrd(memory_data_bus),
	.Mwd(PROC.Mwd),
	.Mwen(PROC.Mwen)
    );
    
    initial begin
        $dumpfile ("ldst.vcd");
	$dumpvars;
    end

    initial #50000 $finish;

endmodule
