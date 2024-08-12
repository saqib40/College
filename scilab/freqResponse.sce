// Define the Laplace variable
s = poly(0, 's');

// Define amplifier parameters
fL = 20;            // Lower cut-off frequency (Hz)
fH = 50*1e3;        // Upper cut-off frequency (Hz)
Av = 100;           // Mid-band gain

// Convert frequencies to angular frequencies (radians/second)
wL = 2*%pi*fL;
wH = 2*%pi*fH;

// Define the transfer function
h = syslin('c', (s*Av*wH)/((s+wL)*(s+wH)));

// Clear any existing plots
clf();

// Plot the Bode diagram (frequency response)
// Frequency range: 0.1 Hz to 10 MHz
bode(h, 1e-1, 1e7);