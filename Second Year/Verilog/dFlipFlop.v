// D Flip-Flop module
module dff_m(d, rst, clk, q, qbar);
    // Input declarations
    input d, rst, clk;       // Inputs for Data (d), Reset (rst), and Clock (clk)

    // Output declarations
    output reg q, qbar;      // Outputs for the flip-flop (q) and its complement (qbar)

    // Always block triggered on the rising edge of the clock
    always @(posedge clk) begin
        if (rst == 1) begin
            // If the reset signal is high, reset the flip-flop
            q = 1'b0;        // Set q to 0
            qbar = 1'b1;     // Set qbar to 1
        end else begin
            // If reset is not active, latch the D input to the outputs
            q = d;           // Set q to the value of d (data input)
            qbar = ~d;       // Set qbar to the complement of d
        end
    end
endmodule
