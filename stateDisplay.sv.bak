module stateDisplay(
    input logic [3:0] state,         // 4-bit state input
    output logic [6:0] display       // 7-segment display output
);

    // Instantiate the seven_seg module
    seven_seg seg_inst (
        .switch(state),  
        .led(display) 
    );

endmodule