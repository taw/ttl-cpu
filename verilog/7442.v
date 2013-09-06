// We're pretending here that it's octal-only decoder
// (Logic of Enabled is implicitely negated)

module ttl7442(Out, In, En);
    output [7:0] Out;
    input [2:0] In;
    input En;

    assign #20 Out[0] = En & !In[0] & !In[1] & !In[2];
    assign #20 Out[1] = En &  In[0] & !In[1] & !In[2];
    assign #20 Out[2] = En & !In[0] &  In[1] & !In[2];
    assign #20 Out[3] = En &  In[0] &  In[1] & !In[2];
    assign #20 Out[4] = En & !In[0] & !In[1] &  In[2];
    assign #20 Out[5] = En &  In[0] & !In[1] &  In[2];
    assign #20 Out[6] = En & !In[0] &  In[1] &  In[2];
    assign #20 Out[7] = En &  In[0] &  In[1] &  In[2];
endmodule
