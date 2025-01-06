// Define Inverter Module
module inverter (out, in);
    output out;  // Output signal
    input in;    // Input signal
    // NOT Gate
    not n1(out, in);  // Instantiate NOT gate
endmodule


// Define NAND Gate Module
module nandgate (out, in1, in2);
    output out;     // Output signal
    input in1, in2; // Input signals
    // NAND Gate
    nand n1(out, in1, in2);  // Instantiate NAND gate
endmodule


// Define NOR Gate Module
module norgate (out, in1, in2);
    output out;     // Output signal
    input in1, in2; // Input signals
    // NOR Gate
    nor n1(out, in1, in2);  // Instantiate NOR gate
endmodule
