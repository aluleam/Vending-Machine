module state(
    input logic [3:0] cState,    // Current state of the vending machine
    input logic [1:0] coin,      // Encoded input
    output logic [3:0] nextS     // Next state of the vending machine
);

// Next state logic for the least significant bit S0
assign nextS[0] = (
    (coin[0]  &  ~coin[1]  &  ~cState[0]  &  ~cState[1]  &  ~cState[2]  &  ~cState[3]) | // S0 stays S0
    (~coin[0] &  ~coin[1]  &   cState[0]  &  ~cState[2]  &  ~cState[3]) | // S1 stays S1
    (coin[1]  &   cState[0]  &  ~cState[2]  &  ~cState[3]) | // S4 for (crown)
    (coin[0]  &  ~coin[1]  &  ~cState[0]  &   cState[1]  &  ~cState[2]  &  ~cState[3]) | // (shilling) S2
    (coin[0]  &  ~coin[1]  &   cState[0]  &   cState[1]  &   cState[2]  &  ~cState[3]) | // (shilling) S3
    (coin[0]  &  ~coin[1]  &  ~cState[1]  &   cState[2]  &  ~cState[3]) | // (shilling) to S4
    (coin[1]  &  ~cState[0]  &  ~cState[1]  &  ~cState[2]  &   cState[3]) | // (crown)
    (coin[0]  &   coin[1]  &  ~cState[1]  &  ~cState[2]  & ~cState[3])   // (both) S5
);

// Next state logic for S1
assign nextS[1] = (
    (coin[0]  &  ~coin[1]  &   cState[0]  &  ~cState[1]  &  ~cState[2]  &  ~cState[3]) | // (shilling) stays S1
    (~coin[0] &   coin[1]  &  ~cState[1]  &  ~cState[2]  &  ~cState[3]) | // (crown) S5
    (coin[0]  &  ~cState[0]  &   cState[1]  &  ~cState[2]  &  ~cState[3]) | // (shilling) S6
    (~coin[1] &  ~cState[0]  &   cState[1]  &  ~cState[2]  &  ~cState[3]) | // (no coin) stays S1
    (coin[0]  &   cState[0]  &   cState[1]  &   cState[2]  &  ~cState[3]) | // (shilling) to S3
    (coin[1]  &   cState[0]  &   cState[1]  &   cState[2]  &  ~cState[3]) | // (crown)
    (~coin[0] &   coin[1]  &  ~cState[1]  &   cState[2]  &  ~cState[3]) // (crown)
);

// Next state logic for S2
assign nextS[2] = (
    (coin[0]  &   coin[1]  &  ~cState[2]  &  ~cState[3]  &  ~cState[1]) | // (both) S5
    (coin[0]  &   cState[0]  &   cState[1]  &  ~cState[2]  &  ~cState[3]) | // (shilling) stays S2
    (coin[1]  &   cState[1]  &  ~cState[2]  &  ~cState[3]) | // (crown) S4
    (~coin[1] &  ~cState[0]  &  ~cState[1]  &   cState[2]  &  ~cState[3]) | // stays S2
    (~coin[0] &  ~cState[0]  &  ~cState[1]  &   cState[2]  &  ~cState[3]) | // stays S2
    (coin[0]  &   coin[1]  &   cState[0]  &   cState[2]  &  ~cState[3]) | // (both) to S5
    (coin[1]  &   cState[0]  &   cState[1]  &   cState[2]  &  ~cState[3]) | // (crown)
    (coin[0]  &  ~cState[0]  &  ~cState[1]  &  ~cState[2]  &   cState[3]) | // (shilling) to S4
    (coin[1]  &  ~cState[0]  &  ~cState[1]  &  ~cState[2]  &   cState[3])  // (crown)
);

// Next state logic for S3
assign nextS[3] = ((coin[0]  &   coin[1]  &  ~cState[0]  &  ~cState[1]  &   cState[2]  &  ~cState[3]));


endmodule
