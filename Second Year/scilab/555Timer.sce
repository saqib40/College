// Define circuit parameters
Ra = 5*10^3;        // Resistor A (ohms)
Rb = 5*10^3;        // Resistor B (ohms)
C = 0.1*10^-6;      // Capacitor (farads)

// Calculate ON time
T_ON = 0.69 * (Ra + Rb) * C;

// Calculate OFF time
T_OFF = 0.69 * Rb * C;

// Calculate total time period
T = T_ON + T_OFF;

// Calculate frequency
f = 1 / T;

// Display results
disp("Time period in milliseconds = ", T*10^3);
disp("Frequency of the waveform in kiloHertz = ", f/10^3);