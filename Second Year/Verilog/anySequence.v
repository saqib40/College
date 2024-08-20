// Sequence Counter module
module asc_m(clk, rst, count);
    // Input declarations
    input clk, rst;            // Inputs for Clock (clk) and Reset (rst)

    // Output declarations
    output reg [3:0] count;    // 4-bit output register to hold the current state of the sequence

    // Always block triggered on the rising edge of the clock
    always @(posedge clk) begin
        if (rst) begin
            // Synchronous Reset: If reset is high, reset the counter
            count = 4'b0000;   // Set count to 0 (0000 in binary)
        end else begin
            // If reset is not active, advance the counter based on the current state
            case (count)
                4'b0000 : count = 4'b1000;   // If count is 0000, next state is 1000
                4'b1000 : count = 4'b0101;   // If count is 1000, next state is 0101
                4'b0101 : count = 4'b1101;   // If count is 0101, next state is 1101
                4'b1101 : count = 4'b0111;   // If count is 1101, next state is 0111
                4'b0111 : count = 4'b0000;   // If count is 0111, next state is 0000 (loop back to the start)
                // Additional states can be added here if needed
                // If an undefined state is encountered, the counter could be reset or handle it differently
            endcase
        end
    end
endmodule
