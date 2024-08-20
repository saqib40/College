// Set the desired frequency of oscillation
fo = 1e3;  // Frequency in Hz (1 kHz)

// Calculate the period of the waveform
T = 1/fo;  // Period in seconds

// The period T is related to the RC time constant
// The formula is derived from the standard RC circuit: T = 2.2 * RC
C = 0.1e-6;  // Capacitance in Farads (0.1 µF)

// Calculate the required resistance value
R = T/(2.2*C);  // Resistance in ohms

// The duty cycle is given as 50%, so R1 = R2
R1 = 1e4;  // Resistance in ohms (10 kΩ)
R2 = 1e4;  // Resistance in ohms (10 kΩ)

// Print the calculated values of R and C
printf("The design values of R and C are %f kilohms and %f µF", R/1e3, C/1e-6);

// Define the saturation voltage of the op-amp
Vsat = 15;  // Saturation voltage in volts

// Create a time vector from 0 to 20 times the period T
t = 0:T:20*T;  // Time vector

// Generate a square wave with the calculated period
// The squarewave function generates a square wave with a period of T
s = Vsat * squarewave(t/(T));

// Clear the current figure
clf

// Plot the square wave output
plot(t/6, s)