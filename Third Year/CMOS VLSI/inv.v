// Define the CMOS Inverter module
module inverter (out, in);
    // Declarations of I/O, Power, and Ground
    output out;         // Output signal
    input in;           // Input signal
    supply1 pwr;        // Power supply (Vdd)
    supply0 gnd;        // Ground (Vss)

    // Instantiate PMOS and NMOS switches
    pmos (out, pwr, in); // PMOS connected to power
    nmos (out, gnd, in); // NMOS connected to ground
endmodule


// Testbench for CMOS Inverter
module inv_test;
    reg in;       // Input signal (test stimulus)
    wire out;     // Output signal from the inverter

    // Instantiate the inverter module
    inverter i1 (out, in);

    // Apply stimulus to test the inverter behavior
    initial begin
        // Apply input values with a 10 ns delay between transitions
        in = 1'b0; #10; // Input = 0
        in = 1'b1; #10; // Input = 1
        in = 1'bx; #10; // Input = unknown (x)
        in = 1'bz; #10; // Input = high impedance (z)
        
        // End simulation
        $stop;
    end
endmodule
