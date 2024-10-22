module encoder(
    input logic [2:0] coins,
    output logic [1:0] encoded_value // Output encoded value
);

// Encoding logic
always_comb begin
    // Default to 00 (nothing)
    encoded_value = 2'b00; 

    if (coins[0]) // Shilling
        encoded_value = 2'b01; 
    else if (coins[1]) // Florin
        encoded_value = 2'b10; 
    else if (coins[2]) // Crown
        encoded_value = 2'b11; 
end

endmodule
