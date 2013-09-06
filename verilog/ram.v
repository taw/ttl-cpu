module ram(Ma,Mrd,Mwd,Mwen);
    input [15:0] Ma;
    output [15:0] Mrd;
    input [15:0] Mwd;
    input Mwen;

    reg [15:0] M0 = 0;
    reg [15:0] M1 = 0;
    reg [15:0] M2 = 0;
    reg [15:0] M3 = 0;
    
    assign #70 Mrd = 
	(Ma == 0) ? 16'h0000 :
	(Ma == 1) ? 16'h9101 :
	(Ma == 2) ? 16'h9100 :
	(Ma == 3) ? 16'hB502 :
	(Ma == 4) ? 16'hB500 :
	(Ma == 5) ? 16'h2500 :
	(Ma == 6) ? 16'h2507 :
	(Ma == 7) ? 16'h5200 :
	(Ma == 8) ? 16'h4814 :
	(Ma == 9) ? 16'h1682 :
	(Ma ==10) ? 16'h9030 :
	(Ma ==11) ? 16'hB430 :
	(Ma ==12) ? 16'h0700 :
	(Ma == 16'h0100) ? 16'h00DE :
	(Ma == 16'h0101) ? 16'h00AD :
	(Ma == 16'h0102) ? 16'h00BE :
	(Ma == 16'h0103) ? 16'h00EF :
	(Ma == 16'h0200) ? M0 :
	(Ma == 16'h0201) ? M1 :
	(Ma == 16'h0202) ? M2 :
	(Ma == 16'h0203) ? M3 :
	            16'h0000;

    always #10 if (Mwen)
	#70 if (Ma == 16'h0200)
	    M0 <= Mwd;
	else if (Ma == 16'h0201)
	    M1 <= Mwd;
	else if (Ma == 16'h0202)
	    M2 <= Mwd;
	else if (Ma == 16'h0203)
	    M3 <= Mwd;

endmodule
