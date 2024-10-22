module outputResult(
    input logic [3:0] cState,         // Current state in shilling
    output logic [6:0] state,         // 7-segment display for the current state
    output logic [6:0] output_digit,  // 7-segment display for change
    output logic florin,              // Output for florin change
    output logic florin_c,            // Crown change output
    output logic shilling,            // Output for shilling change
    output logic dispense             // LED for dispense
);

seven_seg seven(
    .switch(cState),     
    .led(state)          
);

change_s change(
    .A(cState), 
    .S(output_digit)   
);

endmodule
