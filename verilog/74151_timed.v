module ttl74151(Out, S, In);
    output Out;
    input [2:0] S;
    input [7:0] In;

    // ON 74LS151, simplified (Select -> Z)
    // data -> negZ is #(0:12:20)
    // select -> negZ is #(0:20:32)
    assign #(0:27:43) Out[0] =
	  ( S[2] &  S[1] &  S[0] & In[7])
	| ( S[2] &  S[1] & !S[0] & In[6])
	| ( S[2] & !S[1] &  S[0] & In[5])
	| ( S[2] & !S[1] & !S[0] & In[4])
	| (!S[2] &  S[1] &  S[0] & In[3])
	| (!S[2] &  S[1] & !S[0] & In[2])
	| (!S[2] & !S[1] &  S[0] & In[1])
	| (!S[2] & !S[1] & !S[0] & In[0]);
endmodule
