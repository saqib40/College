module s_counter(clk, reset, count);
    input clk, reset;        // Inputs: clock and reset
    output reg [3:0] count;       // 4-bit output for the counter

    // Counter logic
    always @(posedge clk) begin
        if (reset)                // If reset is high
            count <= 4'b0000;     // Reset the counter to 0
        else
            count <= count + 4'b0001; // Increment the counter
    end
endmodule


module s_counter_test;
    reg clk, reset;             // Inputs: clock and reset
    wire [3:0] count;           // 4-bit output wire for the counter

    // Instantiate the Synchronous Counter
    s_counter m1(clk, reset, count);

    // Clock generation
    initial clk = 1'b0;         // Initialize clock to 0
    always #5 clk = ~clk;       // Toggle clock every 5 ns

    // Stimulus block
    initial begin
        // Display header for simulation results

        // Test sequence
        reset = 1'b1;           // Assert reset
        #15 reset = 1'b0;       // Deassert reset
        #30 reset = 1'b1;       // Assert reset
        #10 reset = 1'b0;       // Deassert reset
        #220 reset = 1'b1;      // Assert reset again
        #15 reset = 1'b0;       // Deassert reset
    end
endmodule
