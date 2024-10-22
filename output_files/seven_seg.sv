module seven_seg(
    input logic [3:0] switch,   
    output logic [6:0] led     
);

logic [8:0] num;

// Instantiate the d416 decoder
d416 decode(
    .X0(switch[0]),
    .X1(switch[1]),
    .X2(switch[2]),
    .X3(switch[3]),
    .Y(num)     
);

// 7-segment display logic
assign led[0] = ~(num[0] | num[2] | num[3] | num[5] | num[6] | num[7] | num[8]);
assign led[1] = ~(num[0] | num[1] | num[2] | num[3] | num[4] | num[7] | num[8]);
assign led[2] = ~(num[0] | num[1] | num[3] | num[4] | num[5] | num[6] | num[7] | num[8]);
assign led[3] = ~(num[0] | num[2] | num[3] | num[5] | num[6] | num[8]);
assign led[4] = ~(num[0] | num[2] | num[6] | num[8]);
assign led[5] = ~(num[0] | num[4] | num[5] | num[6] | num[8]);
assign led[6] = ~(num[2] | num[3] | num[4] | num[5] | num[6] | num[8]);

endmodule



