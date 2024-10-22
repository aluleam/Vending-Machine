module vendingMachine(
    input logic [2:0] coin,          // Input signal representing the coins
    input logic async_Reset,         // Asynchronous reset for the machine
    input logic button_Clock,        // Clock signal triggered by a button press
    input logic clock_50MHz,         // 50 MHz internal system clock for timing

    output logic [6:0] state_digit,     // 7-segment display, shows current state of the machine
    output logic [6:0] output_digit,     // 7-segment display, shows the change
    output logic florin_Change,        // Shows change returned in florins
    output logic florin_change2,
    output logic shilling_Change,      // Shows change returned in shillings
    output logic [3:0] state_LEDS,     // Visual indication of the current state of the vending machine
    output logic dispense_gruel
);

logic [1:0] encoded;
logic [3:0] nextS;               // Next state from the state logic
logic [3:0] sflipflop;           // State storage
logic db, reset_db;              // Debounced signals for clock and reset
logic [3:0] changeInput;         // Input for change_s module
logic [6:0] changeDisplay;       // Output for change_s module

// Debouncing the button clock and async reset
debouncer clock_clk(.A_noisy(button_Clock), .CLK50M(clock_50MHz), .A(db));
debouncer reset_d(.A_noisy(async_Reset), .CLK50M(clock_50MHz), .A(reset_db));

// Encoding the inputs
encoder enc (.coins(coin), .encoded_value(encoded));

// State logic instantiation
state stateInst (
    .cState(sflipflop),
    .coin(encoded),
    .nextS(nextS)
);

// D flip-flops module instantiation
all_dffs dffs (
    .nextS(nextS),
    .async_Reset(reset_db), // Use debounced reset
    .button_Clock(db),      // Use debounced clock
    .clock_50MHz(clock_50MHz),
    .sflipflop(sflipflop)   // Output current state
);

// LED shows the state of the machine
 assign state_LEDS = sflipflop;

grueld416 d(
    .X0(sflipflop[0]), 
    .X1(sflipflop[1]), 
    .X2(sflipflop[2]), 
    .X3(sflipflop[3]), 
    .gruel(dispense_gruel)
);

// Output result logic
outputResult output_r( 
    .cState(sflipflop),
    .state(state_digit),
    .output_digit(output_digit)
);

change_s changeDiS(
    .A(changeInput),        
    .S(changeDisplay) 
);

endmodule