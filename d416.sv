module d416 (
	input  logic X0,X1,X2,X3, 
	output logic [8:0] Y	
);

assign Y[0]  = ~X[3] & ~X[2] & ~X[1] & ~X[0];
assign Y[1]  = ~X[3] & ~X[2] & ~X[1] &  X[0];
assign Y[2]  = ~X[3] & ~X[2] &  X[1] & ~X[0];
assign Y[3]  = ~X[3] & ~X[2] &  X[1] &  X[0];
assign Y[4]  = ~X[3] &  X[2] & ~X[1] & ~X[0];
assign Y[5]  = ~X[3] &  X[2] & ~X[1] &  X[0];
assign Y[6]  = ~X[3] &  X[2] &  X[1] & ~X[0];
assign Y[7]  = ~X[3] &  X[2] &  X[1] &  X[0];
assign Y[8]  =  X[3] & ~X[2] & ~X[1] & ~X[0];

endmodule