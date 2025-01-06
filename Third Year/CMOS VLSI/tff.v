module tff(q, qbar, t, clk, rst);
    output q, qbar;       // Outputs: q and qbar
    input clk, t, rst;    // Inputs: clock, toggle input, reset
    reg tq;               // Internal register to store state

    // Always block for synchronous reset and T flip-flop logic
    always @(posedge clk or posedge rst) begin
        if (rst)          // If reset is high
            tq <= 1'b0;   // Reset the flip-flop
        else if (t)       // If toggle input is high
            tq <= ~tq;    // Toggle the state
    end

    assign q = tq;         // Assign q to internal register
    assign qbar = ~tq;     // Complement of q
endmodule

module tff_test;
    reg clk, t, rst;       // Inputs: clock, toggle input, reset
    wire q, qbar;          // Outputs: q and qbar

    // Instantiate T Flip-Flop
    tff t1(q, qbar, t, clk, rst);

    // Clock generation
    initial clk = 1'b0;    // Initialize clock to 0
    always #10 clk = ~clk; // Toggle clock every 10 ns

    // Stimulus block
    initial begin
        // Test sequence
        rst = 1'b1; t = 1'b0;       // Assert reset
        #15 rst = 1'b0;             // Deassert reset
        #25 t = 1'b1;               // Toggle input is high
        #300 t = 1'b0;              // Toggle input is low
        #100 t = 1'b1;              // Toggle input is high again
        #200 rst = 1'b1;            // Assert reset again
        #30 rst = 1'b0;             // Deassert reset
    end
endmodule
