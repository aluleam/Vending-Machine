module change_s(
    input logic [3:0] A,             // 4-bit input (A[3:0])
    output logic [6:0] S              // 7-segment output to display change
);

logic [4:0] Y;

assign Y[0] = (A == 4'b0000 || A == 4'b0001 || A == 4'b0010 || A == 4'b0011 || A == 4'b0100);
assign Y[1] = (A == 4'b0101);
assign Y[2] = (A == 4'b0110);
assign Y[3] = (A == 4'b0111);
assign Y[4] = (A == 4'b1000);

assign S[0] = ~(Y[0] | Y[2] | Y[3]);
assign S[1] = ~(Y[0] | Y[1] | Y[2] | Y[3] | Y[4]);
assign S[2] = ~(Y[0] | Y[1] | Y[3] | Y[4]);
assign S[3] = ~(Y[0] | Y[2] | Y[3]);
assign S[4] = ~(Y[0] | Y[2]);
assign S[5] = ~(Y[0] | Y[4]);
assign S[6] = ~(Y[2] | Y[3] | Y[4]);

endmodule