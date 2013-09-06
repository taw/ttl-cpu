module rom_plusloop(Ma,Md);
    input [15:0] Ma;
    output [15:0] Md;
    
    assign #70 Md = 
	(Ma == 0) ? 16'h2500 :
	(Ma == 1) ? 16'h2500 :
	(Ma == 2) ? 16'h4900 :
	(Ma == 3) ? 16'h4901 :
	(Ma == 4) ? 16'h6D00 :
	(Ma == 5) ? 16'h6D06 :
	(Ma == 6) ? 16'h2412 :
	(Ma == 7) ? 16'h0F00 :
	            16'h0000;

endmodule
