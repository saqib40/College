// Define circuit parameters
Vcc = 18;           // Supply voltage (V)
R1 = 100*10^3;      // Bias resistor 1 (Ω)
R2 = 47*10^3;       // Bias resistor 2 (Ω)
RC = 5.6*10^3;      // Collector resistance (Ω)
RE = 600;           // Emitter resistance (Ω)
RL = 1*10^3;        // Load resistance (Ω)
RS = 500;           // Source resistance (Ω)
hfe = 100;          // Current gain (β)
hie = 10^3;         // Input impedance (Ω)

// Calculate output impedance
Zo = 1 / (1/RC + 1/RL);

// Calculate input impedance
Zi = 1 / (1/hie + 1/R1 + 1/R2);

// Calculate current gain
Ai = -hfe * RS / (Zi + RS);

// Calculate voltage gain
Av = Ai * Zo / (Zi + RS);

// Calculate power gain
Ap = Ai * Av;

// Display results
disp("The current gain is ", Ai);
disp("The voltage gain is ", Av);
disp("The power gain is ", Ap);