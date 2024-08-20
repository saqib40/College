// 4-bit BCD Asynchronous Reset Counter
module abcdc_m(clk, rst, count);
    // Input declarations
    input clk, rst;            // Inputs for Clock (clk) and Reset (rst)

    // Output declarations
    output reg [3:0] count;    // 4-bit output register to hold the BCD count value

    // Always block triggered on the rising edge of reset or clock
    always @(posedge rst, posedge clk) begin
        if (rst) begin
            // Asynchronous Reset: If reset is high, immediately reset the counter or 
            count = 4'b0000;   // Set count to 0
        end else if (clk) begin
            // If reset is not active and the clock signal rises
            if (count == 4'b1001) begin
                // If the count reaches 9 (1001 in binary), reset it to 0
                count = 4'b0000;  // Reset count to 0
            end else begin
                // Otherwise, increment the count by 1
                count = count + 1;
            end
        end
    end
endmodule

// 4-bit BCD Synchronous Reset Counter
module sbcdc_m(clk, rst, count);
    // Input declarations
    input clk, rst;            // Inputs for Clock (clk) and Reset (rst)

    // Output declarations
    output reg [3:0] count;    // 4-bit output register to hold the BCD count value

    // Always block triggered on the rising edge of the clock
    always @(posedge clk) begin
        if (rst == 1 || count == 4'b1001) begin
            // Synchronous Reset: If reset is high or the count reaches 9
            count = 4'b0000;   // Reset count to 0
        end else begin
            // Otherwise, increment the count by 1
            count = count + 1;
        end
    end
endmodule
