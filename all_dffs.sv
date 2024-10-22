module all_dffs(
    input logic [3:0] nextS,       // Next state from the state logic
    input logic async_Reset,       // Asynchronous reset for the machine
    input logic button_Clock,      // Button press clock signal
    input logic clock_50MHz,       // 50 MHz internal clock
    output logic [3:0] sflipflop   // Output for the current state
);

logic db;                        // Debounced clock signal

// Debouncing the button clock
debouncer db_inst (
    .A_noisy(button_Clock), 
    .CLK50M(clock_50MHz), 
    .A(db)
);

// D flip-flop instances for storing the state
D_FF_neg D0 (
    .D(nextS[0]),
    .CLKb(db),                  // Use debounced clock
    .RSTb(async_Reset),        // Active-low reset
    .Q(sflipflop[0])
);

D_FF_neg D1 (
    .D(nextS[1]),
    .CLKb(db),
    .RSTb(async_Reset),
    .Q(sflipflop[1])
);

D_FF_neg D2 (
    .D(nextS[2]),
    .CLKb(db),
    .RSTb(async_Reset),
    .Q(sflipflop[2])
);

D_FF_neg D3 (
    .D(nextS[3]),
    .CLKb(db),
    .RSTb(async_Reset),
    .Q(sflipflop[3])
);

endmodule
