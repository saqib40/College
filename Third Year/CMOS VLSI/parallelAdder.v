// Parallel Adder Module
module padder (x, y, c_in, sum, c_out);
    input [3:0] x, y;     // 4-bit inputs
    input c_in;           // Carry input
    output [3:0] sum;     // 4-bit sum output
    output c_out;         // Carry output
    wire c1, c2, c3;      // Internal carry wires

    // Instantiate full adders for each bit
    fulladd stage0 (x[0], y[0], c_in, sum[0], c1);
    fulladd stage1 (x[1], y[1], c1, sum[1], c2);
    fulladd stage2 (x[2], y[2], c2, sum[2], c3);
    fulladd stage3 (x[3], y[3], c3, sum[3], c_out);
endmodule

// Full Adder Module
module fulladd (a, b, cin, s, cout);
    input a, b, cin;       // Inputs: a, b, carry-in
    output s, cout;        // Outputs: sum, carry-out
    assign s = a ^ b ^ cin; // XOR for sum
    assign cout = (a & b) | (b & cin) | (a & cin); // Carry logic
endmodule

module padder_test;
    reg [3:0] x, y;       // 4-bit registers for inputs
    reg c_in;             // Carry input
    wire [3:0] sum;       // 4-bit wire for sum
    wire c_out;           // Carry output wire

    // Instantiate the Parallel Adder
    padder a1 (x, y, c_in, sum, c_out);

    initial begin
        // Test cases
        x = 4'b0000; y = 4'b0000; c_in = 0; #10; // Test case 1: All zeros
        x = 4'b0001; y = 4'b0001; c_in = 0; #10; // Test case 2: 1 + 1
        x = 4'b1010; y = 4'b0101; c_in = 1; #10; // Test case 3: Random values with carry-in
        x = 4'b1111; y = 4'b1111; c_in = 1; #10; // Test case 4: Overflow scenario
        x = 4'b0110; y = 4'b0011; c_in = 0; #10; // Test case 5: Another random case
    end
endmodule
