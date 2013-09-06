module rom2(Ma,Md);
    input [15:0] Ma;
    output [15:0] Md;
    
    assign #70 Md = 
	(Ma == 0) ? 16'h0000 :
	(Ma == 1) ? 16'h2501 :
	(Ma == 2) ? 16'h2500 :
	(Ma == 3) ? 16'h6D00 :
	(Ma == 4) ? 16'h6D05 :
	(Ma == 5) ? 16'h4600 :
	(Ma == 6) ? 16'h2430 :
	(Ma == 7) ? 16'h0F00 :
	(Ma == 16'h0100) ? 16'h00DE :
	(Ma == 16'h0101) ? 16'h00AD :
	(Ma == 16'h0102) ? 16'h00BE :
	(Ma == 16'h0103) ? 16'h00EF :
	            16'h0000;

endmodule
