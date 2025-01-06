module dff(q, qbar, d, clk, rst);
    output q, qbar;        // Outputs: q and qbar
    input clk, d, rst;     // Inputs: clock, data, reset
    reg tq;                // Internal register to store state

    // Always block for synchronous reset and data input
    always @(posedge clk or posedge rst) begin
        if (rst)           // If reset is high
            tq <= 1'b0;    // Reset the flip-flop
        else               // Otherwise
            tq <= d;       // Store data on the rising edge of clk
    end

    assign q = tq;          // Assign q to internal register
    assign qbar = ~tq;      // Complement of q
endmodule


module dff_test;
    reg clk, d, rst;       // Inputs: clock, data, reset
    wire q, qbar;          // Outputs: q and qbar

    // Instantiate D Flip-Flop
    dff d1(q, qbar, d, clk, rst);

    // Clock generation
    initial clk = 1'b0;    // Initialize clock to 0
    always #10 clk = ~clk; // Toggle clock every 10 ns

    // Stimulus block
    initial begin
        // Test sequence
        rst = 1'b1; d = 1'b0;       // Assert reset
        #15 rst = 1'b0;             // Deassert reset
        #25 d = 1'b1;               // Apply input data
        #20 d = 1'b0;
        #20 d = 1'b1;
    end
endmodule
