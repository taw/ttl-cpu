module ttl7430(Out, In);
    output Out;
    input [7:0] In;

    nand #10 (Out[0], In[0], In[1], In[2], In[3], In[4], In[5], In[6], In[7]);
endmodule
