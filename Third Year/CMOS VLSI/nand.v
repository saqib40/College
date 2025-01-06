// Define the CMOS NAND Gate module
module nandgate (out, in1, in2);
    // Declarations of I/O, Power, and Ground
    output out;          // Output signal
    input in1, in2;      // Input signals
    supply1 pwr;         // Power supply (Vdd)
    supply0 gnd;         // Ground (Vss)
    wire contact;        // Internal connection between NMOS switches

    // Instantiate PMOS switches (parallel connection for NAND logic)
    pmos (out, pwr, in1);  // PMOS controlled by in1
    pmos (out, pwr, in2);  // PMOS controlled by in2

    // Instantiate NMOS switches (series connection for NAND logic)
    nmos (out, contact, in1); // NMOS controlled by in1
    nmos (contact, gnd, in2); // NMOS controlled by in2
endmodule


// Testbench for CMOS NAND Gate
module nandgate_test;
    reg in1, in2;   // Input signals (test stimulus)
    wire out;       // Output signal from the NAND gate

    // Instantiate the NAND gate module
    nandgate uut (out, in1, in2);

    // Apply stimulus to test the NAND gate behavior
    initial begin
        // Test case 1: in1 = 0, in2 = 0
        in1 = 1'b0; in2 = 1'b0; #10;

        // Test case 2: in1 = 0, in2 = 1
        in1 = 1'b0; in2 = 1'b1; #10;

        // Test case 3: in1 = 1, in2 = 0
        in1 = 1'b1; in2 = 1'b0; #10;

        // Test case 4: in1 = 1, in2 = 1
        in1 = 1'b1; in2 = 1'b1; #10;

        // End simulation
        $stop;
    end
endmodule
