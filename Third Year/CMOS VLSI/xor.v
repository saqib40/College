// Define the CMOS XOR Gate module
module xorgate (out, a, b);
    // Declarations of I/O, Power, and Ground
    output out;       // Output signal
    input a, b;       // Input signals
    supply1 pwr;      // Power supply (Vdd)
    supply0 gnd;      // Ground (Vss)

    // Declaration of internal wires
    wire w1, w2, w3;

    // PMOS network
    pmos p1(w1,pwr,~b);
    pmos p2(w1,pwr,~a);
    pmos p3(out,w1,a);
    pmos p4(out,w1,b);

    // NMOS network
    nmos n1(out,w2,a);
    nmos n2(w2,gnd,b);
    nmos n3(out,w3,~a);
    nmos n4(w3,gnd,~b);
endmodule


// Testbench for CMOS XOR Gate
module xorgate_test;
    reg a, b;       // Input signals (test stimulus)
    wire out;       // Output signal from the XOR gate

    // Instantiate the XOR gate module
    xorgate uut (out, a, b);

    // Apply stimulus to test the XOR gate behavior
    initial begin
        // Test case 1: a = 0, b = 0
        a = 1'b0; b = 1'b0; #10;

        // Test case 2: a = 0, b = 1
        a = 1'b0; b = 1'b1; #10;

        // Test case 3: a = 1, b = 0
        a = 1'b1; b = 1'b0; #10;

        // Test case 4: a = 1, b = 1
        a = 1'b1; b = 1'b1; #10;

        // End simulation
        $stop;
    end
endmodule
