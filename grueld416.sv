module grueld416 (
    input  logic X0, X1, X2, X3,   // 4 inputs
    output logic gruel
);
logic [8:0] Y; 

assign Y[0]  = ~X3 & ~X2 & ~X1 & ~X0;  // 0 shillings
assign Y[1]  = ~X3 & ~X2 & ~X1 &  X0;  // 1 shilling
assign Y[2]  = ~X3 & ~X2 &  X1 & ~X0;  // 2 shillings
assign Y[3]  = ~X3 & ~X2 &  X1 &  X0;  // 3 shillings
assign Y[4]  = ~X3 &  X2 & ~X1 & ~X0;  // 4 shillings
assign Y[5]  = ~X3 &  X2 & ~X1 &  X0;  // 5 shillings
assign Y[6]  = ~X3 &  X2 &  X1 & ~X0;  // 6 shillings
assign Y[7]  = ~X3 &  X2 &  X1 &  X0;  // 7 shillings
assign Y[8]  =  X3 & ~X2 & ~X1 & ~X0;  // 8 shillings (maximum)

assign gruel = Y[4] | Y[5] | Y[6] | Y[7] | Y[8];     

endmodule