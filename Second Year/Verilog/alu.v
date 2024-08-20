// 16-bit ALU module
module alu16(a, b, en, op, alu);
    // Input ports
    input [15:0] a, b;    // 16-bit input operands
    input en;             // Enable signal
    input [3:0] op;       // 4-bit operation selector
    
    // Output port
    output reg [31:0] alu; // 32-bit output result

    // Combinational logic block
    always @(a, b, en, op)
    begin
        if (en == 1'b1)   // ALU is enabled
            case (op)
                4'b0001: alu = a + b;    // Addition
                4'b0010: alu = a - b;    // Subtraction
                4'b0011: alu = ~a;       // Bitwise NOT of a
                4'b0100: alu = a * b;    // Multiplication
                4'b0101: alu = a & b;    // Bitwise AND
                4'b0110: alu = a | b;    // Bitwise OR
                4'b0111: alu = ~(a & b); // Bitwise NAND
                4'b1000: alu = a ^ b;    // Bitwise XOR
                default: alu = 32'b0;    // Default case: set output to zero
            endcase
        else 
            alu = 32'bZ;  // High impedance state when disabled
    end
endmodule

//testbench
module alu16_tb;
reg [15:0] a;
reg [15:0] b;
reg en;
reg [3:0] op;
wire [31:0] alu;
alu16 DUT(a,b,en,op,alu);
initial begin
$monitor (a,b,en,op,alu);
a = 16'b0000000000000000111;
b = 16'b0000000000000000101;
#50;
en = 1;op = 4'b0001; #50;
en = 1;op = 4'b0010; #50;
en = 1;op = 4'b0011; #50;
en = 1;op = 4'b0100; #50;
en = 1;op = 4'b0101; #50;
en = 1;op = 4'b0110; #50;
en = 1;op = 4'b0111; #50;
en = 1;op = 4'b1000; #50;
end
endmodule