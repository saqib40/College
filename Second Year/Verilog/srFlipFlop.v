// SR Flip-Flop module
module SR_ff(sr, clk, reset, q, q_bar);
    // Input declarations
    input [2:0] sr;
    input clk, reset;  // Inputs for Set (s), Reset (r), Clock (clk), and Reset signal (reset)

    // Output declarations
    output q, q_bar;         // Outputs for the flip-flop (q) and its complement (q_bar)

    // Internal signal declarations
    reg q, q_bar;            // Registers to hold the current state (q) and its complement (q_bar)

    // Always block triggered on the rising edge of the clock
    always @(posedge clk) begin
        if (reset) begin
            // If the reset signal is high, reset the flip-flop
            q = 1'b0;        // Set q to 0
            q_bar = 1'b1;    // Set q_bar to 1
        end else begin
            // If reset is not active, evaluate the SR inputs
            case(sr)
                2'b00: begin
                    // No change condition: both S and R are 0
                    q = q;      // Keep q unchanged
                    q_bar = q_bar;  // Keep q_bar unchanged
                end
                2'b01: begin
                    // Reset condition: S is 0, R is 1
                    q = 1'b0;   // Set q to 0
                    q_bar = 1'b1;  // Set q_bar to 1
                end
                2'b10: begin
                    // Set condition: S is 1, R is 0
                    q = 1'b1;   // Set q to 1
                    q_bar = 1'b0;  // Set q_bar to 0
                end
                2'b11: begin
                    // Invalid condition: both S and R are 1
                    q = 1'bx;   // Set q to undefined (x)
                    q_bar = 1'bx;  // Set q_bar to undefined (x)
                end
            endcase
        end
    end
endmodule

