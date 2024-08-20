// Define circuit parameters
V_CE = 5;           // Collector-Emitter voltage in volts
Vcc = 12;           // Supply voltage in volts
R_C = 2*10^3;       // Collector resistance in ohms
R_B = 200*10^3;     // Base resistance in ohms

// Calculate base current
I_B = (Vcc - 0.7) / R_B;  // 0.7V is the typical base-emitter voltage drop

// Calculate collector current
I_C = (Vcc - V_CE) / R_C;

// Calculate emitter current
I_E = I_B + I_C;

// Calculate current gain (hfe or β)
h_fe = I_C / I_B;

// Display results
disp("The value of hfe is ", h_fe);
disp("The value of emitter current is ", I_E);