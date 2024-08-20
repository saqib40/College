// Define circuit parameters
Vcc = 12;           // Supply voltage in volts
R_B = 200*10^3;     // Base resistance in ohms
beta = 100;         // Current gain (hfe)
V_BE1 = 0.65;       // Initial base-emitter voltage in volts
V_BE2 = 0.5;        // Final base-emitter voltage in volts

// Calculate initial base and collector currents
I_B1 = (Vcc - V_BE1) / R_B;
I_C1 = beta * I_B1;

// Calculate final base and collector currents
I_B2 = (Vcc - V_BE2) / R_B;
I_C2 = beta * I_B2;

// Calculate changes in base and collector currents
deltaI_B = I_B2 - I_B1;
deltaI_C = I_C2 - I_C1;

// Display results
disp("The increase in base current due to change in V_BE is ", deltaI_B*10^6, "micro Ampere");
disp("The increase in collector current due to change in V_BE is ", deltaI_C*10^3, "mA");