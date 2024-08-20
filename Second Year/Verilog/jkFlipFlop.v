// Module definition for a JK Flip-Flop with reset functionality
module jkff_m (jk, rst, clk, q, qbar);
    
    // Port declarations
    input [1:0] jk;         // 2-bit input vector for J and K inputs
    input rst;              // Reset input
    input clk;              // Clock input
    output reg q, qbar;     // Outputs, q and its complement qbar, declared as reg because they will be assigned in the always block

    // Always block that triggers on the rising edge of the clock signal
    always @ (posedge clk)
    begin
        // If the reset signal is active (high)
        if (rst == 1)
        begin
            q = 1'b0;       // Set q to 0
            qbar = 1'b1;    // Set qbar to 1 (complement of q)
        end
        else
        // Case statement to handle the JK input combinations
        case (jk)
            2'b00: begin    // No change condition
                q = q;      // q remains unchanged
                qbar = qbar;// qbar remains unchanged
            end
            2'b01: begin    // Reset condition (J=0, K=1)
                q = 1'b0;   // Set q to 0
                qbar = 1'b1;// Set qbar to 1
            end
            2'b10: begin    // Set condition (J=1, K=0)
                q = 1'b1;   // Set q to 1
                qbar = 1'b0;// Set qbar to 0
            end
            2'b11: begin    // Toggle condition (J=1, K=1)
                q = ~q;     // q is toggled (complemented)
                qbar = ~qbar;// qbar is also toggled (complemented)
            end
            default: begin  // Default condition (should not occur in normal operation)
                q = 1'b0;   // Set q to 0
                qbar = 1'b1;// Set qbar to 1
            end
        endcase
    end
endmodule

// Testbench for the JK Flip-Flop module
module jkff_m_tb;

    // Signal declarations
    reg [1:0] jk;      // 2-bit register to store J and K inputs
    reg rst;           // Register to store the reset signal
    reg clk;           // Register to store the clock signal
    wire q;            // Wire to observe the q output of the JK flip-flop
    wire qbar;         // Wire to observe the qbar output (complement of q) of the JK flip-flop

    // Instantiate the JK flip-flop module
    jkff_m DUT (jk, rst, clk, q, qbar);

    // Clock generation: Toggles the clock signal every 20 time units
    always begin
        #20 clk = ~clk;  // Invert the clock signal after every 20 time units
    end

    // Initial block to apply test inputs
    initial begin
        clk = 1'b0;      // Initialize clock to 0
        jk = 2'b00;      // Set JK inputs to 00 (No change state)
        rst = 1'b1;      // Apply reset signal to initialize the flip-flop
        #100;            // Wait for 100 time units

        rst = 1'b0;      // Deactivate reset signal
        jk = 2'b00;      // Keep JK inputs at 00 (Hold state)
        #100;            // Wait for 100 time units

        jk = 2'b01;      // Set JK inputs to 01 (Reset state)
        #100;            // Wait for 100 time units

        jk = 2'b10;      // Set JK inputs to 10 (Set state)
        #80;             // Wait for 80 time units

        jk = 2'b11;      // Set JK inputs to 11 (Toggle state)
        #100;            // Wait for 100 time units
    end
endmodule
