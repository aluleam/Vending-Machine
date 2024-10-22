module d416 (
    input  logic X0, X1, X2, X3,
    output logic [8:0] Y
);

assign Y[0]  = ~X3 & ~X2 & ~X1 & ~X0;  // 0
assign Y[1]  = ~X3 & ~X2 & ~X1 &  X0;  // 1
assign Y[2]  = ~X3 & ~X2 &  X1 & ~X0;  // 2
assign Y[3]  = ~X3 & ~X2 &  X1 &  X0;  // 3
assign Y[4]  = ~X3 &  X2 & ~X1 & ~X0;  // 4
assign Y[5]  = ~X3 &  X2 & ~X1 &  X0;  // 5
assign Y[6]  = ~X3 &  X2 &  X1 & ~X0;  // 6
assign Y[7]  = ~X3 &  X2 &  X1 &  X0;  // 7
assign Y[8]  =  X3 & ~X2 & ~X1 & ~X0;  // 8

endmodule
